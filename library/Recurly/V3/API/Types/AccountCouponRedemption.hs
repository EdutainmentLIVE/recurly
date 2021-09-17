module Recurly.V3.API.Types.AccountCouponRedemption
  ( module Recurly.V3.API.Types.AccountCouponRedemption
  , CouponRedemption.Account
  , CouponRedemption.Coupon
  , CouponRedemption.CreatedAt
  , CouponRedemption.Discounted
  , CouponRedemption.Id
  , CouponRedemption.RemovedAt
  , CouponRedemption.State
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.CouponRedemption.Account as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.Coupon as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.CreatedAt as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.Discounted as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.Id as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.RemovedAt as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.State as CouponRedemption

data AccountCouponRedemption = AccountCouponRedemption
  { id_ :: CouponRedemption.Id
  , account :: CouponRedemption.Account
  , coupon :: CouponRedemption.Coupon
  , state :: CouponRedemption.State
  , discounted :: CouponRedemption.Discounted
  , createdAt :: CouponRedemption.CreatedAt
  , removedAt :: Maybe CouponRedemption.RemovedAt
  }
  deriving (Eq, Show)

instance FromJSON AccountCouponRedemption where
  parseJSON = withObject "AccountCouponRedemption" $ \obj -> do
    id_ <- aesonRequired obj "id"
    account <- aesonRequired obj "account"
    coupon <- aesonRequired obj "coupon"
    state <- aesonRequired obj "state"
    discounted <- aesonRequired obj "discounted"
    createdAt <- aesonRequired obj "created_at"
    removedAt <- aesonOptional obj "removed_at"
    pure AccountCouponRedemption { id_, account, coupon, state, discounted, createdAt, removedAt }
