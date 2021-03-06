module Recurly.V3.API.Types.Subscription.TrialEndsAt where

import Recurlude

newtype SubscriptionTrialEndsAt =
    SubscriptionTrialEndsAt UTCTime
    deriving (Eq, Show, FromJSON)

subscriptionTrialEndsAtToUtcTime :: SubscriptionTrialEndsAt -> UTCTime
subscriptionTrialEndsAtToUtcTime (SubscriptionTrialEndsAt time) = time

timeToSubscriptionTrialEndsAt :: UTCTime -> SubscriptionTrialEndsAt
timeToSubscriptionTrialEndsAt = SubscriptionTrialEndsAt
