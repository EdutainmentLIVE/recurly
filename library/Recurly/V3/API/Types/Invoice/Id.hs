module Recurly.V3.API.Types.Invoice.Id where

import Recurlude

newtype InvoiceId =
    InvoiceId Text
    deriving (Eq, Show, FromJSON, ToJSON)

invoiceIdToText :: InvoiceId -> Text
invoiceIdToText (InvoiceId text) = text

textToInvoiceId :: Text -> InvoiceId
textToInvoiceId = InvoiceId
