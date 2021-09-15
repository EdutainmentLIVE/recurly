module Recurly.V3.API.Types.Subscription.CurrentTermEndsAt where

import Recurlude

newtype CurrentTermEndsAt = CurrentTermEndsAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime CurrentTermEndsAt

instance From CurrentTermEndsAt UTCTime
