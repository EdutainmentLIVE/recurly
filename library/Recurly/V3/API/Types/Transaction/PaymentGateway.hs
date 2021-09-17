module Recurly.V3.API.Types.Transaction.PaymentGateway where

import Recurlude

import qualified Recurly.V3.API.Types.PaymentGateway.Id as PaymentGateway
import qualified Recurly.V3.API.Types.PaymentGateway.Name as PaymentGateway
import qualified Recurly.V3.API.Types.PaymentGateway.Type as PaymentGateway

data PaymentGateway = PaymentGateway
  { id_ :: PaymentGateway.Id
  , type_ :: PaymentGateway.Type
  , name :: PaymentGateway.Name
  }
  deriving (Eq, Show)

instance FromJSON PaymentGateway where
  parseJSON = withObject "TransactionPaymentGateway" $ \obj -> do
    id_ <- aesonRequired obj "id"
    type_ <- aesonRequired obj "type"
    name <- aesonRequired obj "name"
    pure PaymentGateway { id_, type_, name }
