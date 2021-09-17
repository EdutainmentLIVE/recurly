module Recurly.V3.API.Types.CouponRedemption.Coupon where

import Recurlude

import qualified Recurly.V3.API.Types.Coupon.AppliesToAllPlans as Coupon
import qualified Recurly.V3.API.Types.Coupon.Code as Coupon
import qualified Recurly.V3.API.Types.Coupon.DiscountType as Coupon
import qualified Recurly.V3.API.Types.Coupon.Id as Coupon
import qualified Recurly.V3.API.Types.Coupon.Name as Coupon
import qualified Recurly.V3.API.Types.Coupon.Plan as Coupon

data Coupon = Coupon
  { id_ :: Coupon.Id
  , code :: Coupon.Code
  , name :: Coupon.Name
  , discountType :: Coupon.DiscountType
  , plans :: [Coupon.Plan]
  , appliesToAllPlans :: Coupon.AppliesToAllPlans
  }
  deriving (Eq, Show)

instance FromJSON Coupon where
  parseJSON = withObject "CouponRedemptionCoupon" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    name <- aesonRequired obj "name"
    discountType <- aesonRequired obj "discount"
    plans <- aesonWDefault [] obj "plans"
    appliesToAllPlans <- aesonWDefault
      (into @Coupon.AppliesToAllPlans False)
      obj
      "applies_to_all_plans"
    pure Coupon { id_, code, name, discountType, plans, appliesToAllPlans }
