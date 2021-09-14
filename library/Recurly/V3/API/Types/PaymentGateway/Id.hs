module Recurly.V3.API.Types.PaymentGateway.Id where

import Recurlude

newtype PaymentGatewayId =
    PaymentGatewayId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text PaymentGatewayId

instance From PaymentGatewayId Text
