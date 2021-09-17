module Recurly.V3.Env.ApiUri where

import Recurlude

import qualified Network.URI as Uri
import qualified System.Envy as Envy

newtype ApiUri = ApiUri URI deriving (Show)

instance Envy.Var ApiUri where
  toVar = show
  fromVar = hush . tryInto @ApiUri

instance From URI ApiUri

instance From ApiUri URI

instance TryFrom String ApiUri where
  tryFrom = maybeTryFrom $ \uri -> fmap (into @ApiUri) $ Uri.parseAbsoluteURI uri
