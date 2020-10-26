module Recurly.V3.API.Types.Coupon.Code where

newtype CouponCode =
    CouponCode Text
    deriving (Eq, Show, FromJSON, ToJSON)

couponCodeToText :: CouponCode -> Text
couponCodeToText (CouponCode text) = text

textToCouponCode :: Text -> CouponCode
textToCouponCode = CouponCode
