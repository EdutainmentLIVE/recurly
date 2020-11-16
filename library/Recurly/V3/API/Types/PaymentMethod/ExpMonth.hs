module Recurly.V3.API.Types.PaymentMethod.ExpMonth where

import Recurlude

newtype PaymentMethodExpMonth =
    PaymentMethodExpMonth Integer
    deriving (Eq, Show, FromJSON)

paymentmethodExpMonthToInteger :: PaymentMethodExpMonth -> Integer
paymentmethodExpMonthToInteger (PaymentMethodExpMonth integer) = integer

integerToPaymentMethodExpMonth :: Integer -> PaymentMethodExpMonth
integerToPaymentMethodExpMonth = PaymentMethodExpMonth
