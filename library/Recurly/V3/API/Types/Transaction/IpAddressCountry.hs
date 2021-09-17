module Recurly.V3.API.Types.Transaction.IpAddressCountry where

import Recurlude

newtype IpAddressCountry = IpAddressCountry Text
    deriving (Eq, Show, FromJSON)

instance From Text IpAddressCountry

instance From IpAddressCountry Text
