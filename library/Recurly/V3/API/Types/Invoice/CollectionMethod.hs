module Recurly.V3.API.Types.Invoice.CollectionMethod where

import Recurlude

data InvoiceCollectionMethod
  = AutomaticInvoiceCollectionMethod
  | ManualInvoiceCollectionMethod
  deriving (Eq, Show)

instance ToJSON InvoiceCollectionMethod where
  toJSON = toJSON . into @Text

instance FromJSON InvoiceCollectionMethod where
  parseJSON = withText "InvoiceCollectionMethod" $ eitherFail . tryInto @InvoiceCollectionMethod

instance TryFrom Text InvoiceCollectionMethod where
  tryFrom = maybeTryFrom $ \invoiceCollectionMethod -> case invoiceCollectionMethod of
    "automatic" -> Just AutomaticInvoiceCollectionMethod
    "manual" -> Just ManualInvoiceCollectionMethod
    _ -> Nothing

instance From InvoiceCollectionMethod Text where
  from invoiceCollectionMethod = case invoiceCollectionMethod of
    AutomaticInvoiceCollectionMethod -> "automatic"
    ManualInvoiceCollectionMethod -> "manual"
