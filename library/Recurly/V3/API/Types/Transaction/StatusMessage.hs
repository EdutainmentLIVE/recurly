module Recurly.V3.API.Types.Transaction.StatusMessage where

import Recurlude

newtype TransactionStatusMessage =
    TransactionStatusMessage Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionStatusMessage

instance From TransactionStatusMessage Text
