module Recurly.V3.API.Types.CouponRedemption
  ( module Recurly.V3.API.Types.CouponRedemption
  , CouponRedemption.Coupon
  , CouponRedemption.CreatedAt
  , CouponRedemption.Discounted
  , CouponRedemption.Id
  , CouponRedemption.RemovedAt
  , CouponRedemption.State
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.CouponRedemption.Coupon as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.CreatedAt as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.Discounted as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.Id as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.RemovedAt as CouponRedemption
import qualified Recurly.V3.API.Types.CouponRedemption.State as CouponRedemption

data CouponRedemption = CouponRedemption
  { id_ :: CouponRedemption.Id
  , coupon :: CouponRedemption.Coupon
  , state :: CouponRedemption.State
  , discounted :: CouponRedemption.Discounted
  , createdAt :: CouponRedemption.CreatedAt
  , removedAt :: Maybe CouponRedemption.RemovedAt
  }
  deriving (Eq, Show)

instance FromJSON CouponRedemption where
  parseJSON = withObject "CouponRedemption" $ \obj -> do
    id_ <- aesonRequired obj "id"
    coupon <- aesonRequired obj "coupon"
    state <- aesonRequired obj "state"
    discounted <- aesonRequired obj "discounted"
    createdAt <- aesonRequired obj "created_at"
    removedAt <- aesonOptional obj "removed_at"
    pure CouponRedemption { id_, coupon, state, discounted, createdAt, removedAt }
