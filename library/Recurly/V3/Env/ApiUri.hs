module Recurly.V3.Env.ApiUri where

import Recurlude

import qualified Network.URI as Uri
import qualified System.Envy as Envy

newtype ApiUri = ApiUri URI deriving (Show)

instance Envy.Var ApiUri where
  toVar = show
  fromVar = stringToApiUri

stringToApiUri :: String -> Maybe ApiUri
stringToApiUri = fmap ApiUri . Uri.parseAbsoluteURI

apiUriToUri :: ApiUri -> URI
apiUriToUri (ApiUri uri) = uri
