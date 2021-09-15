module Recurly.V3.API.Types.Subscription.CurrentTermStartedAt where

import Recurlude

newtype SubscriptionCurrentTermStartedAt =
    SubscriptionCurrentTermStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionCurrentTermStartedAt

instance From SubscriptionCurrentTermStartedAt UTCTime
