module Recurly.V3.API.Types.Subscription.PausedAt where

import Recurlude

newtype PausedAt = PausedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime PausedAt

instance From PausedAt UTCTime
