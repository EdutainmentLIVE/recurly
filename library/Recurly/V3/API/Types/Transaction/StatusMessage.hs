module Recurly.V3.API.Types.Transaction.StatusMessage where

newtype TransactionStatusMessage =
    TransactionStatusMessage Text
    deriving (Eq, Show, FromJSON)

transactionStatusMessageToText :: TransactionStatusMessage -> Text
transactionStatusMessageToText (TransactionStatusMessage text) = text

textToTransactionStatusMessage :: Text -> TransactionStatusMessage
textToTransactionStatusMessage = TransactionStatusMessage
