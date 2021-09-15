module Recurly.V3.API.Types.Subscription.Subtotal where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype SubscriptionSubtotal =
    SubscriptionSubtotal Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Money.DenseUSD SubscriptionSubtotal

instance From SubscriptionSubtotal Money.DenseUSD
