module Recurly.V3.API.Types.Subscription.TotalBillingCycles where

import Recurlude

newtype SubscriptionTotalBillingCycles =
    SubscriptionTotalBillingCycles Integer
    deriving (Eq, Show, FromJSON)

subscriptionTotalBillingCyclesToInteger :: SubscriptionTotalBillingCycles -> Integer
subscriptionTotalBillingCyclesToInteger (SubscriptionTotalBillingCycles integer) = integer

integerToSubscriptionTotalBillingCycles :: Integer -> SubscriptionTotalBillingCycles
integerToSubscriptionTotalBillingCycles = SubscriptionTotalBillingCycles
