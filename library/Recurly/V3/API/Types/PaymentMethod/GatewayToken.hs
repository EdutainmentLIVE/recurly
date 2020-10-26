module Recurly.V3.API.Types.PaymentMethod.GatewayToken where

newtype PaymentMethodGatewayToken =
    PaymentMethodGatewayToken Text
    deriving (Eq, Show, FromJSON)

paymentmethodGatewayTokenToText :: PaymentMethodGatewayToken -> Text
paymentmethodGatewayTokenToText (PaymentMethodGatewayToken text) = text

textToPaymentMethodGatewayToken :: Text -> PaymentMethodGatewayToken
textToPaymentMethodGatewayToken = PaymentMethodGatewayToken
