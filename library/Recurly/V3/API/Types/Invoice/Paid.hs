module Recurly.V3.API.Types.Invoice.Paid where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Paid = Paid Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD Paid

instance From Paid Money.DenseUSD
