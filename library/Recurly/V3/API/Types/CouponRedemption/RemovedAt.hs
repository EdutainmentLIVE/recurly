module Recurly.V3.API.Types.CouponRedemption.RemovedAt where

import Recurlude

newtype CouponRedemptionRemovedAt =
    CouponRedemptionRemovedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON, ToJSON)

instance From UTCTime CouponRedemptionRemovedAt

instance From CouponRedemptionRemovedAt UTCTime
