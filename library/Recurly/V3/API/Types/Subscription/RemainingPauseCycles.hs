module Recurly.V3.API.Types.Subscription.RemainingPauseCycles where

import Recurlude

newtype RemainingPauseCycles = RemainingPauseCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer RemainingPauseCycles

instance From RemainingPauseCycles Integer
