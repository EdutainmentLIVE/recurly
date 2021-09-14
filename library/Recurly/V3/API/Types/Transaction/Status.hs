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
  toJSON = toJSON . into @Text

instance FromJSON TransactionStatus where
  parseJSON = withText "TransactionStatus" $ eitherFail . tryInto @TransactionStatus

instance TryFrom Text TransactionStatus where
  tryFrom = maybeTryFrom $ \transactionStatus -> case transactionStatus of
    "pending" -> Just PendingTransactionStatus
    "scheduled" -> Just ScheduledTransactionStatus
    "processing" -> Just ProcessingTransactionStatus
    "success" -> Just SuccessTransactionStatus
    "void" -> Just VoidTransactionStatus
    "declined" -> Just DeclinedTransactionStatus
    "error" -> Just ErrorTransactionStatus
    "chargeback" -> Just ChargebackTransactionStatus
    _ -> Nothing

instance From TransactionStatus Text where
  from transactionStatus = case transactionStatus of
    PendingTransactionStatus -> "pending"
    ScheduledTransactionStatus -> "scheduled"
    ProcessingTransactionStatus -> "processing"
    SuccessTransactionStatus -> "success"
    VoidTransactionStatus -> "void"
    DeclinedTransactionStatus -> "declined"
    ErrorTransactionStatus -> "error"
    ChargebackTransactionStatus -> "chargeback"
