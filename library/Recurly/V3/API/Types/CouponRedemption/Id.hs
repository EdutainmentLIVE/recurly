module Recurly.V3.API.Types.CouponRedemption.Id where

newtype CouponRedemptionId =
    CouponRedemptionId Text
    deriving (Eq, Show, FromJSON, ToJSON)

couponRedemptionIdToText :: CouponRedemptionId -> Text
couponRedemptionIdToText (CouponRedemptionId text) = text

textToCouponRedemptionId :: Text -> CouponRedemptionId
textToCouponRedemptionId = CouponRedemptionId
