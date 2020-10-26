module Recurly.V3.API.Types.PaymentMethod.RoutingNumber where

newtype PaymentMethodRoutingNumber =
    PaymentMethodRoutingNumber Text
    deriving (Eq, Show, FromJSON)

paymentmethodRoutingNumberToText :: PaymentMethodRoutingNumber -> Text
paymentmethodRoutingNumberToText (PaymentMethodRoutingNumber text) = text

textToPaymentMethodRoutingNumber :: Text -> PaymentMethodRoutingNumber
textToPaymentMethodRoutingNumber = PaymentMethodRoutingNumber
