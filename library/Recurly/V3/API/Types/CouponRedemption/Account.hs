module Recurly.V3.API.Types.CouponRedemption.Account where

import Recurlude

import qualified Recurly.V3.API.Types.Account.Code as Types
import qualified Recurly.V3.API.Types.Account.Email as Types
import qualified Recurly.V3.API.Types.Account.FirstName as Types
import qualified Recurly.V3.API.Types.Account.Id as Types
import qualified Recurly.V3.API.Types.Account.LastName as Types

data CouponRedemptionAccount = CouponRedemptionAccount
  { couponRedemptionAccountId :: Types.AccountId
  , couponRedemptionAccountCode :: Types.AccountCode
  , couponRedemptionAccountEmail :: Types.AccountEmail
  , couponRedemptionAccountFirstName :: Maybe Types.AccountFirstName
  , couponRedemptionAccountLastName :: Maybe Types.AccountLastName
  }
  deriving (Eq, Show)

instance FromJSON CouponRedemptionAccount where
  parseJSON = withObject "CouponRedemptionAccount" $ \obj -> do
    id_ <- aesonRequired obj "id"
    code <- aesonRequired obj "code"
    email <- aesonRequired obj "email"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure CouponRedemptionAccount
      { couponRedemptionAccountId = id_
      , couponRedemptionAccountCode = code
      , couponRedemptionAccountEmail = email
      , couponRedemptionAccountFirstName = firstName
      , couponRedemptionAccountLastName = lastName
      }
