module Recurly.V3.API.Types.Transaction.GatewayResponseCode where

import Recurlude

newtype GatewayResponseCode =
    GatewayResponseCode Text
    deriving (Eq, Show, FromJSON)

instance From Text GatewayResponseCode

instance From GatewayResponseCode Text
