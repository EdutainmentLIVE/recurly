module Recurly.V3.API.Types.PaymentMethod.LastFour where

import Recurlude

newtype PaymentMethodLastFour =
    PaymentMethodLastFour Text
    deriving (Eq, Show, FromJSON)

paymentmethodLastFourToText :: PaymentMethodLastFour -> Text
paymentmethodLastFourToText (PaymentMethodLastFour text) = text

textToPaymentMethodLastFour :: Text -> PaymentMethodLastFour
textToPaymentMethodLastFour = PaymentMethodLastFour
