module Recurly.V3.API.Types.CreditPayment.Id where

import Recurlude

newtype CreditPaymentId =
    CreditPaymentId Text
    deriving (Eq, Show, FromJSON, ToJSON)

creditPaymentIdToText :: CreditPaymentId -> Text
creditPaymentIdToText (CreditPaymentId text) = text

textToCreditPaymentId :: Text -> CreditPaymentId
textToCreditPaymentId = CreditPaymentId
