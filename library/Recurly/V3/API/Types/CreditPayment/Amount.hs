module Recurly.V3.API.Types.CreditPayment.Amount where

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype CreditPaymentAmount =
    CreditPaymentAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

creditPaymentAmountToDenseUSD :: CreditPaymentAmount -> Money.DenseUSD
creditPaymentAmountToDenseUSD (CreditPaymentAmount denseUSD) = denseUSD

denseUSDToCreditPaymentAmount :: Money.DenseUSD -> CreditPaymentAmount
denseUSDToCreditPaymentAmount = CreditPaymentAmount
