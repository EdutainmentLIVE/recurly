module Recurly.V3.API.Types.Invoice.ClosedAt where

import Recurlude

newtype InvoiceClosedAt =
    InvoiceClosedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime InvoiceClosedAt

instance From InvoiceClosedAt UTCTime
