module Recurly.V3.API.Types.CreditPayment.Action where

import Recurlude

data CreditPaymentAction
  = PaymentCreditPaymentAction
  | RefundCreditPaymentAction
  | ReductionCreditPaymentAction
  | WriteOffCreditPaymentAction
  deriving (Eq, Show)

instance ToJSON CreditPaymentAction where
  toJSON = toJSON . into @Text

instance FromJSON CreditPaymentAction where
  parseJSON = withText "CreditPaymentAction" $ eitherFail . tryInto @CreditPaymentAction

instance TryFrom Text CreditPaymentAction where
  tryFrom = maybeTryFrom $ \creditPaymentAction -> case creditPaymentAction of
    "payment" -> Just PaymentCreditPaymentAction
    "refund" -> Just RefundCreditPaymentAction
    "reduction" -> Just ReductionCreditPaymentAction
    "write_off" -> Just WriteOffCreditPaymentAction
    _ -> Nothing

instance From CreditPaymentAction Text where
  from creditPaymentAction = case creditPaymentAction of
    PaymentCreditPaymentAction -> "payment"
    RefundCreditPaymentAction -> "refund"
    ReductionCreditPaymentAction -> "reduction"
    WriteOffCreditPaymentAction -> "write_off"
