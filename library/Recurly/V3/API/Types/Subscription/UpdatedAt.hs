module Recurly.V3.API.Types.Subscription.UpdatedAt where

import Recurlude

newtype SubscriptionUpdatedAt =
    SubscriptionUpdatedAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionUpdatedAtToUtcTime :: SubscriptionUpdatedAt -> UTCTime
subscriptionUpdatedAtToUtcTime (SubscriptionUpdatedAt time) = time

timeToSubscriptionUpdatedAt :: UTCTime -> SubscriptionUpdatedAt
timeToSubscriptionUpdatedAt = SubscriptionUpdatedAt
