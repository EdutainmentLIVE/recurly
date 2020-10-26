module Recurly.V3.API.Types.CouponRedemption.State where

import Recurlude

data CouponRedemptionState = ActiveCouponRedemptionState
                       | InactiveCouponRedemptionState
  deriving (Eq, Show)

instance ToJSON CouponRedemptionState where
  toJSON = toJSON . couponRedemptionStateToText

instance FromJSON CouponRedemptionState where
  parseJSON = withText "CouponRedemptionState" $ eitherFail . textToCouponRedemptionState

couponRedemptionStateToText :: CouponRedemptionState -> Text
couponRedemptionStateToText couponredemptionstate = case couponredemptionstate of
  ActiveCouponRedemptionState -> "active"
  InactiveCouponRedemptionState -> "inactive"

textToCouponRedemptionState :: Text -> Either String CouponRedemptionState
textToCouponRedemptionState couponredemptionType = case couponredemptionType of
  "active" -> Right ActiveCouponRedemptionState
  "inactive" -> Right InactiveCouponRedemptionState
  _ -> Left $ "Failed to parse CouponRedemptionState from text: " <> show couponredemptionType
