module Recurly.V3.API.Types.Subscription.CurrentPeriodStartedAt where

import Recurlude

newtype CurrentPeriodStartedAt = CurrentPeriodStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime CurrentPeriodStartedAt

instance From CurrentPeriodStartedAt UTCTime
