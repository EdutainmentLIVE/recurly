module Recurly.V3.API.Types.PutAccount
  ( module Recurly.V3.API.Types.PutAccount
  , Account.Email
  , Account.FirstName
  , Account.LastName
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Email as Account
import qualified Recurly.V3.API.Types.Account.FirstName as Account
import qualified Recurly.V3.API.Types.Account.LastName as Account

data PutAccount = PutAccount
  { email :: Account.Email
  , firstName :: Account.FirstName
  , lastName :: Account.LastName
  }
  deriving Show

instance ToJSON PutAccount where
  toJSON = aesonPairHelper
    [ ("email", toJSON . email)
    , ("first_name", toJSON . firstName)
    , ("last_name", toJSON . lastName)
    ]
