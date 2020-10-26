module Recurly.V3.API.Types.CreditPayment.Action where

import Recurlude

data CreditPaymentAction
  = PaymentCreditPaymentAction
  | RefundCreditPaymentAction
  | ReductionCreditPaymentAction
  | WriteOffCreditPaymentAction
  deriving (Eq, Show)

instance ToJSON CreditPaymentAction where
  toJSON = toJSON . creditPaymentActionToText

instance FromJSON CreditPaymentAction where
  parseJSON = withText "CreditPaymentAction" $ eitherFail . textToCreditPaymentAction

creditPaymentActionToText :: CreditPaymentAction -> Text
creditPaymentActionToText creditpaymentaction = case creditpaymentaction of
  PaymentCreditPaymentAction -> "payment"
  RefundCreditPaymentAction -> "refund"
  ReductionCreditPaymentAction -> "reduction"
  WriteOffCreditPaymentAction -> "write_off"

textToCreditPaymentAction :: Text -> Either String CreditPaymentAction
textToCreditPaymentAction creditpaymentType = case creditpaymentType of
  "payment" -> Right PaymentCreditPaymentAction
  "refund" -> Right RefundCreditPaymentAction
  "reduction" -> Right ReductionCreditPaymentAction
  "write_off" -> Right WriteOffCreditPaymentAction
  _ -> Left $ "Failed to parse CreditPaymentAction from text: " <> show creditpaymentType
