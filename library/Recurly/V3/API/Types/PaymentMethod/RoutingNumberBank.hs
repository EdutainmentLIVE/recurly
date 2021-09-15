module Recurly.V3.API.Types.PaymentMethod.RoutingNumberBank where

import Recurlude

newtype PaymentMethodRoutingNumberBank =
    PaymentMethodRoutingNumberBank Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodRoutingNumberBank

instance From PaymentMethodRoutingNumberBank Text
