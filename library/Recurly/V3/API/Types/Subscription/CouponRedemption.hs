module Recurly.V3.API.Types.Subscription.CouponRedemption where

import Recurlude

import qualified Recurly.V3.API.Types.CouponRedemption.Coupon as Types
import qualified Recurly.V3.API.Types.CouponRedemption.CreatedAt as Types
import qualified Recurly.V3.API.Types.CouponRedemption.Discounted as Types
import qualified Recurly.V3.API.Types.CouponRedemption.Id as Types
import qualified Recurly.V3.API.Types.CouponRedemption.RemovedAt as Types
import qualified Recurly.V3.API.Types.CouponRedemption.State as Types

data SubscriptionCouponRedemption = SubscriptionCouponRedemption
  { subscriptionCouponRedemptionId :: Types.CouponRedemptionId
  , subscriptionCouponRedemptionCoupon :: Types.CouponRedemptionCoupon
  , subscriptionCouponRedemptionState :: Types.CouponRedemptionState
  , subscriptionCouponRedemptionDiscounted :: Types.CouponRedemptionDiscounted
  , subscriptionCouponRedemptionCreatedAt :: Types.CouponRedemptionCreatedAt
  , subscriptionCouponRedemptionRemovedAt :: Maybe Types.CouponRedemptionRemovedAt
  }
  deriving (Eq, Show)

instance FromJSON SubscriptionCouponRedemption where
  parseJSON = withObject "SubscriptionCouponRedemption" $ \obj -> do
    id_ <- aesonRequired obj "id"
    coupon <- aesonRequired obj "coupon"
    state <- aesonRequired obj "state"
    discounted <- aesonRequired obj "discounted"
    createdAt <- aesonRequired obj "created_at"
    removedAt <- aesonOptional obj "removed_at"
    pure SubscriptionCouponRedemption
      { subscriptionCouponRedemptionId = id_
      , subscriptionCouponRedemptionCoupon = coupon
      , subscriptionCouponRedemptionState = state
      , subscriptionCouponRedemptionDiscounted = discounted
      , subscriptionCouponRedemptionCreatedAt = createdAt
      , subscriptionCouponRedemptionRemovedAt = removedAt
      }
