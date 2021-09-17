module Recurly.V3.API.Types.Coupon.DiscountType.FixedValue where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

-- | This should be a decimal number greater than or equal to 0. Note that
-- unlike percent discounts, you can have a fixed discount for $0.00. The
-- Recurly API does not show the decimal places if they would be 0. So a
-- discount of $10 would be sent as @10@, not @10.00@. This number represents
-- the price to be subtracted at checkout. For example if you would pay $29 but
-- you have a $10 discount (@FixedValue 10@), you would only pay
-- $19.
newtype FixedValue = FixedValue Money.DenseUSD
  deriving (Eq, Show, ToJSON)

instance TryFrom Money.DenseUSD FixedValue where
  tryFrom = maybeTryFrom $ \fixed -> if fixed >= 0 then Just $ FixedValue fixed else Nothing

instance From FixedValue Money.DenseUSD
