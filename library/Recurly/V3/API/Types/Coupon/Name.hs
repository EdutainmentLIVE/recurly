module Recurly.V3.API.Types.Coupon.Name where

import Recurlude

newtype CouponName =
    CouponName Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text CouponName

instance From CouponName Text
