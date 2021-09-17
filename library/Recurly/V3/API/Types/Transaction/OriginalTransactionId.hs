module Recurly.V3.API.Types.Transaction.OriginalTransactionId where

import Recurlude

newtype OriginalTransactionId = OriginalTransactionId Text
    deriving (Eq, Show, FromJSON)

instance From Text OriginalTransactionId

instance From OriginalTransactionId Text
