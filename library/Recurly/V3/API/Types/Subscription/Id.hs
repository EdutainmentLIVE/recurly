module Recurly.V3.API.Types.Subscription.Id where

import Recurlude

newtype SubscriptionId =
    SubscriptionId Text
    deriving (Eq, Show, FromJSON)

instance From Text SubscriptionId

instance From SubscriptionId Text
