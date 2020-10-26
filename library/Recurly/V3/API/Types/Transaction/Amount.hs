module Recurly.V3.API.Types.Transaction.Amount where

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype TransactionAmount =
    TransactionAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

transactionAmountToDenseUSD :: TransactionAmount -> Money.DenseUSD
transactionAmountToDenseUSD (TransactionAmount denseUSD) = denseUSD

denseUSDToTransactionAmount :: Money.DenseUSD -> TransactionAmount
denseUSDToTransactionAmount = TransactionAmount
