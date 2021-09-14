module Recurly.V3.API.Types.Subscription.RemainingPauseCycles where

import Recurlude

newtype SubscriptionRemainingPauseCycles =
    SubscriptionRemainingPauseCycles Integer
    deriving (Eq, Show, FromJSON)

instance From Integer SubscriptionRemainingPauseCycles

instance From SubscriptionRemainingPauseCycles Integer
