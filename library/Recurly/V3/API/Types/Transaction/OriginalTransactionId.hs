module Recurly.V3.API.Types.Transaction.OriginalTransactionId where

newtype TransactionOriginalTransactionId =
    TransactionOriginalTransactionId Text
    deriving (Eq, Show, FromJSON)

transactionOriginalTransactionIdToText :: TransactionOriginalTransactionId -> Text
transactionOriginalTransactionIdToText (TransactionOriginalTransactionId text) = text

textToTransactionOriginalTransactionId :: Text -> TransactionOriginalTransactionId
textToTransactionOriginalTransactionId = TransactionOriginalTransactionId
