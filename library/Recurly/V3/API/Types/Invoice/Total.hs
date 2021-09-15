module Recurly.V3.API.Types.Invoice.Total where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceTotal =
    InvoiceTotal Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD InvoiceTotal

instance From InvoiceTotal Money.DenseUSD
