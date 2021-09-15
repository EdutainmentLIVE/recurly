module Recurly.V3.API.Types.CreditPayment.Amount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Amount = Amount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD Amount

instance From Amount Money.DenseUSD
