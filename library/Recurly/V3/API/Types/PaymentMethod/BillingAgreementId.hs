module Recurly.V3.API.Types.PaymentMethod.BillingAgreementId where

newtype PaymentMethodBillingAgreementId =
    PaymentMethodBillingAgreementId Text
    deriving (Eq, Show, FromJSON)

paymentmethodBillingAgreementIdToText :: PaymentMethodBillingAgreementId -> Text
paymentmethodBillingAgreementIdToText (PaymentMethodBillingAgreementId text) = text

textToPaymentMethodBillingAgreementId :: Text -> PaymentMethodBillingAgreementId
textToPaymentMethodBillingAgreementId = PaymentMethodBillingAgreementId
