module Recurly.V3.API.Types.Coupon
  ( module Recurly.V3.API.Types.Coupon
  , Coupon.Code
  , Coupon.DiscountType
  , Coupon.Id
  , Coupon.Name
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.Coupon.Code as Coupon
import qualified Recurly.V3.API.Types.Coupon.DiscountType as Coupon
import qualified Recurly.V3.API.Types.Coupon.Id as Coupon
import qualified Recurly.V3.API.Types.Coupon.Name as Coupon

data Coupon = Coupon
  { id_ :: Coupon.Id
  , name :: Coupon.Name
  , code :: Coupon.Code
  , discountType :: Coupon.DiscountType
  }
  deriving (Eq, Show)

instance FromJSON Coupon where
  parseJSON = withObject "Coupon" $ \obj -> do
    id_ <- aesonRequired obj "id"
    name <- aesonRequired obj "name"
    code <- aesonRequired obj "code"
    discountType <- aesonRequired obj "discount"
    pure Coupon { id_, name, code, discountType }
