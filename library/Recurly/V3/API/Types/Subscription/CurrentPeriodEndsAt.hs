module Recurly.V3.API.Types.Subscription.CurrentPeriodEndsAt where

import Recurlude

newtype CurrentPeriodEndsAt = CurrentPeriodEndsAt UTCTime
    deriving (Eq, Ord, Show, FromJSON)

instance From UTCTime CurrentPeriodEndsAt

instance From CurrentPeriodEndsAt UTCTime
