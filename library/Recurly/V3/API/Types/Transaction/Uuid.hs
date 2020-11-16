module Recurly.V3.API.Types.Transaction.Uuid where

import Recurlude

newtype TransactionUuid =
    TransactionUuid Text
    deriving (Eq, Show, FromJSON)

transactionUuidToText :: TransactionUuid -> Text
transactionUuidToText (TransactionUuid text) = text

textToTransactionUuid :: Text -> TransactionUuid
textToTransactionUuid = TransactionUuid
