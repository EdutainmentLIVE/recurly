module Recurly.V3.API.Types.Subscription.PausedAt where

newtype SubscriptionPausedAt =
    SubscriptionPausedAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionPausedAtToUtcTime :: SubscriptionPausedAt -> UTCTime
subscriptionPausedAtToUtcTime (SubscriptionPausedAt time) = time

timeToSubscriptionPausedAt :: UTCTime -> SubscriptionPausedAt
timeToSubscriptionPausedAt = SubscriptionPausedAt
