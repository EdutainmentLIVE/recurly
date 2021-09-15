module Recurly.V3.API.Types.Invoice.NetTerms where

import Recurlude

newtype NetTerms = NetTerms Integer
    deriving (Eq, Show, FromJSON)

instance TryFrom Integer NetTerms where
  tryFrom = maybeTryFrom $ \netTerms -> if netTerms >= 0 then Just $ NetTerms netTerms else Nothing

instance From NetTerms Integer
