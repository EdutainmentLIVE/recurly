module Recurly.V3.API.Types.Coupon.Id where

import Recurlude

newtype CouponId =
    CouponId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text CouponId

instance From CouponId Text
