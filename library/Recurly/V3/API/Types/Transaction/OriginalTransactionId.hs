module Recurly.V3.API.Types.Transaction.OriginalTransactionId where

import Recurlude

newtype TransactionOriginalTransactionId =
    TransactionOriginalTransactionId Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionOriginalTransactionId

instance From TransactionOriginalTransactionId Text
