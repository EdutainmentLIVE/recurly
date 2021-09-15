module Recurly.V3.API.Types.Subscription.Account where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Account
import qualified Recurly.V3.API.Types.Account.Email as Account
import qualified Recurly.V3.API.Types.Account.FirstName as Account
import qualified Recurly.V3.API.Types.Account.Id as Account
import qualified Recurly.V3.API.Types.Account.LastName as Account

data Account = Account
  { id_ :: Account.Id
  , code :: Account.Code
  , email :: Account.Email
  , firstName :: Maybe Account.FirstName
  , lastName :: Maybe Account.LastName
  }
  deriving (Eq, Show)

instance FromJSON Account where
  parseJSON = withObject "SubscriptionAccount" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    email <- aesonRequired obj "email"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure Account { id_, code, email, firstName, lastName }
