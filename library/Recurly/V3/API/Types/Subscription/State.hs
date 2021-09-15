module Recurly.V3.API.Types.Subscription.State where

import Recurlude

data SubscriptionState = ActiveSubscriptionState
                       | CanceledSubscriptionState
                       | ExpiredSubscriptionState
                       | FailedSubscriptionState
                       | FutureSubscriptionState
                       | PausedSubscriptionState
  deriving (Eq, Show)

instance ToJSON SubscriptionState where
  toJSON = toJSON . into @Text

instance FromJSON SubscriptionState where
  parseJSON = withText "SubscriptionState" $ eitherFail . tryInto @SubscriptionState

instance TryFrom Text SubscriptionState where
  tryFrom = maybeTryFrom $ \subscriptionState -> case subscriptionState of
    "active" -> Just ActiveSubscriptionState
    "canceled" -> Just CanceledSubscriptionState
    "expired" -> Just ExpiredSubscriptionState
    "failed" -> Just FailedSubscriptionState
    "future" -> Just FutureSubscriptionState
    "paused" -> Just PausedSubscriptionState
    _ -> Nothing

instance From SubscriptionState Text where
  from subscriptionState = case subscriptionState of
    ActiveSubscriptionState -> "active"
    CanceledSubscriptionState -> "canceled"
    ExpiredSubscriptionState -> "expired"
    FailedSubscriptionState -> "failed"
    FutureSubscriptionState -> "future"
    PausedSubscriptionState -> "paused"
