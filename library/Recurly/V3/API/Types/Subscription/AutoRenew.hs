module Recurly.V3.API.Types.Subscription.AutoRenew where

import Recurlude

newtype SubscriptionAutoRenew =
    SubscriptionAutoRenew Bool
    deriving (Eq, Show, FromJSON)

subscriptionAutoRenewToBool :: SubscriptionAutoRenew -> Bool
subscriptionAutoRenewToBool (SubscriptionAutoRenew b) = b

boolToSubscriptionAutoRenew :: Bool -> SubscriptionAutoRenew
boolToSubscriptionAutoRenew = SubscriptionAutoRenew
