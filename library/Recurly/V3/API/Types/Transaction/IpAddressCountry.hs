module Recurly.V3.API.Types.Transaction.IpAddressCountry where

import Recurlude

newtype TransactionIpAddressCountry =
    TransactionIpAddressCountry Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionIpAddressCountry

instance From TransactionIpAddressCountry Text
