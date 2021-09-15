module Recurly.V3.API.Types.Plan.Name where

import Recurlude

newtype PlanName =
    PlanName Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text PlanName

instance From PlanName Text
