module Recurly.V3.API.Types.Invoice.Account where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Types
import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.Id as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data InvoiceAccount = InvoiceAccount
  { invoiceAccountId :: Types.AccountId
  , invoiceAccountCode :: Types.AccountCode
  , invoiceAccountEmail :: Types.AccountEmail
  , invoiceAccountFirstName :: Maybe Types.AccountFirstName
  , invoiceAccountLastName :: Maybe Types.AccountLastName
  }
  deriving (Eq, Show)

instance FromJSON InvoiceAccount where
  parseJSON = withObject "InvoiceAccount" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    email <- aesonRequired obj "email"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure InvoiceAccount
      { invoiceAccountId = id_
      , invoiceAccountCode = code
      , invoiceAccountEmail = email
      , invoiceAccountFirstName = firstName
      , invoiceAccountLastName = lastName
      }
