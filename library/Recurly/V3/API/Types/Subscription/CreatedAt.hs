module Recurly.V3.API.Types.Subscription.CreatedAt where

import Recurlude

newtype CreatedAt = CreatedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime CreatedAt

instance From CreatedAt UTCTime
