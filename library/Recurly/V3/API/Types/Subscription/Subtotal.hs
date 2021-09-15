module Recurly.V3.API.Types.Subscription.Subtotal where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Subtotal = Subtotal Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Money.DenseUSD Subtotal

instance From Subtotal Money.DenseUSD
