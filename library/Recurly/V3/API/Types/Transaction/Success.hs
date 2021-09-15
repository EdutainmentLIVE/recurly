module Recurly.V3.API.Types.Transaction.Success where

import Recurlude

newtype TransactionSuccess =
    TransactionSuccess Bool
    deriving (Eq, Show, FromJSON)

instance From Bool TransactionSuccess

instance From TransactionSuccess Bool
