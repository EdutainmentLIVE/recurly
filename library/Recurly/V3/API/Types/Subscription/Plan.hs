module Recurly.V3.API.Types.Subscription.Plan where

import Recurlude

import qualified Recurly.V3.API.Types.Plan.Code as Types
import qualified Recurly.V3.API.Types.Plan.Id as Types
import qualified Recurly.V3.API.Types.Plan.Name as Types

data SubscriptionPlan = SubscriptionPlan
  { subscriptionPlanId :: Types.PlanId
  , subscriptionPlanCode :: Types.PlanCode
  , subscriptionPlanName :: Types.PlanName
  }
  deriving (Eq, Show)

instance FromJSON SubscriptionPlan where
  parseJSON = withObject "SubscriptionPlan" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    name <- aesonRequired obj "name"
    pure SubscriptionPlan
      { subscriptionPlanId = id_
      , subscriptionPlanCode = code
      , subscriptionPlanName = name
      }
