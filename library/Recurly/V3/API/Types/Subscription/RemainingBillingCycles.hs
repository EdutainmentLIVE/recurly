module Recurly.V3.API.Types.Subscription.RemainingBillingCycles where

newtype SubscriptionRemainingBillingCycles =
    SubscriptionRemainingBillingCycles Integer
    deriving (Eq, Show, FromJSON)

subscriptionRemainingBillingCyclesToInteger :: SubscriptionRemainingBillingCycles -> Integer
subscriptionRemainingBillingCyclesToInteger (SubscriptionRemainingBillingCycles integer) = integer

integerToSubscriptionRemainingBillingCycles :: Integer -> SubscriptionRemainingBillingCycles
integerToSubscriptionRemainingBillingCycles = SubscriptionRemainingBillingCycles
