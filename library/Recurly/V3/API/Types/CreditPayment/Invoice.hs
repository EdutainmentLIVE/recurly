module Recurly.V3.API.Types.CreditPayment.Invoice where

import Recurlude

import qualified Recurly.V3.API.Types.Invoice.Id as Types
import qualified Recurly.V3.API.Types.Invoice.Number as Types
import qualified Recurly.V3.API.Types.Invoice.State as Types
import qualified Recurly.V3.API.Types.Invoice.Type as Types

data CreditPaymentInvoice = CreditPaymentInvoice
  { creditPaymentInvoiceId :: Types.InvoiceId
  , creditPaymentInvoiceNumber :: Types.InvoiceNumber
  , creditPaymentInvoiceType :: Types.InvoiceType
  , creditPaymentInvoiceState :: Types.InvoiceState
  }
  deriving (Eq, Show)

instance FromJSON CreditPaymentInvoice where
  parseJSON = withObject "CreditPaymentInvoice" $ \obj -> do
    id_ <- aesonRequired obj "id"
    number <- aesonRequired obj "number"
    type_ <- aesonRequired obj "type"
    state <- aesonRequired obj "state"
    pure CreditPaymentInvoice
      { creditPaymentInvoiceId = id_
      , creditPaymentInvoiceNumber = number
      , creditPaymentInvoiceType = type_
      , creditPaymentInvoiceState = state
      }
