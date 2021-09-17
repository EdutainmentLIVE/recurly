module Recurly.V3.API.Types.CouponRedemption.CreatedAt where

import Recurlude

newtype CreatedAt = CreatedAt UTCTime
    deriving (Eq, Ord, Show, FromJSON, ToJSON)

instance From UTCTime CreatedAt

instance From CreatedAt UTCTime
