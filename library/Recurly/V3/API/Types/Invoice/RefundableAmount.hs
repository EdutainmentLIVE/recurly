module Recurly.V3.API.Types.Invoice.RefundableAmount where

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceRefundableAmount =
    InvoiceRefundableAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

invoiceRefundableAmountToDenseUSD :: InvoiceRefundableAmount -> Money.DenseUSD
invoiceRefundableAmountToDenseUSD (InvoiceRefundableAmount denseUSD) = denseUSD

denseUSDToInvoiceRefundableAmount :: Money.DenseUSD -> InvoiceRefundableAmount
denseUSDToInvoiceRefundableAmount = InvoiceRefundableAmount
