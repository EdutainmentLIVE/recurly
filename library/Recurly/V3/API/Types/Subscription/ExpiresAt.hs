module Recurly.V3.API.Types.Subscription.ExpiresAt where

newtype SubscriptionExpiresAt =
    SubscriptionExpiresAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionExpiresAtToUtcTime :: SubscriptionExpiresAt -> UTCTime
subscriptionExpiresAtToUtcTime (SubscriptionExpiresAt time) = time

timeToSubscriptionExpiresAt :: UTCTime -> SubscriptionExpiresAt
timeToSubscriptionExpiresAt = SubscriptionExpiresAt
