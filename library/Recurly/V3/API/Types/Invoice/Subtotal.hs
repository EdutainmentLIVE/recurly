module Recurly.V3.API.Types.Invoice.Subtotal where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceSubtotal =
    InvoiceSubtotal Money.DenseUSD
    deriving (Eq, Show, FromJSON)

invoiceSubtotalToDenseUSD :: InvoiceSubtotal -> Money.DenseUSD
invoiceSubtotalToDenseUSD (InvoiceSubtotal denseUSD) = denseUSD

denseUSDToInvoiceSubtotal :: Money.DenseUSD -> InvoiceSubtotal
denseUSDToInvoiceSubtotal = InvoiceSubtotal
