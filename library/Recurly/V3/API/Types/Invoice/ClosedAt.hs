module Recurly.V3.API.Types.Invoice.ClosedAt where

import Recurlude

newtype InvoiceClosedAt =
    InvoiceClosedAt UTCTime
    deriving (Eq, Show, FromJSON)

invoiceClosedAtToUtcTime :: InvoiceClosedAt -> UTCTime
invoiceClosedAtToUtcTime (InvoiceClosedAt time) = time

timeToInvoiceClosedAt :: UTCTime -> InvoiceClosedAt
timeToInvoiceClosedAt = InvoiceClosedAt
