module Recurly.V3.API.Types.Invoice.Balance where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceBalance =
    InvoiceBalance Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD InvoiceBalance

instance From InvoiceBalance Money.DenseUSD
