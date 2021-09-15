module Recurly.V3.API.Types.Subscription.TotalBillingCycles where

import Recurlude

newtype SubscriptionTotalBillingCycles =
    SubscriptionTotalBillingCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer SubscriptionTotalBillingCycles

instance From SubscriptionTotalBillingCycles Integer
