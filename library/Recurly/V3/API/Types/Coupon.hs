module Recurly.V3.API.Types.Coupon where

import Recurlude

import qualified Recurly.V3.API.Types.Coupon.Code as Types
import qualified Recurly.V3.API.Types.Coupon.DiscountType as Types
import qualified Recurly.V3.API.Types.Coupon.Id as Types
import qualified Recurly.V3.API.Types.Coupon.Name as Types

data Coupon = Coupon
  { couponId :: Types.CouponId
  , couponName :: Types.CouponName
  , couponCode :: Types.CouponCode
  , couponDiscountType :: Types.CouponDiscountType
  }
  deriving (Eq, Show)

instance FromJSON Coupon where
  parseJSON = withObject "Coupon" $ \obj -> do
    id_ <- aesonRequired obj "id"
    name <- aesonRequired obj "name"
    code <- aesonRequired obj "code"
    discountType <- aesonRequired obj "discount"
    pure Coupon
      { couponId = id_
      , couponName = name
      , couponCode = code
      , couponDiscountType = discountType
      }
