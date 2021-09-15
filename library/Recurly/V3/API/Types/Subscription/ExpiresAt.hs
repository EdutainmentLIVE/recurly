module Recurly.V3.API.Types.Subscription.ExpiresAt where

import Recurlude

newtype SubscriptionExpiresAt =
    SubscriptionExpiresAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionExpiresAt

instance From SubscriptionExpiresAt UTCTime
