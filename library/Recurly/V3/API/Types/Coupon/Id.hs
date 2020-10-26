module Recurly.V3.API.Types.Coupon.Id where

newtype CouponId =
    CouponId Text
    deriving (Eq, Show, FromJSON, ToJSON)

couponIdToText :: CouponId -> Text
couponIdToText (CouponId text) = text

textToCouponId :: Text -> CouponId
textToCouponId = CouponId
