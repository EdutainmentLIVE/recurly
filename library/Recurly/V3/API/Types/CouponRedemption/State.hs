module Recurly.V3.API.Types.CouponRedemption.State where

import Recurlude

data CouponRedemptionState = ActiveCouponRedemptionState
                       | InactiveCouponRedemptionState
  deriving (Eq, Show)

instance ToJSON CouponRedemptionState where
  toJSON = toJSON . into @Text

instance FromJSON CouponRedemptionState where
  parseJSON = withText "CouponRedemptionState" $ eitherFail . tryInto @CouponRedemptionState

instance TryFrom Text CouponRedemptionState where
  tryFrom = maybeTryFrom $ \couponRedemptionState -> case couponRedemptionState of
    "active" -> Just ActiveCouponRedemptionState
    "inactive" -> Just InactiveCouponRedemptionState
    _ -> Nothing

instance From CouponRedemptionState Text where
  from couponRedemptionState = case couponRedemptionState of
    ActiveCouponRedemptionState -> "active"
    InactiveCouponRedemptionState -> "inactive"
