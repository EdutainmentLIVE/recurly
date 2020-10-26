module Recurly.V3.API.Types.Transaction.Account where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Types
import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.Id as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data TransactionAccount = TransactionAccount
  { transactionAccountId :: Types.AccountId
  , transactionAccountCode :: Types.AccountCode
  , transactionAccountEmail :: Types.AccountEmail
  , transactionAccountFirstName :: Maybe Types.AccountFirstName
  , transactionAccountLastName :: Maybe Types.AccountLastName
  }
  deriving (Eq, Show)

instance FromJSON TransactionAccount where
  parseJSON = withObject "TransactionAccount" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    email <- aesonRequired obj "email"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure TransactionAccount
      { transactionAccountId = id_
      , transactionAccountCode = code
      , transactionAccountEmail = email
      , transactionAccountFirstName = firstName
      , transactionAccountLastName = lastName
      }
