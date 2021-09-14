module Recurly.V3.API.Types.Invoice.Origin where

import Recurlude

data InvoiceOrigin
  = PurchaseInvoiceOrigin
  | LineItemRefundInvoiceOrigin
  | OpenAmountRefundInvoiceOrigin
  | RenewalInvoiceOrigin
  | ImmediateChangeInvoiceOrigin
  | TerminationInvoiceOrigin
  | CreditInvoiceOrigin
  | GiftCardInvoiceOrigin
  | WriteOffInvoiceOrigin
  deriving (Eq, Show)

instance ToJSON InvoiceOrigin where
  toJSON = toJSON . into @Text

instance FromJSON InvoiceOrigin where
  parseJSON = withText "InvoiceOrigin" $ eitherFail . tryInto @InvoiceOrigin

instance TryFrom Text InvoiceOrigin where
  tryFrom = maybeTryFrom $ \invoiceOrigin -> case invoiceOrigin of
    "purchase" -> Just PurchaseInvoiceOrigin
    "line_item_refund" -> Just LineItemRefundInvoiceOrigin
    "open_amount_refund" -> Just OpenAmountRefundInvoiceOrigin
    "renewal" -> Just RenewalInvoiceOrigin
    "immediate_change" -> Just ImmediateChangeInvoiceOrigin
    "termination" -> Just TerminationInvoiceOrigin
    "credit" -> Just CreditInvoiceOrigin
    "gift_card" -> Just GiftCardInvoiceOrigin
    "write_off" -> Just WriteOffInvoiceOrigin
    _ -> Nothing

instance From InvoiceOrigin Text where
  from invoiceOrigin = case invoiceOrigin of
    PurchaseInvoiceOrigin -> "purchase"
    LineItemRefundInvoiceOrigin -> "line_item_refund"
    OpenAmountRefundInvoiceOrigin -> "open_amount_refund"
    RenewalInvoiceOrigin -> "renewal"
    ImmediateChangeInvoiceOrigin -> "immediate_change"
    TerminationInvoiceOrigin -> "termination"
    CreditInvoiceOrigin -> "credit"
    GiftCardInvoiceOrigin -> "gift_card"
    WriteOffInvoiceOrigin -> "write_off"
