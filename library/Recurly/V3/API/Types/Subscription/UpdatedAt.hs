module Recurly.V3.API.Types.Subscription.UpdatedAt where

import Recurlude

newtype UpdatedAt = UpdatedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime UpdatedAt

instance From UpdatedAt UTCTime
