module Recurly.V3.API.Types.PaymentGateway.Type where

import Recurlude

newtype PaymentGatewayType =
    PaymentGatewayType Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text PaymentGatewayType

instance From PaymentGatewayType Text
