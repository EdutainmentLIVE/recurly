module Recurly.V3.API.Types.PaymentMethod.RoutingNumberBank where

import Recurlude

newtype RoutingNumberBank = RoutingNumberBank Text
    deriving (Eq, Show, FromJSON)

instance From Text RoutingNumberBank

instance From RoutingNumberBank Text
