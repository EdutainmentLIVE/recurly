module Recurly.V3.API.Types.Transaction.GatewayResponseCode where

newtype TransactionGatewayResponseCode =
    TransactionGatewayResponseCode Text
    deriving (Eq, Show, FromJSON)

transactionGatewayResponseCodeToText :: TransactionGatewayResponseCode -> Text
transactionGatewayResponseCodeToText (TransactionGatewayResponseCode text) = text

textToTransactionGatewayResponseCode :: Text -> TransactionGatewayResponseCode
textToTransactionGatewayResponseCode = TransactionGatewayResponseCode
