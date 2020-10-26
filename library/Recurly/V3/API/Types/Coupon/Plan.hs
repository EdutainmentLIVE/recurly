module Recurly.V3.API.Types.Coupon.Plan where

import Recurlude

import qualified Recurly.V3.API.Types.Plan.Code as Types
import qualified Recurly.V3.API.Types.Plan.Id as Types
import qualified Recurly.V3.API.Types.Plan.Name as Types

data CouponPlan = CouponPlan
  { couponPlanId :: Types.PlanId
  , couponPlanCode :: Types.PlanCode
  , couponPlanName :: Types.PlanName
  }
  deriving (Eq, Show)

instance FromJSON CouponPlan where
  parseJSON = withObject "CouponPlan" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    name <- aesonRequired obj "name"
    pure CouponPlan { couponPlanId = id_, couponPlanCode = code, couponPlanName = name }
