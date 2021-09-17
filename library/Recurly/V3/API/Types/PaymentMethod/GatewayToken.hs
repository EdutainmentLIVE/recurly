module Recurly.V3.API.Types.PaymentMethod.GatewayToken where

import Recurlude

newtype GatewayToken = GatewayToken Text
    deriving (Eq, Show, FromJSON)

instance From Text GatewayToken

instance From GatewayToken Text
