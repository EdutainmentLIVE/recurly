module Recurly.V3.Http where

import Recurlude

import qualified Control.Concurrent as Concurrent
import qualified Control.Exception as Exception
import qualified Data.Aeson as Aeson
import qualified Data.ByteString as ByteString
import qualified Data.ByteString.Lazy as LazyByteString
import qualified Data.Text as Text
import qualified Data.Word as Word
import qualified Network.HTTP.Client as Client
import qualified Network.HTTP.Client.TLS as Tls
import qualified Network.HTTP.Types as Http
import qualified Network.URI as URI
import qualified System.Random as Random
import qualified Text.Printf as Printf

import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import qualified Recurly.V3.Recurly as Recurly
import Recurly.V3.Types.RecurlyException (RecurlyException(..))
import qualified Recurly.V3.Types.RecurlyException as RecurlyException

makeRequest :: [PathPiece.PathPiece] -> Recurly.Recurly Client.Request
makeRequest path = do
  env <- Recurly.env
  let
    uri = into @URI $ Recurly.recurlyApiUrl env
    pathValues = fmap (into @Text) path
  Client.requestFromURI uri { URI.uriPath = into @String $ "/" <> Text.intercalate "/" pathValues }

sendRequestRaw
  :: Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyException LazyByteString.ByteString))
sendRequestRaw request = do
  token <- fmap Recurly.recurlyToken Recurly.env
  requestId <- liftIO Random.randomIO
  sendRequestWith requestId 1
    . withRequestHeader Http.hAccept "application/vnd.recurly.v2021-02-25+json"
    . withRequestHeader Http.hContentType "application/json"
    . Client.applyBasicAuth (into @ByteString token) ByteString.empty
    $ request

withNotFoundHandler
  :: Recurly.Recurly (Client.Response (Either RecurlyException (Maybe a)))
  -> Recurly.Recurly (Client.Response (Either RecurlyException (Maybe a)))
withNotFoundHandler responseM = do
  response <- responseM
  let
    isNotFoundError = case Client.responseBody response of
      Left err -> case err of
        ApiException recurlyErr ->
          RecurlyException.recurlyErrorType recurlyErr == RecurlyException.NotFound
        _ -> False
      _ -> False
  pure $ if isNotFoundError then response { Client.responseBody = Right Nothing } else response

sendRequest
  :: FromJSON json
  => Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyException json))
sendRequest request = do
  response <- sendRequestRaw request
  case Client.responseBody response of
    Left err -> pure $ response { Client.responseBody = Left err }
    Right body -> case Aeson.eitherDecode body of
      Right decodedJson -> pure $ response { Client.responseBody = Right decodedJson }
      Left aesonErr -> pure $ response
        { Client.responseBody = Left
          $ RecurlyException.decode (into @Text aesonErr) (into @Text $ show body) request
        }

sendRequestList
  :: (FromJSON json)
  => Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyException [json]))
sendRequestList = sendRequestListWith []

sendRequestListWith
  :: (FromJSON json)
  => [json]
  -> Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyException [json]))
sendRequestListWith acc request = do
  env <- Recurly.env
  let uri = into @URI $ Recurly.recurlyApiUrl env
  response <- sendRequest request
  case Client.responseBody response of
    Left err -> pure $ response { Client.responseBody = Left err }
    Right get ->
      let accData = acc <> recurlyData get
      in
        case (recurlyGetHasMore get, recurlyGetNext get) of
          (True, Just path) -> do
            -- This path could have query params as well, but we are assuming that the query params will already be
            -- url encoded.
            modifiedRequest <- Client.requestFromURI $ uri { URI.uriPath = into @String path }
            sendRequestListWith accData modifiedRequest
          (_, _) -> pure $ response { Client.responseBody = Right accData }

data RecurlyGet a = RecurlyGet
  { recurlyGetHasMore :: Bool
  , recurlyGetNext :: Maybe Text
  , recurlyData :: [a]
  }

instance FromJSON a => FromJSON (RecurlyGet a) where
  parseJSON = withObject "RecurlyGet" $ \obj -> do
    hasMore <- aesonRequired obj "has_more"
    next <- aesonOptional obj "next"
    data_ <- aesonRequired obj "data"
    pure RecurlyGet { recurlyGetHasMore = hasMore, recurlyGetNext = next, recurlyData = data_ }

