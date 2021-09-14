module Recurly.V3.API.Types.PaymentMethod.GatewayCode where

import Recurlude

newtype PaymentMethodGatewayCode =
    PaymentMethodGatewayCode Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodGatewayCode

instance From PaymentMethodGatewayCode Text
