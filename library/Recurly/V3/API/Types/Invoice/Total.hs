module Recurly.V3.API.Types.Invoice.Total where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Total = Total Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD Total

instance From Total Money.DenseUSD
