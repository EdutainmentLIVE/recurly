module Recurly.V3.API.Types.Subscription.Account where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Types
import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.Id as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data SubscriptionAccount = SubscriptionAccount
  { subscriptionAccountId :: Types.AccountId
  , subscriptionAccountCode :: Types.AccountCode
  , subscriptionAccountEmail :: Types.AccountEmail
  , subscriptionAccountFirstName :: Maybe Types.AccountFirstName
  , subscriptionAccountLastName :: Maybe Types.AccountLastName
  }
  deriving (Eq, Show)

instance FromJSON SubscriptionAccount where
  parseJSON = withObject "SubscriptionAccount" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    email <- aesonRequired obj "email"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure SubscriptionAccount
      { subscriptionAccountId = id_
      , subscriptionAccountCode = code
      , subscriptionAccountEmail = email
      , subscriptionAccountFirstName = firstName
      , subscriptionAccountLastName = lastName
      }
