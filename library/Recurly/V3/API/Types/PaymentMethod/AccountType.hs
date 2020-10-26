module Recurly.V3.API.Types.PaymentMethod.AccountType where

import Recurlude

data PaymentMethodAccountType
  = CheckingPaymentMethodAccountType
  | SavingsPaymentMethodAccountType
  deriving (Eq, Show)

instance ToJSON PaymentMethodAccountType where
  toJSON = toJSON . paymentmethodAccountTypeToText

instance FromJSON PaymentMethodAccountType where
  parseJSON =
    withText "PaymentMethodAccountType" $ eitherFail . textToPaymentMethodAccountType

paymentmethodAccountTypeToText :: PaymentMethodAccountType -> Text
paymentmethodAccountTypeToText paymentmethodAccountType = case paymentmethodAccountType of
  CheckingPaymentMethodAccountType -> "checking"
  SavingsPaymentMethodAccountType -> "savings"

textToPaymentMethodAccountType :: Text -> Either String PaymentMethodAccountType
textToPaymentMethodAccountType paymentmethodAccountType = case paymentmethodAccountType of
  "checking" -> Right CheckingPaymentMethodAccountType
  "savings" -> Right SavingsPaymentMethodAccountType
  _ ->
    Left $ "Failed to parse PaymentMethodAccountType from text: " <> show paymentmethodAccountType
