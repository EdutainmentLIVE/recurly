module Recurly.V3.API.Types.Invoice.Paid where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoicePaid =
    InvoicePaid Money.DenseUSD
    deriving (Eq, Show, FromJSON)

invoicePaidToDenseUSD :: InvoicePaid -> Money.DenseUSD
invoicePaidToDenseUSD (InvoicePaid denseUSD) = denseUSD

denseUSDToInvoicePaid :: Money.DenseUSD -> InvoicePaid
denseUSDToInvoicePaid = InvoicePaid
