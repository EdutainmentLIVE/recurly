module Recurly.V3.Env.Token where

import qualified Data.ByteString as ByteString
import qualified Data.Text.Encoding as Text
import qualified System.Envy as Envy

newtype Token = Token ByteString.ByteString deriving (Envy.Var)

tokenToByteString :: Token -> ByteString.ByteString
tokenToByteString (Token bs) = bs

textToToken :: Text -> Token
textToToken = Token . Text.encodeUtf8
