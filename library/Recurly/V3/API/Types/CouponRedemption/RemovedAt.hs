module Recurly.V3.API.Types.CouponRedemption.RemovedAt where

newtype CouponRedemptionRemovedAt =
    CouponRedemptionRemovedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON, ToJSON)

couponRedemptionRemovedAtToUtcTime :: CouponRedemptionRemovedAt -> UTCTime
couponRedemptionRemovedAtToUtcTime (CouponRedemptionRemovedAt time) = time

timeToCouponRedemptionRemovedAt :: UTCTime -> CouponRedemptionRemovedAt
timeToCouponRedemptionRemovedAt = CouponRedemptionRemovedAt
