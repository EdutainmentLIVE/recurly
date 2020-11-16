module Recurly.V3.API.Types.Invoice.Number where

import Recurlude

newtype InvoiceNumber =
    InvoiceNumber Text
    deriving (Eq, Show, FromJSON, ToJSON)

invoiceNumberToText :: InvoiceNumber -> Text
invoiceNumberToText (InvoiceNumber text) = text

textToInvoiceNumber :: Text -> InvoiceNumber
textToInvoiceNumber = InvoiceNumber
