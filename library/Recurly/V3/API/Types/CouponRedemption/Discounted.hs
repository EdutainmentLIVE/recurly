module Recurly.V3.API.Types.CouponRedemption.Discounted where

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype CouponRedemptionDiscounted =
    CouponRedemptionDiscounted Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

couponRedemptionDiscountedToDenseUSD :: CouponRedemptionDiscounted -> Money.DenseUSD
couponRedemptionDiscountedToDenseUSD (CouponRedemptionDiscounted denseUSD) = denseUSD

denseUSDToCouponRedemptionDiscounted :: Money.DenseUSD -> CouponRedemptionDiscounted
denseUSDToCouponRedemptionDiscounted = CouponRedemptionDiscounted
