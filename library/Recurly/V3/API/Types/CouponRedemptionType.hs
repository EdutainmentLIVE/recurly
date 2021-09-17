module Recurly.V3.API.Types.CouponRedemptionType where

import qualified Recurly.V3.API.Types.AccountCouponRedemption as AccountCouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.Coupon as CouponRedemption.Coupon

data CouponRedemptionType
    = CouponRedemptionTypeAccount AccountCouponRedemption.AccountCouponRedemption
    | CouponRedemptionTypeSubscription CouponRedemption.CouponRedemption
    deriving (Eq, Show)

getCouponRedemptionCoupon :: CouponRedemptionType -> CouponRedemption.Coupon.Coupon
getCouponRedemptionCoupon couponRedemptionType = case couponRedemptionType of
  CouponRedemptionTypeAccount redemption -> AccountCouponRedemption.coupon redemption
  CouponRedemptionTypeSubscription redemption -> CouponRedemption.coupon redemption
