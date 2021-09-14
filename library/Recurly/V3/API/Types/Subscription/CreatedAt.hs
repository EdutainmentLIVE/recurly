module Recurly.V3.API.Types.Subscription.CreatedAt where

import Recurlude

newtype SubscriptionCreatedAt =
    SubscriptionCreatedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionCreatedAt

instance From SubscriptionCreatedAt UTCTime
