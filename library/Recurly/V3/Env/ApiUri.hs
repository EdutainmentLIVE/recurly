module Recurly.V3.Env.ApiUri where

import qualified Network.URI as Uri
import qualified System.Envy as Envy

newtype ApiUri = ApiUri Uri.URI deriving (Show)

instance Envy.Var ApiUri where
  toVar = show
  fromVar = stringToApiUri

stringToApiUri :: String -> Maybe ApiUri
stringToApiUri = fmap ApiUri . Uri.parseAbsoluteURI

apiUriToUri :: ApiUri -> Uri.URI
apiUriToUri (ApiUri uri) = uri
