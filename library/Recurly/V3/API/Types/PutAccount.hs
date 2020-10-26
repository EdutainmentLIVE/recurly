module Recurly.V3.API.Types.PutAccount where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data PutAccount = PutAccount
  { putAccountEmail :: Types.AccountEmail
  , putAccountFirstName :: Types.AccountFirstName
  , putAccountLastName :: Types.AccountLastName
  }
  deriving Show

instance ToJSON PutAccount where
  toJSON = aesonPairHelper
    [ ("email", toJSON . putAccountEmail)
    , ("first_name", toJSON . putAccountFirstName)
    , ("last_name", toJSON . putAccountLastName)
    ]