sendRequestWith
  :: RequestId
  -> Natural
  -> Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyException LazyByteString.ByteString))
sendRequestWith requestId attempt request = do
  maxAttempts <- fmap Recurly.recurlyMaxAttempts Recurly.env
  manager <- liftIO Tls.getGlobalManager
  logLn' requestId
    $ "sending request: "
    <> requestMethod request
    <> " "
    <> requestPath request
    <> " (attempt "
    <> show attempt
    <> " of "
    <> show maxAttempts
    <> ")"
  result <- liftIO . Exception.tryJust keepResponseTimeout $ Client.httpLbs request manager
  case result of
    Left exception -> handleTimeout requestId attempt request exception
    Right response -> do
      let body = Client.responseBody response
      logLn' requestId $ "received response: " <> show (responseCode response)
      case Client.responseStatus response of
        status
          | Http.statusIsServerError status -> handleServerError requestId attempt request response
          | Http.statusIsSuccessful status -> do
            pure $ response { Client.responseBody = Right body }
          | otherwise -> do
            let
              decodedBody = case Aeson.eitherDecode body of
                Right recurlyError -> ApiException recurlyError
                Left aesonErr ->
                  RecurlyException.decode (into @Text aesonErr) (into @Text $ show body) request
            pure $ response { Client.responseBody = Left decodedBody }

keepResponseTimeout :: Client.HttpException -> Maybe Client.HttpException
keepResponseTimeout exception = case exception of
  Client.HttpExceptionRequest _ Client.ResponseTimeout -> Just exception
  _ -> Nothing

handleServerError
  :: Show body
  => RequestId
  -> Natural
  -> Client.Request
  -> Client.Response body
  -> Recurly.Recurly
       (Client.Response (Either RecurlyException LazyByteString.ByteString))
handleServerError requestId attempt request response = do
  maxAttempts <- fmap Recurly.recurlyMaxAttempts Recurly.env
  logLn' requestId $ "Encountered server error with code: " <> show (responseCode response)
  if attempt > into @Natural maxAttempts
    then do
      logLn' requestId $ "Giving up after " <> pluralize "attempt" attempt
      let body = into @Text . show $ Client.responseBody response
      pure $ response
        { Client.responseBody = Left
          $ RecurlyException.serverError "Recurly API V3 failed" body request
        }
    else do
      let delay = 1 :: Int
      logLn' requestId $ "Waiting " <> pluralize "second" delay <> " for good measure"
      liftIO . Concurrent.threadDelay $ delay * 1000000
      sendRequestWith requestId (attempt + 1) request

handleTimeout
  :: RequestId
  -> Natural
  -> Client.Request
  -> Client.HttpException
  -> Recurly.Recurly
       (Client.Response (Either RecurlyException LazyByteString.ByteString))
handleTimeout requestId attempt request exception = do
  maxAttempts <- fmap Recurly.recurlyMaxAttempts Recurly.env
  logLn' requestId "Request timed out"
  when (attempt > into @Natural maxAttempts) $ do
    logLn' requestId $ "Giving up after " <> pluralize "attempt" attempt
    throwWithCallStack $ RecurlyException.http "Recurly API V3 timed out" exception request
  sendRequestWith requestId (attempt + 1) request

pluralize :: (Eq count, Num count, Show count) => String -> count -> String
pluralize word count = concat [show count, " ", word, if count == 1 then "" else "s"]

logLn' :: MonadIO io => RequestId -> String -> io ()
logLn' requestId message = logLn $ "[recurly-api-v3] " <> show requestId <> ": " <> message

requestMethod :: Client.Request -> String
requestMethod = fromRight "?" . tryInto @String . Client.method

requestPath :: Client.Request -> String
requestPath = fromRight "?" . tryInto @String . Client.path

responseCode :: Client.Response a -> Int
responseCode = statusCode . Client.responseStatus

withRequestHeader :: HeaderName -> ByteString.ByteString -> Client.Request -> Client.Request
withRequestHeader name value req =
  req { Client.requestHeaders = (name, value) : Client.requestHeaders req }

newtype RequestId = RequestId Word.Word16 deriving (Eq, Random.Random)

requestIdToWord16 :: RequestId -> Word.Word16
requestIdToWord16 (RequestId word16) = word16

instance Show RequestId where
  show = Printf.printf "%04x" . requestIdToWord16
