module Recurly.V3.API.Types.Plan.Code where

import Recurlude

newtype PlanCode =
    PlanCode Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text PlanCode

instance From PlanCode Text
