module Recurly.V3.API.Types.PaymentMethod.GatewayCode where

import Recurlude

newtype PaymentMethodGatewayCode =
    PaymentMethodGatewayCode Text
    deriving (Eq, Show, FromJSON)

paymentmethodGatewayCodeToText :: PaymentMethodGatewayCode -> Text
paymentmethodGatewayCodeToText (PaymentMethodGatewayCode text) = text

textToPaymentMethodGatewayCode :: Text -> PaymentMethodGatewayCode
textToPaymentMethodGatewayCode = PaymentMethodGatewayCode
