module Recurly.V3.API.Types.Transaction.IpAddressV4 where

import Recurlude

newtype IpAddressV4 = IpAddressV4 Text
    deriving (Eq, Show, FromJSON)

instance From Text IpAddressV4

instance From IpAddressV4 Text
