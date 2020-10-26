module Recurly.V3.API.Types.Subscription.RemainingPauseCycles where

newtype SubscriptionRemainingPauseCycles =
    SubscriptionRemainingPauseCycles Integer
    deriving (Eq, Show, FromJSON)

subscriptionRemainingPauseCyclesToInteger :: SubscriptionRemainingPauseCycles -> Integer
subscriptionRemainingPauseCyclesToInteger (SubscriptionRemainingPauseCycles integer) = integer

integerToSubscriptionRemainingPauseCycles :: Integer -> SubscriptionRemainingPauseCycles
integerToSubscriptionRemainingPauseCycles = SubscriptionRemainingPauseCycles
