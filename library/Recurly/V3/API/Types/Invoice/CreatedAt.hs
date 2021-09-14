module Recurly.V3.API.Types.Invoice.CreatedAt where

import Recurlude

newtype InvoiceCreatedAt =
    InvoiceCreatedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime InvoiceCreatedAt

instance From InvoiceCreatedAt UTCTime
