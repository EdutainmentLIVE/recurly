module Recurly.V3.API.Types.Invoice.DueAt where

import Recurlude

newtype InvoiceDueAt =
    InvoiceDueAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime InvoiceDueAt

instance From InvoiceDueAt UTCTime
