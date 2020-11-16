module Recurly.V3.API.Types.Invoice.DueAt where

import Recurlude

newtype InvoiceDueAt =
    InvoiceDueAt UTCTime
    deriving (Eq, Show, FromJSON)

invoiceDueAtToUtcTime :: InvoiceDueAt -> UTCTime
invoiceDueAtToUtcTime (InvoiceDueAt time) = time

timeToInvoiceDueAt :: UTCTime -> InvoiceDueAt
timeToInvoiceDueAt = InvoiceDueAt
