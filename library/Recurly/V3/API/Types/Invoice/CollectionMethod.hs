module Recurly.V3.API.Types.Invoice.CollectionMethod where

import Recurlude

data InvoiceCollectionMethod
  = AutomaticInvoiceCollectionMethod
  | ManualInvoiceCollectionMethod
  deriving (Eq, Show)

instance ToJSON InvoiceCollectionMethod where
  toJSON = toJSON . invoiceCollectionMethodToText

instance FromJSON InvoiceCollectionMethod where
  parseJSON = withText "InvoiceCollectionMethod" $ eitherFail . textToInvoiceCollectionMethod

invoiceCollectionMethodToText :: InvoiceCollectionMethod -> Text
invoiceCollectionMethodToText invoiceCollectionMethod = case invoiceCollectionMethod of
  AutomaticInvoiceCollectionMethod -> "automatic"
  ManualInvoiceCollectionMethod -> "manual"

textToInvoiceCollectionMethod :: Text -> Either String InvoiceCollectionMethod
textToInvoiceCollectionMethod invoiceCollectionMethod = case invoiceCollectionMethod of
  "automatic" -> Right AutomaticInvoiceCollectionMethod
  "manual" -> Right ManualInvoiceCollectionMethod
  _ -> Left $ "Failed to parse InvoiceCollectionMethod from text: " <> show invoiceCollectionMethod
