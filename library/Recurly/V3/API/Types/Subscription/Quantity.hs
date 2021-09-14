module Recurly.V3.API.Types.Subscription.Quantity where

import Recurlude

newtype SubscriptionQuantity =
    SubscriptionQuantity Integer
    deriving (Eq, Show, FromJSON)

instance From Integer SubscriptionQuantity

instance From SubscriptionQuantity Integer
