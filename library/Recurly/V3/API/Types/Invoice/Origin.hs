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
  toJSON = toJSON . invoiceOriginToText

instance FromJSON InvoiceOrigin where
  parseJSON = withText "InvoiceOrigin" $ eitherFail . textToInvoiceOrigin

invoiceOriginToText :: InvoiceOrigin -> Text
invoiceOriginToText invoiceOrigin = case invoiceOrigin of
  PurchaseInvoiceOrigin -> "purchase"
  LineItemRefundInvoiceOrigin -> "line_item_refund"
  OpenAmountRefundInvoiceOrigin -> "open_amount_refund"
  RenewalInvoiceOrigin -> "renewal"
  ImmediateChangeInvoiceOrigin -> "immediate_change"
  TerminationInvoiceOrigin -> "termination"
  CreditInvoiceOrigin -> "credit"
  GiftCardInvoiceOrigin -> "gift_card"
  WriteOffInvoiceOrigin -> "write_off"

textToInvoiceOrigin :: Text -> Either String InvoiceOrigin
textToInvoiceOrigin invoiceOrigin = case invoiceOrigin of
  "purchase" -> Right PurchaseInvoiceOrigin
  "line_item_refund" -> Right LineItemRefundInvoiceOrigin
  "open_amount_refund" -> Right OpenAmountRefundInvoiceOrigin
  "renewal" -> Right RenewalInvoiceOrigin
  "immediate_change" -> Right ImmediateChangeInvoiceOrigin
  "termination" -> Right TerminationInvoiceOrigin
  "credit" -> Right CreditInvoiceOrigin
  "gift_card" -> Right GiftCardInvoiceOrigin
  "write_off" -> Right WriteOffInvoiceOrigin
  _ -> Left $ "Failed to parse InvoiceOrigin from text: " <> show invoiceOrigin
