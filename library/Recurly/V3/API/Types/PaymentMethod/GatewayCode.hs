module Recurly.V3.API.Types.PaymentMethod.GatewayCode where

import Recurlude

newtype GatewayCode = GatewayCode Text
    deriving (Eq, Show, FromJSON)

instance From Text GatewayCode

instance From GatewayCode Text
