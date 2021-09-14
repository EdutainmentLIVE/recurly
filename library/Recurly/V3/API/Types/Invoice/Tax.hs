module Recurly.V3.API.Types.Invoice.Tax where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceTax =
    InvoiceTax Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD InvoiceTax

instance From InvoiceTax Money.DenseUSD
