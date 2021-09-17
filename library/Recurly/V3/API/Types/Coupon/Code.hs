module Recurly.V3.API.Types.Coupon.Code where

import Recurlude

newtype Code = Code Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Code

instance From Code Text
