module Recurly.V3.API.Types.Invoice where

import Recurlude

import qualified Recurly.V3.API.Types.Invoice.CreatedAt as Types
import qualified Recurly.V3.API.Types.Invoice.Id as Types
import qualified Recurly.V3.API.Types.Invoice.State as Types
import qualified Recurly.V3.API.Types.Invoice.Type as Types

data Invoice = Invoice
  { invoiceId :: Types.InvoiceId
  , invoiceType :: Types.InvoiceType
  , invoiceState :: Types.InvoiceState
  , invoiceCreatedAt :: Types.InvoiceCreatedAt
  }
  deriving Show

instance FromJSON Invoice where
  parseJSON = withObject "Invoice" $ \obj -> do
    id_ <- aesonRequired obj "id"
    type_ <- aesonRequired obj "type"
    state <- aesonRequired obj "state"
    createdAt <- aesonRequired obj "created_at"
    pure Invoice
      { invoiceId = id_
      , invoiceType = type_
      , invoiceState = state
      , invoiceCreatedAt = createdAt
      }
