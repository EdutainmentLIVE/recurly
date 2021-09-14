module Recurly.V3.API.Types.Subscription.CurrentPeriodStartedAt where

import Recurlude

newtype SubscriptionCurrentPeriodStartedAt =
    SubscriptionCurrentPeriodStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionCurrentPeriodStartedAt

instance From SubscriptionCurrentPeriodStartedAt UTCTime
