module Recurly.V3.API.Types.Transaction.GatewayMessage where

import Recurlude

newtype GatewayMessage = GatewayMessage Text
    deriving (Eq, Show, FromJSON)

instance From Text GatewayMessage

instance From GatewayMessage Text
