module Recurly.V3.API.Types.Subscription.UnitAmount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype SubscriptionUnitAmount =
    SubscriptionUnitAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Money.DenseUSD SubscriptionUnitAmount

instance From SubscriptionUnitAmount Money.DenseUSD
