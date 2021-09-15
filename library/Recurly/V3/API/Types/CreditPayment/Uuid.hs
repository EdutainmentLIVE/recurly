module Recurly.V3.API.Types.CreditPayment.Uuid where

import Recurlude

newtype CreditPaymentUuid =
    CreditPaymentUuid Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text CreditPaymentUuid

instance From CreditPaymentUuid Text
