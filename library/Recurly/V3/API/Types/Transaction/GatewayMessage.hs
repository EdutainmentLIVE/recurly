module Recurly.V3.API.Types.Transaction.GatewayMessage where

import Recurlude

newtype TransactionGatewayMessage =
    TransactionGatewayMessage Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionGatewayMessage

instance From TransactionGatewayMessage Text
