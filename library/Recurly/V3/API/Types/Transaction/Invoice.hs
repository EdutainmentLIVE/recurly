module Recurly.V3.API.Types.Transaction.Invoice where

import Recurlude

import qualified Recurly.V3.API.Types.Invoice.Id as Types
import qualified Recurly.V3.API.Types.Invoice.Number as Types
import qualified Recurly.V3.API.Types.Invoice.State as Types
import qualified Recurly.V3.API.Types.Invoice.Type as Types

data TransactionInvoice = TransactionInvoice
  { transactionInvoiceId :: Types.InvoiceId
  , transactionInvoiceNumber :: Types.InvoiceNumber
  , transactionInvoiceType :: Types.InvoiceType
  , transactionInvoiceState :: Types.InvoiceState
  }
  deriving (Eq, Show)

instance FromJSON TransactionInvoice where
  parseJSON = withObject "TransactionInvoice" $ \obj -> do
    id_ <- aesonRequired obj "id"
    number <- aesonRequired obj "number"
    type_ <- aesonRequired obj "type"
    state <- aesonRequired obj "state"
    pure TransactionInvoice
      { transactionInvoiceId = id_
      , transactionInvoiceNumber = number
      , transactionInvoiceType = type_
      , transactionInvoiceState = state
      }
