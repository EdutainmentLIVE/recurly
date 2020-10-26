module Recurly.V3.API.Types.Invoice.UpdatedAt where

newtype InvoiceUpdatedAt =
    InvoiceUpdatedAt UTCTime
    deriving (Eq, Show, FromJSON)

invoiceUpdatedAtToUtcTime :: InvoiceUpdatedAt -> UTCTime
invoiceUpdatedAtToUtcTime (InvoiceUpdatedAt time) = time

timeToInvoiceUpdatedAt :: UTCTime -> InvoiceUpdatedAt
timeToInvoiceUpdatedAt = InvoiceUpdatedAt
