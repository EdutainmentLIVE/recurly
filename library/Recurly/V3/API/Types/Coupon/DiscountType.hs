module Recurly.V3.API.Types.Coupon.DiscountType where

import Recurlude

import qualified Data.Scientific as Scientific
import qualified Numeric.Natural as Natural

import qualified Recurly.V3.API.Types.Currency as Currency
import qualified Recurly.V3.API.Types.Money.Money as Money
import qualified Recurly.V3.API.Types.Subscription.UnitAmount as Subscription

-- | This should be a number between 1 and 100 inclusive. Zero is not allowed.
-- Fractional parts of percents are not allowed. This number represents the
-- percent discount to be applied at checkout. For example if you would pay $29
-- but you have a 10% discount (@PercentValue 10@), you would
-- only pay $26.10.
newtype PercentValue = PercentValue Natural.Natural
  deriving (Eq, Show, ToJSON)

instance TryFrom Natural.Natural PercentValue where
  tryFrom = maybeTryFrom
    $ \percent -> if percent > 0 && percent <= 100 then Just $ PercentValue percent else Nothing

instance From PercentValue Natural.Natural

instance From PercentValue Integer where
  from = via @Natural.Natural

-- | This should be a decimal number greater than or equal to 0. Note that
-- unlike percent discounts, you can have a fixed discount for $0.00. The
-- Recurly API does not show the decimal places if they would be 0. So a
-- discount of $10 would be sent as @10@, not @10.00@. This number represents
-- the price to be subtracted at checkout. For example if you would pay $29 but
-- you have a $10 discount (@FixedValue 10@), you would only pay
-- $19.
newtype FixedValue = FixedValue Money.DenseUSD
  deriving (Eq, Show, ToJSON)

instance TryFrom Money.DenseUSD FixedValue where
  tryFrom = maybeTryFrom $ \fixed -> if fixed >= 0 then Just $ FixedValue fixed else Nothing

instance From FixedValue Money.DenseUSD

data DiscountType = Percent PercentValue | Fixed FixedValue
  deriving (Eq, Show)

instance FromJSON DiscountType where
  parseJSON = withObject "CouponDiscountType" $ \object -> do
    type_ <- aesonRequired object "type"
    case type_ :: Text of
      "fixed" -> do
        currencies <- aesonRequired object "currencies"
        let
          maybeFixedValue = case filter isUsd currencies of
            [currency] -> do
              couponDiscountFixedValue <- hush . tryInto @FixedValue $ discountCurrencyAmount
                currency
              Just $ Fixed couponDiscountFixedValue
            _ -> Nothing
        maybeFail ("invalid fixed coupon: " <> show object) maybeFixedValue
      "percent" -> do
        percent <- aesonRequired object "percent"
        maybeFailWith ("invalid percent coupon: " <> show object) Percent
          . hush
          $ tryInto @PercentValue @Natural.Natural percent
      _ -> fail $ "unknown DiscountType: " <> show type_

-- | This is a value between 0 (not inclusive) and 1
percentToRational :: PercentValue -> Rational
percentToRational percent = into @Integer percent % 100

getDiscountFromSub :: DiscountType -> Subscription.UnitAmount -> Money.DenseUSD
getDiscountFromSub discountType subscriptionUnitAmount =
  let
    subUnitAmountDenseUSD = into @Money.DenseUSD subscriptionUnitAmount
    discountedDenseUSD = case discountType of
      Percent percent ->
        let
          rationalPercent = percentToRational percent
          rationalSubUnitAmount = Money.denseUSDToRationalDollars subUnitAmountDenseUSD
        in Money.rationalDollarsToDenseUSD' $ rationalSubUnitAmount * rationalPercent
      Fixed value -> into @Money.DenseUSD value
  in subUnitAmountDenseUSD - discountedDenseUSD

data DiscountCurrency = DiscountCurrency
  { discountCurrencyAmount :: Money.DenseUSD
  , discountCurrencyCurrency :: Currency.Currency
  }
  deriving (Eq, Show)

instance FromJSON DiscountCurrency where
  parseJSON = withObject "DiscountCurrency" $ \object -> do
    amountInDollars <- aesonRequired object "amount"
    currency <- aesonRequired object "currency"
    let
      denseUsd =
        Money.rationalDollarsToDenseUSD' $ toRational @Scientific.Scientific amountInDollars
    pure DiscountCurrency { discountCurrencyAmount = denseUsd, discountCurrencyCurrency = currency }

isUsd :: DiscountCurrency -> Bool
isUsd = (== Currency.USD) . discountCurrencyCurrency
