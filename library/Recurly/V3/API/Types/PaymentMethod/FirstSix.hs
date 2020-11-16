module Recurly.V3.API.Types.PaymentMethod.FirstSix where

import Recurlude

newtype PaymentMethodFirstSix =
    PaymentMethodFirstSix Text
    deriving (Eq, Show, FromJSON)

paymentmethodFirstSixToText :: PaymentMethodFirstSix -> Text
paymentmethodFirstSixToText (PaymentMethodFirstSix text) = text

textToPaymentMethodFirstSix :: Text -> PaymentMethodFirstSix
textToPaymentMethodFirstSix = PaymentMethodFirstSix
