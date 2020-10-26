module Recurly.V3.API.Types.Transaction.GatewayApprovalCode where

newtype TransactionGatewayApprovalCode =
    TransactionGatewayApprovalCode Text
    deriving (Eq, Show, FromJSON)

transactionGatewayApprovalCodeToText :: TransactionGatewayApprovalCode -> Text
transactionGatewayApprovalCodeToText (TransactionGatewayApprovalCode text) = text

textToTransactionGatewayApprovalCode :: Text -> TransactionGatewayApprovalCode
textToTransactionGatewayApprovalCode = TransactionGatewayApprovalCode
