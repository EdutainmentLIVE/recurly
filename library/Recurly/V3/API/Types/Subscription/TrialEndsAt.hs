module Recurly.V3.API.Types.Subscription.TrialEndsAt where

import Recurlude

newtype TrialEndsAt = TrialEndsAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime TrialEndsAt

instance From TrialEndsAt UTCTime
