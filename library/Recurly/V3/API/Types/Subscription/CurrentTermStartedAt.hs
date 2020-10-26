module Recurly.V3.API.Types.Subscription.CurrentTermStartedAt where

newtype SubscriptionCurrentTermStartedAt =
    SubscriptionCurrentTermStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionCurrentTermStartedAtToUtcTime :: SubscriptionCurrentTermStartedAt -> UTCTime
subscriptionCurrentTermStartedAtToUtcTime (SubscriptionCurrentTermStartedAt time) = time

timeToSubscriptionCurrentTermStartedAt :: UTCTime -> SubscriptionCurrentTermStartedAt
timeToSubscriptionCurrentTermStartedAt = SubscriptionCurrentTermStartedAt
