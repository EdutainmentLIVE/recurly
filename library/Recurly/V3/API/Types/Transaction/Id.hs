module Recurly.V3.API.Types.Transaction.Id where

import Recurlude

newtype TransactionId =
    TransactionId Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionId

instance From TransactionId Text
