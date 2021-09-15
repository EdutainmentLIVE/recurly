module Recurly.V3.API.Types.Subscription.TotalBillingCycles where

import Recurlude

newtype TotalBillingCycles = TotalBillingCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer TotalBillingCycles

instance From TotalBillingCycles Integer
