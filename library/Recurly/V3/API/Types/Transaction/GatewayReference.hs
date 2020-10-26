module Recurly.V3.API.Types.Transaction.GatewayReference where

newtype TransactionGatewayReference =
    TransactionGatewayReference Text
    deriving (Eq, Show, FromJSON)

transactionGatewayReferenceToText :: TransactionGatewayReference -> Text
transactionGatewayReferenceToText (TransactionGatewayReference text) = text

textToTransactionGatewayReference :: Text -> TransactionGatewayReference
textToTransactionGatewayReference = TransactionGatewayReference
