module Recurly.V3.API.Types.Subscription.CurrentTermEndsAt where

import Recurlude

newtype SubscriptionCurrentTermEndsAt =
    SubscriptionCurrentTermEndsAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionCurrentTermEndsAt

instance From SubscriptionCurrentTermEndsAt UTCTime
