module Recurly.V3.API.Types.Invoice.NetTerms where

import Recurlude

newtype InvoiceNetTerms =
    InvoiceNetTerms Integer
    deriving (Eq, Show, FromJSON)

invoiceNetTermsToInteger :: InvoiceNetTerms -> Integer
invoiceNetTermsToInteger (InvoiceNetTerms integer) = integer

integerToInvoiceNetTerms :: Integer -> Maybe InvoiceNetTerms
integerToInvoiceNetTerms integer = if integer >= 0 then Just $ InvoiceNetTerms integer else Nothing
