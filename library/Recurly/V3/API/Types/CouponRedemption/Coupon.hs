module Recurly.V3.API.Types.CouponRedemption.Coupon where

import Recurlude

import qualified Recurly.V3.API.Types.Coupon.AppliesToAllPlans as Types
import qualified Recurly.V3.API.Types.Coupon.Code as Types
import qualified Recurly.V3.API.Types.Coupon.DiscountType as Types
import qualified Recurly.V3.API.Types.Coupon.Id as Types
import qualified Recurly.V3.API.Types.Coupon.Name as Types
import qualified Recurly.V3.API.Types.Coupon.Plan as Types

data CouponRedemptionCoupon = CouponRedemptionCoupon
  { couponRedemptionCouponId :: Types.CouponId
  , couponRedemptionCouponCode :: Types.CouponCode
  , couponRedemptionCouponName :: Types.CouponName
  , couponRedemptionCouponDiscountType :: Types.CouponDiscountType
  , couponRedemptionCouponPlans :: [Types.CouponPlan]
  , couponRedemptionCouponAppliesToAllPlans :: Types.CouponAppliesToAllPlans
  }
  deriving (Eq, Show)

instance FromJSON CouponRedemptionCoupon where
  parseJSON = withObject "CouponRedemptionCoupon" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    name <- aesonRequired obj "name"
    discountType <- aesonRequired obj "discount"
    plans <- aesonOptional obj "plans"
    appliesToAllPlans <- aesonOptional obj "applies_to_all_plans"
    pure CouponRedemptionCoupon
      { couponRedemptionCouponId = id_
      , couponRedemptionCouponCode = code
      , couponRedemptionCouponName = name
      , couponRedemptionCouponDiscountType = discountType
      , couponRedemptionCouponPlans = fromMaybe [] plans
      , couponRedemptionCouponAppliesToAllPlans = fromMaybe
        (into @Types.CouponAppliesToAllPlans False)
        appliesToAllPlans
      }
