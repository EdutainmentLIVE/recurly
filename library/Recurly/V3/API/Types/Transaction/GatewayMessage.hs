module Recurly.V3.API.Types.Transaction.GatewayMessage where

newtype TransactionGatewayMessage =
    TransactionGatewayMessage Text
    deriving (Eq, Show, FromJSON)

transactionGatewayMessageToText :: TransactionGatewayMessage -> Text
transactionGatewayMessageToText (TransactionGatewayMessage text) = text

textToTransactionGatewayMessage :: Text -> TransactionGatewayMessage
textToTransactionGatewayMessage = TransactionGatewayMessage
