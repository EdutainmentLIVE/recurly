module Recurly.V3.API.Types.Transaction.GatewayApprovalCode where

import Recurlude

newtype GatewayApprovalCode = GatewayApprovalCode Text
    deriving (Eq, Show, FromJSON)

instance From Text GatewayApprovalCode

instance From GatewayApprovalCode Text
