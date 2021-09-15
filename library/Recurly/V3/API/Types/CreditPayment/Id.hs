module Recurly.V3.API.Types.CreditPayment.Id where

import Recurlude

newtype CreditPaymentId =
    CreditPaymentId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text CreditPaymentId

instance From CreditPaymentId Text
