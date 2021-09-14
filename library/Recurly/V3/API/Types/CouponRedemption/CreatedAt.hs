module Recurly.V3.API.Types.CouponRedemption.CreatedAt where

import Recurlude

newtype CouponRedemptionCreatedAt =
    CouponRedemptionCreatedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON, ToJSON)

instance From UTCTime CouponRedemptionCreatedAt

instance From CouponRedemptionCreatedAt UTCTime
