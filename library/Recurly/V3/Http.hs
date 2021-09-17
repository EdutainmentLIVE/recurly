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
import qualified Recurly.V3.Env.ApiUri as Env
import qualified Recurly.V3.Env.MaxAttempts as Env
import qualified Recurly.V3.Recurly as Recurly

makeRequest :: [PathPiece.PathPiece] -> Recurly.Recurly Client.Request
makeRequest path = do
  env <- Recurly.env
  let
    uri = Env.apiUriToUri $ Recurly.recurlyApiUrl env
    pathValues = fmap (into @Text) path
  Client.requestFromURI uri { URI.uriPath = into @String $ "/" <> Text.intercalate "/" pathValues }

sendRequestRaw
  :: Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyError LazyByteString.ByteString))
sendRequestRaw request = do
  token <- fmap Recurly.recurlyToken Recurly.env
  requestId <- liftIO Random.randomIO
  sendRequestWith requestId 1
    . withRequestHeader Http.hAccept "application/vnd.recurly.v2021-02-25+json"
    . withRequestHeader Http.hContentType "application/json"
    . Client.applyBasicAuth (into @ByteString token) ByteString.empty
    $ request

withNotFoundHandler
  :: Recurly.Recurly (Client.Response (Either RecurlyError (Maybe a)))
  -> Recurly.Recurly (Client.Response (Either RecurlyError (Maybe a)))
withNotFoundHandler responseM = do
  response <- responseM
  pure $ case Client.responseBody response of
    Left err | recurlyErrorType err == NotFound -> response { Client.responseBody = Right Nothing }
    _ -> response

sendRequest
  :: FromJSON json => Client.Request -> Recurly.Recurly (Client.Response (Either RecurlyError json))
sendRequest request = do
  response <- sendRequestRaw request
  case Client.responseBody response of
    Left err -> pure $ response { Client.responseBody = Left err }
    Right json -> do
      decodedJson <- either (fail . (<> show json)) pure $ Aeson.eitherDecode json
      pure $ response { Client.responseBody = Right decodedJson }

sendRequestList
  :: (FromJSON json)
  => Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyError [json]))
sendRequestList = sendRequestListWith []

sendRequestListWith
  :: (FromJSON json)
  => [json]
  -> Client.Request
  -> Recurly.Recurly (Client.Response (Either RecurlyError [json]))
sendRequestListWith acc request = do
  env <- Recurly.env
  let uri = Env.apiUriToUri $ Recurly.recurlyApiUrl env
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
  -> Recurly.Recurly (Client.Response (Either RecurlyError LazyByteString.ByteString))
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
            decodedBody <- either (fail . (<> show body)) pure $ Aeson.eitherDecode body
            pure $ response { Client.responseBody = Left decodedBody }

data RecurlyError = RecurlyError
  { recurlyErrorType :: ErrorType
  , recurlyErrorMessage :: String
  , recurlyErrorParams :: Maybe Aeson.Array
  }
  deriving (Eq, Show)

instance Exception RecurlyError

instance FromJSON RecurlyError where
  parseJSON = withObject "RecurlyError" $ \obj -> do
    err <- aesonRequired obj "error"
    RecurlyError <$> aesonRequired err "type" <*> aesonRequired err "message" <*> aesonOptional
      err
      "params"

data ErrorType
  = BadRequest
  | InternalServerError
  | ImmutableSubscription
  | InvalidApiKey
  | InvalidApiVersion
  | InvalidContentType
  | InvalidPermissions
  | InvalidToken
  | NotFound
  | SimultaneousRequest
  | Transaction
  | Unauthorized
  | UnavailableInApiVersion
  | UnknownApiVersion
  | Validation
  | MissingFeature
  | RateLimited
  | ServiceNotAvailable
  deriving (Eq, Show)

instance FromJSON ErrorType where
  parseJSON value = do
    string <- parseJSON value
    eitherFail $ stringToErrorType string

stringToErrorType :: String -> Either String ErrorType
stringToErrorType errorType = case errorType of
  "bad_request" -> Right BadRequest
  "internal_server_error" -> Right InternalServerError
  "immutable_subscription" -> Right ImmutableSubscription
  "invalid_api_key" -> Right InvalidApiKey
  "invalid_api_version" -> Right InvalidApiVersion
  "invalid_content_type" -> Right InvalidContentType
  "invalid_permissions" -> Right InvalidPermissions
  "invalid_token" -> Right InvalidToken
  "not_found" -> Right NotFound
  "simultaneous_request" -> Right SimultaneousRequest
  "transaction" -> Right Transaction
  "unauthorized" -> Right Unauthorized
  "unavailable_in_api_version" -> Right UnavailableInApiVersion
  "unknown_api_version" -> Right UnknownApiVersion
  "validation" -> Right Validation
  "missing_feature" -> Right MissingFeature
  "rate_limited" -> Right RateLimited
  "service_not_available" -> Right ServiceNotAvailable
  _ -> Left $ "Unknown error type: " <> errorType

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
       (Client.Response (Either RecurlyError LazyByteString.ByteString))
handleServerError requestId attempt request response = do
  maxAttempts <- fmap Recurly.recurlyMaxAttempts Recurly.env
  logLn' requestId $ "Encountered server error with code: " <> show (responseCode response)
  when (attempt > Env.maxAttemptsToNatural maxAttempts) $ do
    logLn' requestId $ "Giving up after " <> pluralize "attempt" attempt
    fail $ unlines ["Recurly API V3 failed", show request, show response]
  let delay = 1 :: Int
  logLn' requestId $ "Waiting " <> pluralize "second" delay <> " for good measure"
  liftIO . Concurrent.threadDelay $ delay * 1000000
  sendRequestWith requestId (attempt + 1) request

handleTimeout
  :: RequestId
  -> Natural
  -> Client.Request
  -> Client.HttpException
  -> Recurly.Recurly (Client.Response (Either RecurlyError LazyByteString.ByteString))
handleTimeout requestId attempt request exception = do
  maxAttempts <- fmap Recurly.recurlyMaxAttempts Recurly.env
  logLn' requestId "Request timed out"
  when (attempt > Env.maxAttemptsToNatural maxAttempts) $ do
    logLn' requestId $ "Giving up after " <> pluralize "attempt" attempt
    fail $ unlines ["Recurly API V3 timed out", show request, show exception]
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
