module Recurly.V3.API.Types.Subscription.CurrentTermStartedAt where

import Recurlude

newtype CurrentTermStartedAt = CurrentTermStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime CurrentTermStartedAt

instance From CurrentTermStartedAt UTCTime
