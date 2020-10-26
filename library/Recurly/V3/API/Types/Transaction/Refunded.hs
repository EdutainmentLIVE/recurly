module Recurly.V3.API.Types.Transaction.Refunded where

newtype TransactionRefunded =
    TransactionRefunded Bool
    deriving (Eq, Show, FromJSON)

transactionRefundedToBool :: TransactionRefunded -> Bool
transactionRefundedToBool (TransactionRefunded b) = b

boolToTransactionRefunded :: Bool -> TransactionRefunded
boolToTransactionRefunded = TransactionRefunded
