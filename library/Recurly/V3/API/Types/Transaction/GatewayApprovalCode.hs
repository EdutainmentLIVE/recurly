module Recurly.V3.API.Types.Transaction.GatewayApprovalCode where

import Recurlude

newtype TransactionGatewayApprovalCode =
    TransactionGatewayApprovalCode Text
    deriving (Eq, Show, FromJSON)

instance From Text TransactionGatewayApprovalCode

instance From TransactionGatewayApprovalCode Text
