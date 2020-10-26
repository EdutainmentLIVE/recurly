module Recurly.V3.API.Types.Coupon.Name where

newtype CouponName =
    CouponName Text
    deriving (Eq, Show, FromJSON, ToJSON)

couponNameToText :: CouponName -> Text
couponNameToText (CouponName text) = text

textToCouponName :: Text -> CouponName
textToCouponName = CouponName
