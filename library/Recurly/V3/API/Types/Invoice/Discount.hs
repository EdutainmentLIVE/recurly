module Recurly.V3.API.Types.Invoice.Discount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceDiscount =
    InvoiceDiscount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

invoiceDiscountToDenseUSD :: InvoiceDiscount -> Money.DenseUSD
invoiceDiscountToDenseUSD (InvoiceDiscount denseUSD) = denseUSD

denseUSDToInvoiceDiscount :: Money.DenseUSD -> InvoiceDiscount
denseUSDToInvoiceDiscount = InvoiceDiscount
