module Recurly.V3.API.Types.PaymentMethod.AccountType where

import Recurlude

data PaymentMethodAccountType
  = CheckingPaymentMethodAccountType
  | SavingsPaymentMethodAccountType
  deriving (Eq, Show)

instance ToJSON PaymentMethodAccountType where
  toJSON = toJSON . into @Text

instance FromJSON PaymentMethodAccountType where
  parseJSON = withText "PaymentMethodAccountType" $ eitherFail . tryInto @PaymentMethodAccountType

instance TryFrom Text PaymentMethodAccountType where
  tryFrom = maybeTryFrom $ \paymentMethodAccountType -> case paymentMethodAccountType of
    "checking" -> Just CheckingPaymentMethodAccountType
    "savings" -> Just SavingsPaymentMethodAccountType
    _ -> Nothing

instance From PaymentMethodAccountType Text where
  from paymentMethodAccountType = case paymentMethodAccountType of
    CheckingPaymentMethodAccountType -> "checking"
    SavingsPaymentMethodAccountType -> "savings"
