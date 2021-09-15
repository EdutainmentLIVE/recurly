module Recurly.V3.API.Types.CouponRedemption.Id where

import Recurlude

newtype CouponRedemptionId =
    CouponRedemptionId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text CouponRedemptionId

instance From CouponRedemptionId Text
