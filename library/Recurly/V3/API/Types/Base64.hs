module Recurly.V3.API.Types.Base64 where

import Recurlude

import qualified Control.Exception as Exception
import qualified Data.Aeson as Aeson
import qualified Data.ByteArray.Encoding as BA
import qualified Data.ByteString as ByteString
import qualified Data.Text.Encoding as TE

newtype Base64 = Base64 ByteString.ByteString
  deriving (Eq, Show)

toByteString :: Base64 -> ByteString.ByteString
toByteString (Base64 bs) = bs

instance FromJSON Base64 where
  parseJSON =
    Aeson.withText "Base64" $ eitherFailWith Base64 . BA.convertFromBase BA.Base64 . TE.encodeUtf8

instance ToJSON Base64 where
  toJSON =
    Aeson.String
      . either (Exception.throw $ Base64Exception "err converting from Base64 to JSON") id
      . utf8ToText
      . BA.convertToBase BA.Base64
      . toByteString

newtype Base64Exception = Base64Exception String
  deriving (Eq, Show)

instance Exception Base64Exception
