module Recurly.V3.API.Types.Transaction.StatusCode where

import Recurlude

newtype TransactionStatusCode =
    TransactionStatusCode Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionStatusCode

instance From TransactionStatusCode Text
