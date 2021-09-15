module Recurly.V3.API.Types.Subscription.TrialStartedAt where

import Recurlude

newtype TrialStartedAt = TrialStartedAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime TrialStartedAt

instance From TrialStartedAt UTCTime
