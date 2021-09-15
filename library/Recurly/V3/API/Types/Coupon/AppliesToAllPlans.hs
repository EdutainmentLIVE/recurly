module Recurly.V3.API.Types.Coupon.AppliesToAllPlans where

import Recurlude

newtype AppliesToAllPlans = AppliesToAllPlans Bool
    deriving (Eq, Show, FromJSON)

instance From Bool AppliesToAllPlans

instance From AppliesToAllPlans Bool
