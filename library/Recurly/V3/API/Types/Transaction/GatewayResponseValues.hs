module Recurly.V3.API.Types.Transaction.GatewayResponseValues where

newtype TransactionGatewayResponseValues =
    TransactionGatewayResponseValues (Map String JsonValue)
    deriving (Eq, Show, FromJSON)

transactionGatewayResponseValuesToMap :: TransactionGatewayResponseValues -> Map String JsonValue
transactionGatewayResponseValuesToMap (TransactionGatewayResponseValues mahp) = mahp
