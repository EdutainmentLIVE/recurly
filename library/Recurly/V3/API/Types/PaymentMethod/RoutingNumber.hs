module Recurly.V3.API.Types.PaymentMethod.RoutingNumber where

import Recurlude

newtype PaymentMethodRoutingNumber =
    PaymentMethodRoutingNumber Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodRoutingNumber

instance From PaymentMethodRoutingNumber Text
