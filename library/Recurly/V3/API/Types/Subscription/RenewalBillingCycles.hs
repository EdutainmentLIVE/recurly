module Recurly.V3.API.Types.Subscription.RenewalBillingCycles where

import Recurlude

newtype RenewalBillingCycles = RenewalBillingCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer RenewalBillingCycles

instance From RenewalBillingCycles Integer
