module Recurly.V3.API.Types.Invoice.Tax where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceTax =
    InvoiceTax Money.DenseUSD
    deriving (Eq, Show, FromJSON)

invoiceTaxToDenseUSD :: InvoiceTax -> Money.DenseUSD
invoiceTaxToDenseUSD (InvoiceTax denseUSD) = denseUSD

denseUSDToInvoiceTax :: Money.DenseUSD -> InvoiceTax
denseUSDToInvoiceTax = InvoiceTax
