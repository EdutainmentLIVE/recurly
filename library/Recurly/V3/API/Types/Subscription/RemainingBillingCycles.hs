module Recurly.V3.API.Types.Subscription.RemainingBillingCycles where

import Recurlude

newtype SubscriptionRemainingBillingCycles =
    SubscriptionRemainingBillingCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer SubscriptionRemainingBillingCycles

instance From SubscriptionRemainingBillingCycles Integer
