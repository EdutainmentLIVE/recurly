module Recurly.V3.API.Types.Transaction.StatusCode where

newtype TransactionStatusCode =
    TransactionStatusCode Text
    deriving (Eq, Show, FromJSON)

transactionStatusCodeToText :: TransactionStatusCode -> Text
transactionStatusCodeToText (TransactionStatusCode text) = text

textToTransactionStatusCode :: Text -> TransactionStatusCode
textToTransactionStatusCode = TransactionStatusCode
