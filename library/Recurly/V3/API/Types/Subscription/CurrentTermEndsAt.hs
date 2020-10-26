module Recurly.V3.API.Types.Subscription.CurrentTermEndsAt where

newtype SubscriptionCurrentTermEndsAt =
    SubscriptionCurrentTermEndsAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionCurrentTermEndsAtToUtcTime :: SubscriptionCurrentTermEndsAt -> UTCTime
subscriptionCurrentTermEndsAtToUtcTime (SubscriptionCurrentTermEndsAt time) = time

timeToSubscriptionCurrentTermEndsAt :: UTCTime -> SubscriptionCurrentTermEndsAt
timeToSubscriptionCurrentTermEndsAt = SubscriptionCurrentTermEndsAt
