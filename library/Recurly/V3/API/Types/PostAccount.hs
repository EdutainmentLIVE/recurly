module Recurly.V3.API.Types.PostAccount
  ( module Recurly.V3.API.Types.PostAccount
  , Account.Code
  , Account.Email
  , Account.FirstName
  , Account.LastName
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Account
import qualified Recurly.V3.API.Types.Account.Email as Account
import qualified Recurly.V3.API.Types.Account.FirstName as Account
import qualified Recurly.V3.API.Types.Account.LastName as Account

data PostAccount = PostAccount
  { code :: Account.Code
  , email :: Account.Email
  , firstName :: Account.FirstName
  , lastName :: Account.LastName
  }
  deriving Show

instance ToJSON PostAccount where
  toJSON = aesonPairHelper
    [ ("code", toJSON . code)
    , ("email", toJSON . email)
    , ("first_name", toJSON . firstName)
    , ("last_name", toJSON . lastName)
    ]
