module Recurly.V3.API.Types.CreditPayment.Action where

import Recurlude

data Action
  = Payment
  | Refund
  | Reduction
  | WriteOff
  deriving (Eq, Show)

instance ToJSON Action where
  toJSON = toJSON . into @Text

instance FromJSON Action where
  parseJSON = withText "CreditPayment.Action" $ eitherFail . tryInto @Action

instance TryFrom Text Action where
  tryFrom = maybeTryFrom $ \creditPaymentAction -> case creditPaymentAction of
    "payment" -> Just Payment
    "refund" -> Just Refund
    "reduction" -> Just Reduction
    "write_off" -> Just WriteOff
    _ -> Nothing

instance From Action Text where
  from creditPaymentAction = case creditPaymentAction of
    Payment -> "payment"
    Refund -> "refund"
    Reduction -> "reduction"
    WriteOff -> "write_off"
