module Recurly.V3.API.Types.PaymentGateway.Name where

import Recurlude

newtype PaymentGatewayName =
    PaymentGatewayName Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text PaymentGatewayName

instance From PaymentGatewayName Text
