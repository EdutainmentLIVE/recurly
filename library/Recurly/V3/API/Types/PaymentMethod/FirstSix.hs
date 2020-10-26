module Recurly.V3.API.Types.PaymentMethod.FirstSix where

newtype PaymentMethodFirstSix =
    PaymentMethodFirstSix Text
    deriving (Eq, Show, FromJSON)

paymentmethodFirstSixToText :: PaymentMethodFirstSix -> Text
paymentmethodFirstSixToText (PaymentMethodFirstSix text) = text

textToPaymentMethodFirstSix :: Text -> PaymentMethodFirstSix
textToPaymentMethodFirstSix = PaymentMethodFirstSix
