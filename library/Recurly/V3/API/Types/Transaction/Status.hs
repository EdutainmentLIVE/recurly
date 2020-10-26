module Recurly.V3.API.Types.Transaction.Status where

import Recurlude

data TransactionStatus
  = PendingTransactionStatus
  | ScheduledTransactionStatus
  | ProcessingTransactionStatus
  | SuccessTransactionStatus
  | VoidTransactionStatus
  | DeclinedTransactionStatus
  | ErrorTransactionStatus
  | ChargebackTransactionStatus
  deriving (Eq, Show)

instance ToJSON TransactionStatus where
  toJSON = toJSON . transactionStatusToText

instance FromJSON TransactionStatus where
  parseJSON = withText "TransactionStatus" $ eitherFail . textToTransactionStatus

transactionStatusToText :: TransactionStatus -> Text
transactionStatusToText transactionStatus = case transactionStatus of
  PendingTransactionStatus -> "pending"
  ScheduledTransactionStatus -> "scheduled"
  ProcessingTransactionStatus -> "processing"
  SuccessTransactionStatus -> "success"
  VoidTransactionStatus -> "void"
  DeclinedTransactionStatus -> "declined"
  ErrorTransactionStatus -> "error"
  ChargebackTransactionStatus -> "chargeback"

textToTransactionStatus :: Text -> Either String TransactionStatus
textToTransactionStatus transactionStatus = case transactionStatus of
  "pending" -> Right PendingTransactionStatus
  "scheduled" -> Right ScheduledTransactionStatus
  "processing" -> Right ProcessingTransactionStatus
  "success" -> Right SuccessTransactionStatus
  "void" -> Right VoidTransactionStatus
  "declined" -> Right DeclinedTransactionStatus
  "error" -> Right ErrorTransactionStatus
  "chargeback" -> Right ChargebackTransactionStatus
  _ -> Left $ "Failed to parse TransactionStatus from text: " <> show transactionStatus
