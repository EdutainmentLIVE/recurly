module Recurly.V3.API.Types.PaymentGateway.Type where

newtype PaymentGatewayType =
    PaymentGatewayType Text
    deriving (Eq, Show, FromJSON, ToJSON)

paymentGatewayTypeToText :: PaymentGatewayType -> Text
paymentGatewayTypeToText (PaymentGatewayType text) = text

textToPaymentGatewayType :: Text -> PaymentGatewayType
textToPaymentGatewayType = PaymentGatewayType
