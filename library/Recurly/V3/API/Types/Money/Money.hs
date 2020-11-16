module Recurly.V3.API.Types.Money.Money where

import qualified Data.Scientific as Scientific
import qualified Money

-- | Thin wrapper around `Money.Dense "USD"`.
newtype DenseUSD = DenseUSD (Money.Dense "USD") deriving (Eq, Show, Ord, Num)

-- | Default FromJSON instance to convert json dollars into `DenseUSD` represented by `Money.defaultDecimalConf`
instance FromJSON DenseUSD where
  parseJSON value = do
    scientific <- fmap formatScientificFixed $ parseJSON value
    case Money.denseFromDecimal Money.defaultDecimalConf scientific of
      Nothing -> fail $ "Could not parse denseUSD: " <> show value
      Just dense -> pure $ DenseUSD dense

formatScientificFixed :: Scientific.Scientific -> Text
formatScientificFixed = stringToText . Scientific.formatScientific Scientific.Fixed (Just 4)

-- | Default ToJSON instance to convert `DenseUSD` into json dollars represented by `Money.defaultDecimalConf`.
-- Also rounds half up.
instance ToJSON DenseUSD where
  toJSON = toJSON . Money.denseToDecimal Money.defaultDecimalConf Money.Round . denseUSDToDense

-- | Converts Rational *DOLLARS* into `DenseUSD`.
-- From Money documentation:
-- Notice that dense returns Nothing in case the given Rational's denominator is zero,
-- which although unlikely, it is possible if the Rational was unsafely constructed.
rationalDollarsToDenseUSD :: Rational -> Maybe DenseUSD
rationalDollarsToDenseUSD = fmap DenseUSD . Money.dense

-- | Convert Rational *DOLLARS* into `DenseUSD`
-- If not creating Rational from user input you can safely use this function.
-- For example, if external input is `toRational 1000`. You can safely use this function.
-- Otherwise if creating a Rational with a denominator of 0 would cause a pure exception.
rationalDollarsToDenseUSD' :: Rational -> DenseUSD
rationalDollarsToDenseUSD' = DenseUSD . Money.dense'

-- | Converts `DenseUSD` into dollars represented by Rational
denseUSDToRationalDollars :: DenseUSD -> Rational
denseUSDToRationalDollars = toRational . denseUSDToDense

denseUSDToDense :: DenseUSD -> Money.Dense "USD"
denseUSDToDense (DenseUSD dense) = dense
