module Recurly.V3.API.Types.Subscription.CanceledAt where

import Recurlude

newtype SubscriptionCanceledAt =
    SubscriptionCanceledAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime SubscriptionCanceledAt

instance From SubscriptionCanceledAt UTCTime
