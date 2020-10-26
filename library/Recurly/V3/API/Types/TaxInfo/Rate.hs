module Recurly.V3.API.Types.TaxInfo.Rate where

import qualified Data.Scientific as Scientific

newtype TaxInfoRate =
    TaxInfoRate Rational
    deriving (Eq, Show)

instance FromJSON TaxInfoRate where
  parseJSON value = do
    scientific :: Scientific.Scientific <- parseJSON value
    pure . TaxInfoRate $ toRational scientific

taxInfoRateToRational :: TaxInfoRate -> Rational
taxInfoRateToRational (TaxInfoRate rational) = rational

rationalToTaxInfoRate :: Rational -> Maybe TaxInfoRate
rationalToTaxInfoRate rational = if rational >= 0 then Just $ TaxInfoRate rational else Nothing
