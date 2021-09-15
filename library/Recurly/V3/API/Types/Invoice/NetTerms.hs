module Recurly.V3.API.Types.Invoice.NetTerms where

import Recurlude

newtype InvoiceNetTerms =
    InvoiceNetTerms Integer
    deriving (Eq, Show, FromJSON)

instance TryFrom Integer InvoiceNetTerms where
  tryFrom = maybeTryFrom $ \invoiceNetTerms ->
    if invoiceNetTerms >= 0 then Just $ InvoiceNetTerms invoiceNetTerms else Nothing

instance From InvoiceNetTerms Integer
