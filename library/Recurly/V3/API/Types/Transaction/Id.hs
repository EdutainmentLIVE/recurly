module Recurly.V3.API.Types.Transaction.Id where

import Recurlude

newtype TransactionId =
    TransactionId Text
    deriving (Eq, Show, FromJSON)

transactionIdToText :: TransactionId -> Text
transactionIdToText (TransactionId text) = text

textToTransactionId :: Text -> TransactionId
textToTransactionId = TransactionId
