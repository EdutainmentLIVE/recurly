module Recurly.V3.API.Types.Coupon.DiscountType.PercentValue where

import Recurlude

-- | This should be a number between 1 and 100 inclusive. Zero is not allowed.
-- Fractional parts of percents are not allowed. This number represents the
-- percent discount to be applied at checkout. For example if you would pay $29
-- but you have a 10% discount (@PercentValue 10@), you would
-- only pay $26.10.
newtype PercentValue = PercentValue Natural
  deriving (Eq, Show, ToJSON)

instance TryFrom Natural PercentValue where
  tryFrom = maybeTryFrom
    $ \percent -> if percent > 0 && percent <= 100 then Just $ PercentValue percent else Nothing

instance From PercentValue Natural

instance From PercentValue Integer where
  from = via @Natural

-- | This is a value between 0 (not inclusive) and 1
toPercentRational :: PercentValue -> Rational
toPercentRational percent = into @Integer percent % 100
