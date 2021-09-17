module Recurly.V3.API.Types.PostCoupon
  ( module Recurly.V3.API.Types.PostCoupon
  , Coupon.Code
  , Coupon.DiscountType
  , Coupon.Name
  ) where

import Recurlude

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson

import qualified Recurly.V3.API.Types.Coupon.Code as Coupon
import qualified Recurly.V3.API.Types.Coupon.DiscountType as Coupon
import qualified Recurly.V3.API.Types.Coupon.Name as Coupon
import qualified Recurly.V3.API.Types.Currency as Currency

data PostCoupon = PostCoupon
  { name :: Coupon.Name
  , code :: Coupon.Code
  , discountType :: Coupon.DiscountType
  }
  deriving (Eq, Show)

instance ToJSON PostCoupon where
  toJSON postCoupon =
    let
      discount :: [Aeson.Pair]
      discount = case discountType postCoupon of
        Coupon.Fixed fixed ->
          [ aesonPair "discount_type" ("fixed" :: Text)
          , aesonPair
            "currencies"
            [Aeson.object [aesonPair "amount" fixed, aesonPair "currency" Currency.USD]]
          ]
        Coupon.Percent percent ->
          [aesonPair "discount_type" ("percent" :: Text), aesonPair "discount_percent" percent]
    in
      Aeson.object
      $ (aesonPair "name" . toJSON $ name postCoupon)
      : (aesonPair "code" . toJSON $ code postCoupon)
      : discount
