module Recurly.V3.API.Types.Transaction.Uuid where

import Recurlude

newtype TransactionUuid =
    TransactionUuid Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionUuid

instance From TransactionUuid Text
