module Recurly.V3.API.Types.Invoice.Subtotal where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Subtotal = Subtotal Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD Subtotal

instance From Subtotal Money.DenseUSD
