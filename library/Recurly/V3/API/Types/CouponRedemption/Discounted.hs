module Recurly.V3.API.Types.CouponRedemption.Discounted where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Discounted = Discounted Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Money.DenseUSD Discounted

instance From Discounted Money.DenseUSD
