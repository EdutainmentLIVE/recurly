module Recurly.V3.API.Types.Transaction.GatewayReference where

import Recurlude

newtype GatewayReference = GatewayReference Text
    deriving (Eq, Show, FromJSON)

instance From Text GatewayReference

instance From GatewayReference Text
