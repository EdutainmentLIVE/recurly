module Recurly.V3.API.Types.PaymentMethod.ExpMonth where

newtype PaymentMethodExpMonth =
    PaymentMethodExpMonth Integer
    deriving (Eq, Show, FromJSON)

paymentmethodExpMonthToInteger :: PaymentMethodExpMonth -> Integer
paymentmethodExpMonthToInteger (PaymentMethodExpMonth integer) = integer

integerToPaymentMethodExpMonth :: Integer -> PaymentMethodExpMonth
integerToPaymentMethodExpMonth = PaymentMethodExpMonth
