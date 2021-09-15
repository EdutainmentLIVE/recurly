module Recurly.V3.API.Types.CreditPayment.Invoice where

import Recurlude

import qualified Recurly.V3.API.Types.Invoice.Id as Invoice
import qualified Recurly.V3.API.Types.Invoice.Number as Invoice
import qualified Recurly.V3.API.Types.Invoice.State as Invoice
import qualified Recurly.V3.API.Types.Invoice.Type as Invoice

data Invoice = Invoice
  { id_ :: Invoice.Id
  , number :: Invoice.Number
  , type_ :: Invoice.Type
  , state :: Invoice.State
  }
  deriving (Eq, Show)

instance FromJSON Invoice where
  parseJSON = withObject "CreditPaymentInvoice" $ \obj -> do
    id_ <- aesonRequired obj "id"
    number <- aesonRequired obj "number"
    type_ <- aesonRequired obj "type"
    state <- aesonRequired obj "state"
    pure Invoice { id_, number, type_, state }
