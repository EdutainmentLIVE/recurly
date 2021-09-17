module Recurly.V3.API.Types.Subscription.ActivatedAt where

import Recurlude

newtype ActivatedAt = ActivatedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON)

instance From UTCTime ActivatedAt

instance From ActivatedAt UTCTime
