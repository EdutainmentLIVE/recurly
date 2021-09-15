module Recurly.V3.API.Types.Subscription.CurrentPeriodEndsAt where

import Recurlude

newtype SubscriptionCurrentPeriodEndsAt =
    SubscriptionCurrentPeriodEndsAt UTCTime
    deriving (Eq, Ord, Show, FromJSON)

instance From UTCTime SubscriptionCurrentPeriodEndsAt

instance From SubscriptionCurrentPeriodEndsAt UTCTime
