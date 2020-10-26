module Recurly.V3.API.Types.Transaction.Success where

newtype TransactionSuccess =
    TransactionSuccess Bool
    deriving (Eq, Show, FromJSON)

transactionSuccessToBool :: TransactionSuccess -> Bool
transactionSuccessToBool (TransactionSuccess b) = b

boolToTransactionSuccess :: Bool -> TransactionSuccess
boolToTransactionSuccess = TransactionSuccess
