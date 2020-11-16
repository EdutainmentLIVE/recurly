module Recurly.V3.API.Types.Subscription.RenewalBillingCycles where

import Recurlude

newtype SubscriptionRenewalBillingCycles =
    SubscriptionRenewalBillingCycles Integer
    deriving (Eq, Show, FromJSON)

subscriptionRenewalBillingCyclesToInteger :: SubscriptionRenewalBillingCycles -> Integer
subscriptionRenewalBillingCyclesToInteger (SubscriptionRenewalBillingCycles integer) = integer

integerToSubscriptionRenewalBillingCycles :: Integer -> SubscriptionRenewalBillingCycles
integerToSubscriptionRenewalBillingCycles = SubscriptionRenewalBillingCycles
