module Recurly.V3.API.Types.Invoice.CreatedAt where

import Recurlude

newtype InvoiceCreatedAt =
    InvoiceCreatedAt UTCTime
    deriving (Eq, Show, FromJSON)

invoiceCreatedAtToUtcTime :: InvoiceCreatedAt -> UTCTime
invoiceCreatedAtToUtcTime (InvoiceCreatedAt time) = time

timeToInvoiceCreatedAt :: UTCTime -> InvoiceCreatedAt
timeToInvoiceCreatedAt = InvoiceCreatedAt
