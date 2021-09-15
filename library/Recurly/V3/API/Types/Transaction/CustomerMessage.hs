module Recurly.V3.API.Types.Transaction.CustomerMessage where

import Recurlude

newtype TransactionCustomerMessage =
    TransactionCustomerMessage Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionCustomerMessage

instance From TransactionCustomerMessage Text
