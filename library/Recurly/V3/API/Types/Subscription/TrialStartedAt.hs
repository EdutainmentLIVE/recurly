module Recurly.V3.API.Types.Subscription.TrialStartedAt where

import Recurlude

newtype SubscriptionTrialStartedAt =
    SubscriptionTrialStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionTrialStartedAt

instance From SubscriptionTrialStartedAt UTCTime
