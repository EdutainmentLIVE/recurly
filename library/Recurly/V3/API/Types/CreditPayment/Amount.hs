module Recurly.V3.API.Types.CreditPayment.Amount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype CreditPaymentAmount =
    CreditPaymentAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD CreditPaymentAmount

instance From CreditPaymentAmount Money.DenseUSD
