module Recurly.V3.API.Types.Subscription.RemainingBillingCycles where

import Recurlude

newtype RemainingBillingCycles = RemainingBillingCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer RemainingBillingCycles

instance From RemainingBillingCycles Integer
