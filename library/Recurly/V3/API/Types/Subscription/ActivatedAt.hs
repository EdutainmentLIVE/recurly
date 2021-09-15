module Recurly.V3.API.Types.Subscription.ActivatedAt where

import Recurlude

newtype SubscriptionActivatedAt =
    SubscriptionActivatedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON)

instance From UTCTime SubscriptionActivatedAt

instance From SubscriptionActivatedAt UTCTime
