module Recurly.V3.API.Types.PaymentMethod.RoutingNumberBank where

newtype PaymentMethodRoutingNumberBank =
    PaymentMethodRoutingNumberBank Text
    deriving (Eq, Show, FromJSON)

paymentmethodRoutingNumberBankToText :: PaymentMethodRoutingNumberBank -> Text
paymentmethodRoutingNumberBankToText (PaymentMethodRoutingNumberBank text) = text

textToPaymentMethodRoutingNumberBank :: Text -> PaymentMethodRoutingNumberBank
textToPaymentMethodRoutingNumberBank = PaymentMethodRoutingNumberBank
