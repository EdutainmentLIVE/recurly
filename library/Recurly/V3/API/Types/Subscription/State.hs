module Recurly.V3.API.Types.Subscription.State where

import Recurlude

data State = Active
           | Canceled
           | Expired
           | Failed
           | Future
           | Paused
  deriving (Eq, Show)

instance ToJSON State where
  toJSON = toJSON . into @Text

instance FromJSON State where
  parseJSON = withText "Subscription.State" $ eitherFail . tryInto @State

instance TryFrom Text State where
  tryFrom = maybeTryFrom $ \state -> case state of
    "active" -> Just Active
    "canceled" -> Just Canceled
    "expired" -> Just Expired
    "failed" -> Just Failed
    "future" -> Just Future
    "paused" -> Just Paused
    _ -> Nothing

instance From State Text where
  from state = case state of
    Active -> "active"
    Canceled -> "canceled"
    Expired -> "expired"
    Failed -> "failed"
    Future -> "future"
    Paused -> "paused"
