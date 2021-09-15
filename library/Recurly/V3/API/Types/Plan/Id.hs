module Recurly.V3.API.Types.Plan.Id where

import Recurlude

newtype PlanId =
    PlanId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text PlanId

instance From PlanId Text
