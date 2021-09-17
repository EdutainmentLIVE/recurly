module Recurly.V3.API.Types.Subscription.ExpiresAt where

import Recurlude

newtype ExpiresAt = ExpiresAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime ExpiresAt

instance From ExpiresAt UTCTime
