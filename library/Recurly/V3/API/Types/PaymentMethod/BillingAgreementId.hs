module Recurly.V3.API.Types.PaymentMethod.BillingAgreementId where

import Recurlude

newtype PaymentMethodBillingAgreementId =
    PaymentMethodBillingAgreementId Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodBillingAgreementId

instance From PaymentMethodBillingAgreementId Text
