module Recurly.V3.API.Types.Transaction.CustomerMessageLocale where

import Recurlude

newtype TransactionCustomerMessageLocale =
    TransactionCustomerMessageLocale Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionCustomerMessageLocale

instance From TransactionCustomerMessageLocale Text
