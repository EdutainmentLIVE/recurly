module Recurly.V3.API.Types.Subscription.Quantity where

newtype SubscriptionQuantity =
    SubscriptionQuantity Integer
    deriving (Eq, Show, FromJSON)

subscriptionQuantityToInteger :: SubscriptionQuantity -> Integer
subscriptionQuantityToInteger (SubscriptionQuantity integer) = integer

integerToSubscriptionQuantity :: Integer -> SubscriptionQuantity
integerToSubscriptionQuantity = SubscriptionQuantity
