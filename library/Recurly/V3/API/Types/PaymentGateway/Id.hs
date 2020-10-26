module Recurly.V3.API.Types.PaymentGateway.Id where

newtype PaymentGatewayId =
    PaymentGatewayId Text
    deriving (Eq, Show, FromJSON, ToJSON)

paymentGatewayIdToText :: PaymentGatewayId -> Text
paymentGatewayIdToText (PaymentGatewayId text) = text

textToPaymentGatewayId :: Text -> PaymentGatewayId
textToPaymentGatewayId = PaymentGatewayId
