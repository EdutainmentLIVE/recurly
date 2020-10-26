module Recurly.V3.API.Types.PostAccount where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Types
import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data PostAccount = PostAccount
  { postAccountCode :: Types.AccountCode
  , postAccountEmail :: Types.AccountEmail
  , postAccountFirstName :: Types.AccountFirstName
  , postAccountLastName :: Types.AccountLastName
  }
  deriving Show

instance ToJSON PostAccount where
  toJSON = aesonPairHelper
    [ ("code", toJSON . postAccountCode)
    , ("email", toJSON . postAccountEmail)
    , ("first_name", toJSON . postAccountFirstName)
    , ("last_name", toJSON . postAccountLastName)
    ]
