module Recurly.V3.API.Types.Invoice.Discount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Discount = Discount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD Discount

instance From Discount Money.DenseUSD
