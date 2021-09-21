module Recurly.V3.Types.RecurlyException where

import Recurlude

import qualified Data.Aeson as Aeson
import qualified Network.HTTP.Client as Client

data RecurlyException
  = ApiException RecurlyError
  | DecodeException ResponseError
  | ServerErrorException ResponseError
  | HttpException HttpError
    deriving Show

decode :: Text -> Text -> Client.Request -> RecurlyException
decode msg body req = DecodeException $ ResponseError msg body req

serverError :: Text -> Text -> Client.Request -> RecurlyException
serverError msg body req = ServerErrorException $ ResponseError msg body req

http :: Text -> Client.HttpException -> Client.Request -> RecurlyException
http msg exception req = HttpException $ HttpError msg exception req

data ResponseError = ResponseError
  { responseErrorMessage :: Text
  , responseErrorResponseBody :: Text
  , responseErrorRequest :: Client.Request
  }
  deriving Show

data HttpError = HttpError
  { httpErrorMessage :: Text
  , httpErrorException :: Client.HttpException
  , httpErrorRequest :: Client.Request
  }
  deriving Show

instance Exception RecurlyException where
  displayException = pShow

data RecurlyError = RecurlyError
  { recurlyErrorType :: ErrorType
  , recurlyErrorMessage :: String
  , recurlyErrorParams :: Maybe Aeson.Array
  }
  deriving Show

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
