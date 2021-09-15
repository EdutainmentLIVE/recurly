module Recurly.V3.API.Types.CouponRedemption.State where

import Recurlude

data State = Active
           | Inactive
  deriving (Eq, Show)

instance ToJSON State where
  toJSON = toJSON . into @Text

instance FromJSON State where
  parseJSON = withText "CouponRedemptionState" $ eitherFail . tryInto @State

instance TryFrom Text State where
  tryFrom = maybeTryFrom $ \couponRedemptionState -> case couponRedemptionState of
    "active" -> Just Active
    "inactive" -> Just Inactive
    _ -> Nothing

instance From State Text where
  from couponRedemptionState = case couponRedemptionState of
    Active -> "active"
    Inactive -> "inactive"
