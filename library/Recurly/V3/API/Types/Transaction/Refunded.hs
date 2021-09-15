module Recurly.V3.API.Types.Transaction.Refunded where

import Recurlude

newtype TransactionRefunded =
    TransactionRefunded Bool
    deriving (Eq, Show, FromJSON)

instance From Bool TransactionRefunded

instance From TransactionRefunded Bool
