module Recurly.V3.API.Types.Coupon.Plan where

import Recurlude

import qualified Recurly.V3.API.Types.Plan.Code as Plan
import qualified Recurly.V3.API.Types.Plan.Id as Plan
import qualified Recurly.V3.API.Types.Plan.Name as Plan

data Plan = Plan
  { id_ :: Plan.Id
  , code :: Plan.Code
  , name :: Plan.Name
  }
  deriving (Eq, Show)

instance FromJSON Plan where
  parseJSON = withObject "CouponPlan" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    name <- aesonRequired obj "name"
    pure Plan { id_, code, name }
