module Recurly.V3.API.Types.Coupon.DiscountType where

import Recurlude

import qualified Recurly.V3.API.Types.Coupon.DiscountType.DiscountCurrency as DiscountCurrency
import Recurly.V3.API.Types.Coupon.DiscountType.FixedValue (FixedValue)
import Recurly.V3.API.Types.Coupon.DiscountType.PercentValue (PercentValue)
import qualified Recurly.V3.API.Types.Coupon.DiscountType.PercentValue as PercentValue
import qualified Recurly.V3.API.Types.Money.Money as Money
import qualified Recurly.V3.API.Types.Subscription.UnitAmount as Subscription

data DiscountType = Percent PercentValue | Fixed FixedValue
  deriving (Eq, Show)

instance FromJSON DiscountType where
  parseJSON = withObject "CouponDiscountType" $ \object -> do
    type_ <- aesonRequired object "type"
    case type_ :: Text of
      "fixed" -> do
        currencies <- aesonRequired object "currencies"
        let
          maybeFixedValue = case filter DiscountCurrency.isUsd currencies of
            [currency] -> do
              couponDiscountFixedValue <- hush . tryInto @FixedValue $ DiscountCurrency.amount
                currency
              Just $ Fixed couponDiscountFixedValue
            _ -> Nothing
        maybeFail ("invalid fixed coupon: " <> show object) maybeFixedValue
      "percent" -> do
        percent <- aesonRequired object "percent"
        maybeFailWith ("invalid percent coupon: " <> show object) Percent
          . hush
          $ tryInto @PercentValue @Natural percent
      _ -> fail $ "unknown DiscountType: " <> show type_

getDiscountFromSub :: DiscountType -> Subscription.UnitAmount -> Money.DenseUSD
getDiscountFromSub discountType subscriptionUnitAmount =
  let
    subUnitAmountDenseUSD = into @Money.DenseUSD subscriptionUnitAmount
    discountedDenseUSD = case discountType of
      Percent percent ->
        let
          rationalPercent = PercentValue.toPercentRational percent
          rationalSubUnitAmount = Money.denseUSDToRationalDollars subUnitAmountDenseUSD
        in Money.rationalDollarsToDenseUSD' $ rationalSubUnitAmount * rationalPercent
      Fixed value -> into @Money.DenseUSD value
  in subUnitAmountDenseUSD - discountedDenseUSD
