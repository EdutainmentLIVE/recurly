module Recurly.V3.API.Types.Account where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Types
import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.Id as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data Account = Account
  { accountId :: Types.AccountId
  , accountCode :: Types.AccountCode
  , accountEmail :: Types.AccountEmail
  , accountFirstName :: Maybe Types.AccountFirstName
  , accountLastName :: Maybe Types.AccountLastName
  }
  deriving (Eq, Show)

instance FromJSON Account where
  parseJSON = withObject "Account" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    email <- aesonRequired obj "email"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure Account
      { accountId = id_
      , accountCode = code
      , accountEmail = email
      , accountFirstName = firstName
      , accountLastName = lastName
      }
