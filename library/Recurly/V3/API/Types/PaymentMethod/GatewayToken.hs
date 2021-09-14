module Recurly.V3.API.Types.PaymentMethod.GatewayToken where

import Recurlude

newtype PaymentMethodGatewayToken =
    PaymentMethodGatewayToken Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodGatewayToken

instance From PaymentMethodGatewayToken Text
