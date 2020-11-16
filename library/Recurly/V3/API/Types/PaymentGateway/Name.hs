module Recurly.V3.API.Types.PaymentGateway.Name where

import Recurlude

newtype PaymentGatewayName =
    PaymentGatewayName Text
    deriving (Eq, Show, FromJSON, ToJSON)

paymentGatewayNameToText :: PaymentGatewayName -> Text
paymentGatewayNameToText (PaymentGatewayName text) = text

textToPaymentGatewayName :: Text -> PaymentGatewayName
textToPaymentGatewayName = PaymentGatewayName
