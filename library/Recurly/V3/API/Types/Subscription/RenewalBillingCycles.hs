module Recurly.V3.API.Types.Subscription.RenewalBillingCycles where

import Recurlude

newtype SubscriptionRenewalBillingCycles =
    SubscriptionRenewalBillingCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer SubscriptionRenewalBillingCycles

instance From SubscriptionRenewalBillingCycles Integer
