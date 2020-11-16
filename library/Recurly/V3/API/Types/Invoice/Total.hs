module Recurly.V3.API.Types.Invoice.Total where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceTotal =
    InvoiceTotal Money.DenseUSD
    deriving (Eq, Show, FromJSON)

invoiceTotalToDenseUSD :: InvoiceTotal -> Money.DenseUSD
invoiceTotalToDenseUSD (InvoiceTotal denseUSD) = denseUSD

denseUSDToInvoiceTotal :: Money.DenseUSD -> InvoiceTotal
denseUSDToInvoiceTotal = InvoiceTotal
