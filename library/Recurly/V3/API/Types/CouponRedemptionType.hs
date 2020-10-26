module Recurly.V3.API.Types.CouponRedemptionType where

import qualified Recurly.V3.API.Types.AccountCouponRedemption as Types
import qualified Recurly.V3.API.Types.CouponRedemption.Coupon as Types
import qualified Recurly.V3.API.Types.Subscription.CouponRedemption as Types

data CouponRedemptionType
    = CouponRedemptionTypeAccount Types.AccountCouponRedemption
    | CouponRedemptionTypeSubscription Types.SubscriptionCouponRedemption
    deriving (Eq, Show)

getCouponRedemptionCoupon :: CouponRedemptionType -> Types.CouponRedemptionCoupon
getCouponRedemptionCoupon couponRedemptionType = case couponRedemptionType of
  CouponRedemptionTypeAccount redemption -> Types.accountCouponRedemptionCoupon redemption
  CouponRedemptionTypeSubscription redemption ->
    Types.subscriptionCouponRedemptionCoupon redemption
