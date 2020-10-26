module Recurly.V3.API.Types.Subscription.State where

import Recurlude

data SubscriptionState = ActiveSubscriptionState
                       | CanceledSubscriptionState
                       | ExpiredSubscriptionState
                       | FailedSubscriptionState
                       | FutureSubscriptionState
                       | PausedSubscriptionState
  deriving (Eq, Show)

instance FromJSON SubscriptionState where
  parseJSON = withText "SubscriptionState" $ eitherFail . textToSubscriptionState

subscriptionStateToText :: SubscriptionState -> Text
subscriptionStateToText subscriptionstate = case subscriptionstate of
  ActiveSubscriptionState -> "active"
  CanceledSubscriptionState -> "canceled"
  ExpiredSubscriptionState -> "expired"
  FailedSubscriptionState -> "failed"
  FutureSubscriptionState -> "future"
  PausedSubscriptionState -> "paused"

textToSubscriptionState :: Text -> Either String SubscriptionState
textToSubscriptionState subscriptionType = case subscriptionType of
  "active" -> Right ActiveSubscriptionState
  "canceled" -> Right CanceledSubscriptionState
  "expired" -> Right ExpiredSubscriptionState
  "failed" -> Right FailedSubscriptionState
  "future" -> Right FutureSubscriptionState
  "paused" -> Right PausedSubscriptionState
  _ -> Left $ "Failed to parse SubscriptionState from text: " <> show subscriptionType
