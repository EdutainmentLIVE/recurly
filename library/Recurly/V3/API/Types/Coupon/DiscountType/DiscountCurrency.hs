module Recurly.V3.API.Types.Coupon.DiscountType.DiscountCurrency where

import Recurlude

import qualified Data.Scientific as Scientific

import qualified Recurly.V3.API.Types.Currency as Currency
import qualified Recurly.V3.API.Types.Money.Money as Money

data DiscountCurrency = DiscountCurrency
  { amount :: Money.DenseUSD
  , currency :: Currency.Currency
  }
  deriving (Eq, Show)

instance FromJSON DiscountCurrency where
  parseJSON = withObject "DiscountCurrency" $ \object -> do
    amountInDollars <- aesonRequired object "amount"
    currency <- aesonRequired object "currency"
    let
      denseUsd =
        Money.rationalDollarsToDenseUSD' $ toRational @Scientific.Scientific amountInDollars
    pure DiscountCurrency { amount = denseUsd, currency = currency }

isUsd :: DiscountCurrency -> Bool
isUsd = (== Currency.USD) . currency
