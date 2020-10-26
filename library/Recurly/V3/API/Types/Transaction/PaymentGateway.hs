module Recurly.V3.API.Types.Transaction.PaymentGateway where

import Recurlude

import qualified Recurly.V3.API.Types.PaymentGateway.Id as Types
import qualified Recurly.V3.API.Types.PaymentGateway.Name as Types
import qualified Recurly.V3.API.Types.PaymentGateway.Type as Types

data TransactionPaymentGateway = TransactionPaymentGateway
  { transactionPaymentGatewayId :: Types.PaymentGatewayId
  , transactionPaymentGatewayType :: Types.PaymentGatewayType
  , transactionPaymentGatewayName :: Types.PaymentGatewayName
  }
  deriving (Eq, Show)

instance FromJSON TransactionPaymentGateway where
  parseJSON = withObject "TransactionPaymentGateway" $ \obj -> do
    id_ <- aesonRequired obj "id"
    type_ <- aesonRequired obj "type"
    name <- aesonRequired obj "name"
    pure TransactionPaymentGateway
      { transactionPaymentGatewayId = id_
      , transactionPaymentGatewayType = type_
      , transactionPaymentGatewayName = name
      }
