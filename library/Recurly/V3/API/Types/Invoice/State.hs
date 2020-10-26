module Recurly.V3.API.Types.Invoice.State where

import Recurlude

data InvoiceState
  = ClosedInvoiceState
  | FailedInvoiceState
  | OpenInvoiceState
  | PaidInvoiceState
  | PastDueInvoiceState
  | PendingInvoiceState
  | ProcessingInvoiceState
  | VoidedInvoiceState
  deriving (Eq, Show)

instance ToJSON InvoiceState where
  toJSON = toJSON . invoiceStateToText

instance FromJSON InvoiceState where
  parseJSON = withText "InvoiceState" $ eitherFail . textToInvoiceState

invoiceStateToText :: InvoiceState -> Text
invoiceStateToText invoiceState = case invoiceState of
  ClosedInvoiceState -> "closed"
  FailedInvoiceState -> "failed"
  OpenInvoiceState -> "open"
  PaidInvoiceState -> "paid"
  PastDueInvoiceState -> "past_due"
  PendingInvoiceState -> "pending"
  ProcessingInvoiceState -> "processing"
  VoidedInvoiceState -> "voided"

textToInvoiceState :: Text -> Either String InvoiceState
textToInvoiceState invoiceState = case invoiceState of
  "closed" -> Right ClosedInvoiceState
  "failed" -> Right FailedInvoiceState
  "open" -> Right OpenInvoiceState
  "paid" -> Right PaidInvoiceState
  "past_due" -> Right PastDueInvoiceState
  "pending" -> Right PendingInvoiceState
  "processing" -> Right ProcessingInvoiceState
  "voided" -> Right VoidedInvoiceState
  _ -> Left $ "Failed to parse InvoiceState from text: " <> show invoiceState
