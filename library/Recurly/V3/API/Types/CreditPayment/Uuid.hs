module Recurly.V3.API.Types.CreditPayment.Uuid where

import Recurlude

newtype CreditPaymentUuid =
    CreditPaymentUuid Text
    deriving (Eq, Show, FromJSON, ToJSON)

creditPaymentUuidToText :: CreditPaymentUuid -> Text
creditPaymentUuidToText (CreditPaymentUuid text) = text

textToCreditPaymentUuid :: Text -> CreditPaymentUuid
textToCreditPaymentUuid = CreditPaymentUuid
