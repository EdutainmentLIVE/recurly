module Recurly.V3.API.Types.PaymentMethod.Object where

import Recurlude

data PaymentMethodObject
  = CreditCardPaymentMethodObject
  | PaypalPaymentMethodObject
  | AmazonPaymentMethodObject
  | RokuPaymentMethodObject
  | BankAccountInfoPaymentMethodObject
  | ApplePayPaymentMethodObject
  | SepadirectdebitPaymentMethodObject
  | EftPaymentMethodObject
  | WireTransferPaymentMethodObject
  | MoneyOrderPaymentMethodObject
  | CheckPaymentMethodObject
  | AmazonBillingAgreementPaymentMethodObject
  | PaypalBillingAgreementPaymentMethodObject
  | GatewayTokenPaymentMethodObject
  | IbanBankAccountPaymentMethodObject
  | OtherPaymentMethodObject
  deriving (Eq, Show)

instance ToJSON PaymentMethodObject where
  toJSON = toJSON . paymentmethodObjectToText

instance FromJSON PaymentMethodObject where
  parseJSON = withText "PaymentMethodObject" $ eitherFail . textToPaymentMethodObject

paymentmethodObjectToText :: PaymentMethodObject -> Text
paymentmethodObjectToText paymentmethodObject = case paymentmethodObject of
  CreditCardPaymentMethodObject -> "credit_card"
  PaypalPaymentMethodObject -> "paypal"
  AmazonPaymentMethodObject -> "amazon"
  RokuPaymentMethodObject -> "roku"
  BankAccountInfoPaymentMethodObject -> "bank_account_info"
  ApplePayPaymentMethodObject -> "apple_pay"
  SepadirectdebitPaymentMethodObject -> "sepadirectdebit"
  EftPaymentMethodObject -> "eft"
  WireTransferPaymentMethodObject -> "wire_transfer"
  MoneyOrderPaymentMethodObject -> "money_order"
  CheckPaymentMethodObject -> "check"
  AmazonBillingAgreementPaymentMethodObject -> "amazon_billing_agreement"
  PaypalBillingAgreementPaymentMethodObject -> "paypal_billing_agreement"
  GatewayTokenPaymentMethodObject -> "gateway_token"
  IbanBankAccountPaymentMethodObject -> "iban_bank_account"
  OtherPaymentMethodObject -> "other"

textToPaymentMethodObject :: Text -> Either String PaymentMethodObject
textToPaymentMethodObject paymentmethodObject = case paymentmethodObject of
  "credit_card" -> Right CreditCardPaymentMethodObject
  "paypal" -> Right PaypalPaymentMethodObject
  "amazon" -> Right AmazonPaymentMethodObject
  "roku" -> Right RokuPaymentMethodObject
  "bank_account_info" -> Right BankAccountInfoPaymentMethodObject
  "apple_pay" -> Right ApplePayPaymentMethodObject
  "sepadirectdebit" -> Right SepadirectdebitPaymentMethodObject
  "eft" -> Right EftPaymentMethodObject
  "wire_transfer" -> Right WireTransferPaymentMethodObject
  "money_order" -> Right MoneyOrderPaymentMethodObject
  "check" -> Right CheckPaymentMethodObject
  "amazon_billing_agreement" -> Right AmazonBillingAgreementPaymentMethodObject
  "paypal_billing_agreement" -> Right PaypalBillingAgreementPaymentMethodObject
  "gateway_token" -> Right GatewayTokenPaymentMethodObject
  "iban_bank_account" -> Right IbanBankAccountPaymentMethodObject
  "other" -> Right OtherPaymentMethodObject
  _ -> Left $ "Failed to parse PaymentMethodObject from text: " <> show paymentmethodObject
