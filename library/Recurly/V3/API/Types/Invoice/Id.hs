module Recurly.V3.API.Types.Invoice.Id where

import Recurlude

newtype InvoiceId =
    InvoiceId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text InvoiceId

instance From InvoiceId Text
