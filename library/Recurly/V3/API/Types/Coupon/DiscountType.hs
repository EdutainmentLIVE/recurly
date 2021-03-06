module Recurly.V3.API.Types.Coupon.DiscountType where

import Recurlude

import qualified Data.Scientific as Scientific
import qualified Numeric.Natural as Natural

import qualified Recurly.V3.API.Types.Currency as Types
import qualified Recurly.V3.API.Types.Money.Money as Types
import qualified Recurly.V3.API.Types.Subscription.UnitAmount as Types

-- | This should be a number between 1 and 100 inclusive. Zero is not allowed.
-- Fractional parts of percents are not allowed. This number represents the
-- percent discount to be applied at checkout. For example if you would pay $29
-- but you have a 10% discount (@CouponDiscountPercentValue 10@), you would
-- only pay $26.10.
newtype CouponDiscountPercentValue =
  CouponDiscountPercentValue Natural.Natural
  deriving (Eq, Show, ToJSON)

-- | This should be a decimal number greater than or equal to 0. Note that
-- unlike percent discounts, you can have a fixed discount for $0.00. The
-- Recurly API does not show the decimal places if they would be 0. So a
-- discount of $10 would be sent as @10@, not @10.00@. This number represents
-- the price to be subtracted at checkout. For example if you would pay $29 but
-- you have a $10 discount (@CouponDiscountFixedValue 10@), you would only pay
-- $19.
newtype CouponDiscountFixedValue =
  CouponDiscountFixedValue Types.DenseUSD
  deriving (Eq, Show, ToJSON)

data CouponDiscountType = Percent CouponDiscountPercentValue | Fixed CouponDiscountFixedValue
  deriving (Eq, Show)

instance FromJSON CouponDiscountType where
  parseJSON = withObject "CouponDiscountType" $ \object -> do
    tipe <- aesonRequired object "type"
    case tipe :: Text of
      "fixed" -> do
        currencies <- aesonRequired object "currencies"
        let
          maybeFixedValue = case filter isUsd currencies of
            [currency] -> do
              couponDiscountFixedValue <- denseUSDToCouponDiscountFixedValue
                $ discountCurrencyAmount currency
              Just $ Fixed couponDiscountFixedValue
            _ -> Nothing
        maybeFail ("invalid fixed coupon: " <> show object) maybeFixedValue
      "percent" -> do
        percent <- aesonRequired object "percent"
        maybeFailWith ("invalid percent coupon: " <> show object) Percent
          $ naturalToCouponDiscountPercentValue percent
      _ -> fail $ "unknown CouponDiscountType: " <> show tipe

deprecatedHardcodedThirtyPercentValue :: CouponDiscountPercentValue
deprecatedHardcodedThirtyPercentValue = CouponDiscountPercentValue 30

naturalToCouponDiscountPercentValue :: Natural.Natural -> Maybe CouponDiscountPercentValue
naturalToCouponDiscountPercentValue percent =
  if percent > 0 && percent <= 100 then Just $ CouponDiscountPercentValue percent else Nothing

-- | This is a value between 0 (not inclusive) and 1
couponDiscountPercentValueToRational :: CouponDiscountPercentValue -> Rational
couponDiscountPercentValueToRational (CouponDiscountPercentValue natural) =
  fromIntegral natural / 100

denseUSDToCouponDiscountFixedValue :: Types.DenseUSD -> Maybe CouponDiscountFixedValue
denseUSDToCouponDiscountFixedValue fixed =
  if fixed >= 0 then Just $ CouponDiscountFixedValue fixed else Nothing

couponDiscountFixedValueToDenseUSD :: CouponDiscountFixedValue -> Types.DenseUSD
couponDiscountFixedValueToDenseUSD (CouponDiscountFixedValue denseUSD) = denseUSD

getDiscountFromSub :: CouponDiscountType -> Types.SubscriptionUnitAmount -> Types.DenseUSD
getDiscountFromSub discountType subscriptionUnitAmount =
  let
    subUnitAmountDenseUSD = Types.subscriptionUnitAmountToDenseUSD subscriptionUnitAmount
    discountedDenseUSD = case discountType of
      Percent percent ->
        let
          rationalPercent = couponDiscountPercentValueToRational percent
          rationalSubUnitAmount = Types.denseUSDToRationalDollars subUnitAmountDenseUSD
        in Types.rationalDollarsToDenseUSD' $ rationalSubUnitAmount * rationalPercent
      Fixed value -> couponDiscountFixedValueToDenseUSD value
  in subUnitAmountDenseUSD - discountedDenseUSD

data DiscountCurrency = DiscountCurrency
  { discountCurrencyAmount :: Types.DenseUSD
  , discountCurrencyCurrency :: Types.Currency
  }
  deriving (Eq, Show)

instance FromJSON DiscountCurrency where
  parseJSON = withObject "DiscountCurrency" $ \object -> do
    amountInDollars <- aesonRequired object "amount"
    currency <- aesonRequired object "currency"
    let
      denseUsd =
        Types.rationalDollarsToDenseUSD' $ toRational @Scientific.Scientific amountInDollars
    pure DiscountCurrency { discountCurrencyAmount = denseUsd, discountCurrencyCurrency = currency }

isUsd :: DiscountCurrency -> Bool
isUsd = (== Types.USD) . discountCurrencyCurrency
