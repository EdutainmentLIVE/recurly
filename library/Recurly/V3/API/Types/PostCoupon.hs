module Recurly.V3.API.Types.PostCoupon where

import Recurlude

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson

import qualified Recurly.V3.API.Types.Coupon.Code as Types
import qualified Recurly.V3.API.Types.Coupon.DiscountType as Types
import qualified Recurly.V3.API.Types.Coupon.Name as Types
import qualified Recurly.V3.API.Types.Currency as Types

data PostCoupon = PostCoupon
  { postCouponName :: Types.CouponName
  , postCouponCode :: Types.CouponCode
  , postCouponDiscountType :: Types.CouponDiscountType
  }
  deriving (Eq, Show)

instance ToJSON PostCoupon where
  toJSON postCoupon =
    let
      discount :: [Aeson.Pair]
      discount = case postCouponDiscountType postCoupon of
        Types.Fixed fixed ->
          [ aesonPair "discount_type" ("fixed" :: Text)
          , aesonPair
            "currencies"
            [Aeson.object [aesonPair "amount" fixed, aesonPair "currency" Types.USD]]
          ]
        Types.Percent percent ->
          [aesonPair "discount_type" ("percent" :: Text), aesonPair "discount_percent" percent]
    in
      Aeson.object
      $ (aesonPair "name" . toJSON $ postCouponName postCoupon)
      : (aesonPair "code" . toJSON $ postCouponCode postCoupon)
      : discount
