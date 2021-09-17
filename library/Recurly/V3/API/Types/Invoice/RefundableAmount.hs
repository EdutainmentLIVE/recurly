module Recurly.V3.API.Types.Invoice.RefundableAmount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype RefundableAmount = RefundableAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD RefundableAmount

instance From RefundableAmount Money.DenseUSD
