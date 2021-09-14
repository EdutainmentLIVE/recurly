module Recurly.V3.API.Types.Subscription.UpdatedAt where

import Recurlude

newtype SubscriptionUpdatedAt =
    SubscriptionUpdatedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionUpdatedAt

instance From SubscriptionUpdatedAt UTCTime
