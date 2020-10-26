module Recurly.V3.API.Types.CouponRedemption.CreatedAt where

newtype CouponRedemptionCreatedAt =
    CouponRedemptionCreatedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON, ToJSON)

couponRedemptionCreatedAtToUtcTime :: CouponRedemptionCreatedAt -> UTCTime
couponRedemptionCreatedAtToUtcTime (CouponRedemptionCreatedAt time) = time

timeToCouponRedemptionCreatedAt :: UTCTime -> CouponRedemptionCreatedAt
timeToCouponRedemptionCreatedAt = CouponRedemptionCreatedAt
