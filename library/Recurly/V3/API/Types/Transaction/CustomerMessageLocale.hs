module Recurly.V3.API.Types.Transaction.CustomerMessageLocale where

import Recurlude

newtype CustomerMessageLocale = CustomerMessageLocale Text
    deriving (Eq, Show, FromJSON)

instance From Text CustomerMessageLocale

instance From CustomerMessageLocale Text
