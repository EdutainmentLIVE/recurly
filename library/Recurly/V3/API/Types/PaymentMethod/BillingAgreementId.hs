module Recurly.V3.API.Types.PaymentMethod.BillingAgreementId where

import Recurlude

newtype BillingAgreementId = BillingAgreementId Text
    deriving (Eq, Show, FromJSON)

instance From Text BillingAgreementId

instance From BillingAgreementId Text
