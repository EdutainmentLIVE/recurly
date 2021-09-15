module Recurly.V3.API.Types.Subscription.UnitAmount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype UnitAmount = UnitAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Money.DenseUSD UnitAmount

instance From UnitAmount Money.DenseUSD
