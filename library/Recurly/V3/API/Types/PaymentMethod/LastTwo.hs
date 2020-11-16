module Recurly.V3.API.Types.PaymentMethod.LastTwo where

import Recurlude

newtype PaymentMethodLastTwo =
    PaymentMethodLastTwo Text
    deriving (Eq, Show, FromJSON)

paymentmethodLastTwoToText :: PaymentMethodLastTwo -> Text
paymentmethodLastTwoToText (PaymentMethodLastTwo text) = text

textToPaymentMethodLastTwo :: Text -> PaymentMethodLastTwo
textToPaymentMethodLastTwo = PaymentMethodLastTwo
