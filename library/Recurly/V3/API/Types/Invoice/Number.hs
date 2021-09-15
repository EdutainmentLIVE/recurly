module Recurly.V3.API.Types.Invoice.Number where

import Recurlude

newtype InvoiceNumber =
    InvoiceNumber Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text InvoiceNumber

instance From InvoiceNumber Text
