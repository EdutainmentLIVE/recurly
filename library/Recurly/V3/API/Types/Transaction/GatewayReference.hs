module Recurly.V3.API.Types.Transaction.GatewayReference where

import Recurlude

newtype TransactionGatewayReference =
    TransactionGatewayReference Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionGatewayReference

instance From TransactionGatewayReference Text
