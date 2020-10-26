module Recurly.V3.API.Types.Subscription.CanceledAt where

newtype SubscriptionCanceledAt =
    SubscriptionCanceledAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionCanceledAtToUtcTime :: SubscriptionCanceledAt -> UTCTime
subscriptionCanceledAtToUtcTime (SubscriptionCanceledAt time) = time

timeToSubscriptionCanceledAt :: UTCTime -> SubscriptionCanceledAt
timeToSubscriptionCanceledAt = SubscriptionCanceledAt
