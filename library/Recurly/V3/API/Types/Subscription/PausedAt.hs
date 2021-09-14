module Recurly.V3.API.Types.Subscription.PausedAt where

import Recurlude

newtype SubscriptionPausedAt =
    SubscriptionPausedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionPausedAt

instance From SubscriptionPausedAt UTCTime
