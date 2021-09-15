module Recurly.V3.API.Types.Subscription.TrialEndsAt where

import Recurlude

newtype SubscriptionTrialEndsAt =
    SubscriptionTrialEndsAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionTrialEndsAt

instance From SubscriptionTrialEndsAt UTCTime
