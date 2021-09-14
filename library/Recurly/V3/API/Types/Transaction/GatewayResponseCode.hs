module Recurly.V3.API.Types.Transaction.GatewayResponseCode where

import Recurlude

newtype TransactionGatewayResponseCode =
    TransactionGatewayResponseCode Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionGatewayResponseCode

instance From TransactionGatewayResponseCode Text
