module Recurly.V3.API.Types.Subscription.AutoRenew where

import Recurlude

newtype SubscriptionAutoRenew =
    SubscriptionAutoRenew Bool
    deriving (Eq, Show, FromJSON)

instance From Bool SubscriptionAutoRenew

instance From SubscriptionAutoRenew Bool
