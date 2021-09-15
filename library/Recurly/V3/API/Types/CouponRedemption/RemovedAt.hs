module Recurly.V3.API.Types.CouponRedemption.RemovedAt where

import Recurlude

newtype RemovedAt = RemovedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON, ToJSON)

instance From UTCTime RemovedAt

instance From RemovedAt UTCTime
