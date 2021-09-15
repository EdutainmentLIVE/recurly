module Recurly.V3.API.Types.Invoice.UpdatedAt where

import Recurlude

newtype InvoiceUpdatedAt =
    InvoiceUpdatedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime InvoiceUpdatedAt

instance From InvoiceUpdatedAt UTCTime
