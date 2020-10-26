module Recurly.V3.API.Types.Subscription.CurrentPeriodStartedAt where

newtype SubscriptionCurrentPeriodStartedAt =
    SubscriptionCurrentPeriodStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionCurrentPeriodStartedAtToUtcTime :: SubscriptionCurrentPeriodStartedAt -> UTCTime
subscriptionCurrentPeriodStartedAtToUtcTime (SubscriptionCurrentPeriodStartedAt time) = time

timeToSubscriptionCurrentPeriodStartedAt :: UTCTime -> SubscriptionCurrentPeriodStartedAt
timeToSubscriptionCurrentPeriodStartedAt = SubscriptionCurrentPeriodStartedAt
