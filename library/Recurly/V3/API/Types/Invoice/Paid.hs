module Recurly.V3.API.Types.Invoice.Paid where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoicePaid =
    InvoicePaid Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD InvoicePaid

instance From InvoicePaid Money.DenseUSD
