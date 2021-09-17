module Recurly.V3.API.Types.Invoice.State where

import Recurlude

data State
  = Closed
  | Failed
  | Open
  | Paid
  | PastDue
  | Pending
  | Processing
  | Voided
  deriving (Eq, Show)

instance ToJSON State where
  toJSON = toJSON . into @Text

instance FromJSON State where
  parseJSON = withText "Invoice.State" $ eitherFail . tryInto @State

instance TryFrom Text State where
  tryFrom = maybeTryFrom $ \state -> case state of
    "closed" -> Just Closed
    "failed" -> Just Failed
    "open" -> Just Open
    "paid" -> Just Paid
    "past_due" -> Just PastDue
    "pending" -> Just Pending
    "processing" -> Just Processing
    "voided" -> Just Voided
    _ -> Nothing

instance From State Text where
  from state = case state of
    Closed -> "closed"
    Failed -> "failed"
    Open -> "open"
    Paid -> "paid"
    PastDue -> "past_due"
    Pending -> "pending"
    Processing -> "processing"
    Voided -> "voided"
