module Recurly.V3.API.Types.TaxInfo.Rate where

import Recurlude

newtype Rate = Rate Rational
    deriving (Eq, Show)

instance FromJSON Rate where
  parseJSON = withScientific "TaxInfoRate" $ eitherFail . tryInto @Rate . toRational

instance TryFrom Rational Rate where
  tryFrom = maybeTryFrom $ \rational -> if rational >= 0 then Just $ Rate rational else Nothing

instance From Rate Rational
