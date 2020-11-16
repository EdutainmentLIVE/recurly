module Recurly.V3.API.Types.Subscription.CurrentPeriodEndsAt where

import Recurlude

newtype SubscriptionCurrentPeriodEndsAt =
    SubscriptionCurrentPeriodEndsAt UTCTime
    deriving (Eq, Ord, Show, FromJSON)

subscriptionCurrentPeriodEndsAtToUtcTime :: SubscriptionCurrentPeriodEndsAt -> UTCTime
subscriptionCurrentPeriodEndsAtToUtcTime (SubscriptionCurrentPeriodEndsAt time) = time

timeToSubscriptionCurrentPeriodEndsAt :: UTCTime -> SubscriptionCurrentPeriodEndsAt
timeToSubscriptionCurrentPeriodEndsAt = SubscriptionCurrentPeriodEndsAt
