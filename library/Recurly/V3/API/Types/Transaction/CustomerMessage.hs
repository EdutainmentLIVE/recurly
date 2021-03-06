module Recurly.V3.API.Types.Transaction.CustomerMessage where

import Recurlude

newtype TransactionCustomerMessage =
    TransactionCustomerMessage Text
    deriving (Eq, Show, FromJSON)

transactionCustomerMessageToText :: TransactionCustomerMessage -> Text
transactionCustomerMessageToText (TransactionCustomerMessage text) = text

textToTransactionCustomerMessage :: Text -> TransactionCustomerMessage
textToTransactionCustomerMessage = TransactionCustomerMessage
