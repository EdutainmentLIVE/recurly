module Recurly.V3.API.Types.Coupon.AppliesToAllPlans where

import Recurlude

newtype CouponAppliesToAllPlans =
    CouponAppliesToAllPlans Bool
    deriving (Eq, Show, FromJSON)

instance From Bool CouponAppliesToAllPlans

instance From CouponAppliesToAllPlans Bool
