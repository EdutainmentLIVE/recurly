module Recurly.V3.API.Types.Subscription.CanceledAt where

import Recurlude

newtype CanceledAt = CanceledAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime CanceledAt

instance From CanceledAt UTCTime
