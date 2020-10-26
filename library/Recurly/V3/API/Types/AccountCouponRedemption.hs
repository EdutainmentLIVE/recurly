module Recurly.V3.API.Types.AccountCouponRedemption where

import Recurlude

import qualified Recurly.V3.API.Types.CouponRedemption.Account as Types
import qualified Recurly.V3.API.Types.CouponRedemption.Coupon as Types
import qualified Recurly.V3.API.Types.CouponRedemption.CreatedAt as Types
import qualified Recurly.V3.API.Types.CouponRedemption.Discounted as Types
import qualified Recurly.V3.API.Types.CouponRedemption.Id as Types
import qualified Recurly.V3.API.Types.CouponRedemption.RemovedAt as Types
import qualified Recurly.V3.API.Types.CouponRedemption.State as Types

data AccountCouponRedemption = AccountCouponRedemption
  { accountCouponRedemptionId :: Types.CouponRedemptionId
  , accountCouponRedemptionAccount :: Types.CouponRedemptionAccount
  , accountCouponRedemptionCoupon :: Types.CouponRedemptionCoupon
  , accountCouponRedemptionState :: Types.CouponRedemptionState
  , accountCouponRedemptionDiscounted :: Types.CouponRedemptionDiscounted
  , accountCouponRedemptionCreatedAt :: Types.CouponRedemptionCreatedAt
  , accountCouponRedemptionRemovedAt :: Maybe Types.CouponRedemptionRemovedAt
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
    pure AccountCouponRedemption
      { accountCouponRedemptionId = id_
      , accountCouponRedemptionAccount = account
      , accountCouponRedemptionCoupon = coupon
      , accountCouponRedemptionState = state
      , accountCouponRedemptionDiscounted = discounted
      , accountCouponRedemptionCreatedAt = createdAt
      , accountCouponRedemptionRemovedAt = removedAt
      }
