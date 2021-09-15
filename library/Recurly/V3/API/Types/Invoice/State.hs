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
  toJSON = toJSON . into @Text

instance FromJSON InvoiceState where
  parseJSON = withText "InvoiceState" $ eitherFail . tryInto @InvoiceState

instance TryFrom Text InvoiceState where
  tryFrom = maybeTryFrom $ \invoiceState -> case invoiceState of
    "closed" -> Just ClosedInvoiceState
    "failed" -> Just FailedInvoiceState
    "open" -> Just OpenInvoiceState
    "paid" -> Just PaidInvoiceState
    "past_due" -> Just PastDueInvoiceState
    "pending" -> Just PendingInvoiceState
    "processing" -> Just ProcessingInvoiceState
    "voided" -> Just VoidedInvoiceState
    _ -> Nothing

instance From InvoiceState Text where
  from invoiceState = case invoiceState of
    ClosedInvoiceState -> "closed"
    FailedInvoiceState -> "failed"
    OpenInvoiceState -> "open"
    PaidInvoiceState -> "paid"
    PastDueInvoiceState -> "past_due"
    PendingInvoiceState -> "pending"
    ProcessingInvoiceState -> "processing"
    VoidedInvoiceState -> "voided"
