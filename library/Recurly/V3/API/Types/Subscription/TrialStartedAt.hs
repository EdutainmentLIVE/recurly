module Recurly.V3.API.Types.Subscription.TrialStartedAt where

import Recurlude

newtype SubscriptionTrialStartedAt =
    SubscriptionTrialStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionTrialStartedAtToUtcTime :: SubscriptionTrialStartedAt -> UTCTime
subscriptionTrialStartedAtToUtcTime (SubscriptionTrialStartedAt time) = time

timeToSubscriptionTrialStartedAt :: UTCTime -> SubscriptionTrialStartedAt
timeToSubscriptionTrialStartedAt = SubscriptionTrialStartedAt
