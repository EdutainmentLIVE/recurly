module Recurly.V3.API.Types.Invoice
  ( module Recurly.V3.API.Types.Invoice
  , Invoice.CreatedAt
  , Invoice.Id
  , Invoice.State
  , Invoice.Type
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.Invoice.CreatedAt as Invoice
import qualified Recurly.V3.API.Types.Invoice.Id as Invoice
import qualified Recurly.V3.API.Types.Invoice.State as Invoice
import qualified Recurly.V3.API.Types.Invoice.Type as Invoice

data Invoice = Invoice
  { id_ :: Invoice.Id
  , type_ :: Invoice.Type
  , state :: Invoice.State
  , createdAt :: Invoice.CreatedAt
  }
  deriving Show

instance FromJSON Invoice where
  parseJSON = withObject "Invoice" $ \obj -> do
    id_ <- aesonRequired obj "id"
    type_ <- aesonRequired obj "type"
    state <- aesonRequired obj "state"
    createdAt <- aesonRequired obj "created_at"
    pure Invoice { id_, type_, state, createdAt }
