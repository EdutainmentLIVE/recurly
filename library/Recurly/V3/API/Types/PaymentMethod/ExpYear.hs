module Recurly.V3.API.Types.PaymentMethod.ExpYear where

import Recurlude

newtype PaymentMethodExpYear =
    PaymentMethodExpYear Integer
    deriving (Eq, Show, FromJSON)

paymentmethodExpYearToInteger :: PaymentMethodExpYear -> Integer
paymentmethodExpYearToInteger (PaymentMethodExpYear integer) = integer

integerToPaymentMethodExpYear :: Integer -> PaymentMethodExpYear
integerToPaymentMethodExpYear = PaymentMethodExpYear
