module Recurly.V3.API.Types.Subscription.CreatedAt where

newtype SubscriptionCreatedAt =
    SubscriptionCreatedAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionCreatedAtToUtcTime :: SubscriptionCreatedAt -> UTCTime
subscriptionCreatedAtToUtcTime (SubscriptionCreatedAt time) = time

timeToSubscriptionCreatedAt :: UTCTime -> SubscriptionCreatedAt
timeToSubscriptionCreatedAt = SubscriptionCreatedAt
