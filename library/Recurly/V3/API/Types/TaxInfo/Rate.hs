module Recurly.V3.API.Types.TaxInfo.Rate where

import Recurlude

newtype TaxInfoRate =
    TaxInfoRate Rational
    deriving (Eq, Show)

instance FromJSON TaxInfoRate where
  parseJSON = withScientific "TaxInfoRate" $ eitherFail . tryInto @TaxInfoRate . toRational

instance TryFrom Rational TaxInfoRate where
  tryFrom =
    maybeTryFrom $ \rational -> if rational >= 0 then Just $ TaxInfoRate rational else Nothing

instance From TaxInfoRate Rational
