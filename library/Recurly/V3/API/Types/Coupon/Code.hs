module Recurly.V3.API.Types.Coupon.Code where

import Recurlude

newtype CouponCode =
    CouponCode Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text CouponCode

instance From CouponCode Text
