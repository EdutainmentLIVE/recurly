module Recurly.V3.API.Types.Subscription.ActivatedAt where

import Recurlude

newtype SubscriptionActivatedAt =
    SubscriptionActivatedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON)

subscriptionActivatedAtToUtcTime :: SubscriptionActivatedAt -> UTCTime
subscriptionActivatedAtToUtcTime (SubscriptionActivatedAt time) = time

timeToSubscriptionActivatedAt :: UTCTime -> SubscriptionActivatedAt
timeToSubscriptionActivatedAt = SubscriptionActivatedAt
