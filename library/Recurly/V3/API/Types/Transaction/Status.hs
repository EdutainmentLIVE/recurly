module Recurly.V3.API.Types.Transaction.Status where

import Recurlude

data Status
  = Pending
  | Scheduled
  | Processing
  | Success
  | Void
  | Declined
  | Error
  | Chargeback
  deriving (Eq, Show)

instance ToJSON Status where
  toJSON = toJSON . into @Text

instance FromJSON Status where
  parseJSON = withText "Transaction.Status" $ eitherFail . tryInto @Status

instance TryFrom Text Status where
  tryFrom = maybeTryFrom $ \transactionStatus -> case transactionStatus of
    "pending" -> Just Pending
    "scheduled" -> Just Scheduled
    "processing" -> Just Processing
    "success" -> Just Success
    "void" -> Just Void
    "declined" -> Just Declined
    "error" -> Just Error
    "chargeback" -> Just Chargeback
    _ -> Nothing

instance From Status Text where
  from transactionStatus = case transactionStatus of
    Pending -> "pending"
    Scheduled -> "scheduled"
    Processing -> "processing"
    Success -> "success"
    Void -> "void"
    Declined -> "declined"
    Error -> "error"
    Chargeback -> "chargeback"
