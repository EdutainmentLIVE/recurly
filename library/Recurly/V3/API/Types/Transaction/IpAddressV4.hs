module Recurly.V3.API.Types.Transaction.IpAddressV4 where

import Recurlude

newtype TransactionIpAddressV4 =
    TransactionIpAddressV4 Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionIpAddressV4

instance From TransactionIpAddressV4 Text
