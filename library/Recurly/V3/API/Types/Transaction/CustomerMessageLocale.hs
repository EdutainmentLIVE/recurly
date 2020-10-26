module Recurly.V3.API.Types.Transaction.CustomerMessageLocale where

newtype TransactionCustomerMessageLocale =
    TransactionCustomerMessageLocale Text
    deriving (Eq, Show, FromJSON)

transactionCustomerMessageLocaleToText :: TransactionCustomerMessageLocale -> Text
transactionCustomerMessageLocaleToText (TransactionCustomerMessageLocale text) = text

textToTransactionCustomerMessageLocale :: Text -> TransactionCustomerMessageLocale
textToTransactionCustomerMessageLocale = TransactionCustomerMessageLocale
