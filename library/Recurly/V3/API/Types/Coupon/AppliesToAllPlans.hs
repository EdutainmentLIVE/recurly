module Recurly.V3.API.Types.Coupon.AppliesToAllPlans where

newtype CouponAppliesToAllPlans =
    CouponAppliesToAllPlans Bool
    deriving (Eq, Show, FromJSON)

couponAppliesToAllPlansToBool :: CouponAppliesToAllPlans -> Bool
couponAppliesToAllPlansToBool (CouponAppliesToAllPlans b) = b

boolToCouponAppliesToAllPlans :: Bool -> CouponAppliesToAllPlans
boolToCouponAppliesToAllPlans = CouponAppliesToAllPlans
