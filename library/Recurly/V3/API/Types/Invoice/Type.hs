module Recurly.V3.API.Types.Invoice.Type where

import Recurlude

data InvoiceType
  = ChargeInvoiceType
  | CreditInvoiceType
  | LegacyInvoiceType
  deriving (Eq, Show)

instance ToJSON InvoiceType where
  toJSON = toJSON . invoiceTypeToText

instance FromJSON InvoiceType where
  parseJSON = withText "InvoiceType" $ eitherFail . textToInvoiceType

invoiceTypeToText :: InvoiceType -> Text
invoiceTypeToText invoiceType = case invoiceType of
  ChargeInvoiceType -> "charge"
  CreditInvoiceType -> "credit"
  LegacyInvoiceType -> "legacy"

textToInvoiceType :: Text -> Either String InvoiceType
textToInvoiceType invoiceType = case invoiceType of
  "charge" -> Right ChargeInvoiceType
  "credit" -> Right CreditInvoiceType
  "legacy" -> Right LegacyInvoiceType
  _ -> Left $ "Failed to parse InvoiceType from text: " <> show invoiceType
