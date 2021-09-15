module Recurly.V3.API.Types.Transaction.Amount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype TransactionAmount =
    TransactionAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD TransactionAmount

instance From TransactionAmount Money.DenseUSD
