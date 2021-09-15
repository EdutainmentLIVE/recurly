module Recurly.V3.API.Types.Invoice.Origin where

import Recurlude

data Origin
  = Purchase
  | LineItemRefund
  | OpenAmountRefund
  | Renewal
  | ImmediateChange
  | Termination
  | Credit
  | GiftCard
  | WriteOff
  deriving (Eq, Show)

instance ToJSON Origin where
  toJSON = toJSON . into @Text

instance FromJSON Origin where
  parseJSON = withText "InvoiceOrigin" $ eitherFail . tryInto @Origin

instance TryFrom Text Origin where
  tryFrom = maybeTryFrom $ \origin -> case origin of
    "purchase" -> Just Purchase
    "line_item_refund" -> Just LineItemRefund
    "open_amount_refund" -> Just OpenAmountRefund
    "renewal" -> Just Renewal
    "immediate_change" -> Just ImmediateChange
    "termination" -> Just Termination
    "credit" -> Just Credit
    "gift_card" -> Just GiftCard
    "write_off" -> Just WriteOff
    _ -> Nothing

instance From Origin Text where
  from origin = case origin of
    Purchase -> "purchase"
    LineItemRefund -> "line_item_refund"
    OpenAmountRefund -> "open_amount_refund"
    Renewal -> "renewal"
    ImmediateChange -> "immediate_change"
    Termination -> "termination"
    Credit -> "credit"
    GiftCard -> "gift_card"
    WriteOff -> "write_off"
