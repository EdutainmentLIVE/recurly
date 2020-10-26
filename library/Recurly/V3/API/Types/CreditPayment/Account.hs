module Recurly.V3.API.Types.CreditPayment.Account where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Types
import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.Id as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data CreditPaymentAccount = CreditPaymentAccount
  { creditPaymentAccountId :: Types.AccountId
  , creditPaymentAccountCode :: Types.AccountCode
  , creditPaymentAccountEmail :: Types.AccountEmail
  , creditPaymentAccountFirstName :: Maybe Types.AccountFirstName
  , creditPaymentAccountLastName :: Maybe Types.AccountLastName
  }
  deriving (Eq, Show)

instance FromJSON CreditPaymentAccount where
  parseJSON = withObject "CreditPaymentAccount" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    email <- aesonRequired obj "email"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure CreditPaymentAccount
      { creditPaymentAccountId = id_
      , creditPaymentAccountCode = code
      , creditPaymentAccountEmail = email
      , creditPaymentAccountFirstName = firstName
      , creditPaymentAccountLastName = lastName
      }
