module Recurly.V3.API.Types.PaymentMethod.Object where

import Recurlude

data Object
  = CreditCard
  | Paypal
  | Amazon
  | Roku
  | BankAccountInfo
  | ApplePay
  | Sepadirectdebit
  | Eft
  | WireTransfer
  | MoneyOrder
  | Check
  | AmazonBillingAgreement
  | PaypalBillingAgreement
  | GatewayToken
  | IbanBankAccount
  | Other
  deriving (Eq, Show)

instance ToJSON Object where
  toJSON = toJSON . into @Text

instance FromJSON Object where
  parseJSON = withText "PaymentMethodObject" $ eitherFail . tryInto @Object

instance TryFrom Text Object where
  tryFrom = maybeTryFrom $ \object -> case object of
    "credit_card" -> Just CreditCard
    "paypal" -> Just Paypal
    "amazon" -> Just Amazon
    "roku" -> Just Roku
    "bank_account_info" -> Just BankAccountInfo
    "apple_pay" -> Just ApplePay
    "sepadirectdebit" -> Just Sepadirectdebit
    "eft" -> Just Eft
    "wire_transfer" -> Just WireTransfer
    "money_order" -> Just MoneyOrder
    "check" -> Just Check
    "amazon_billing_agreement" -> Just AmazonBillingAgreement
    "paypal_billing_agreement" -> Just PaypalBillingAgreement
    "gateway_token" -> Just GatewayToken
    "iban_bank_account" -> Just IbanBankAccount
    "other" -> Just Other
    _ -> Nothing

instance From Object Text where
  from object = case object of
    CreditCard -> "credit_card"
    Paypal -> "paypal"
    Amazon -> "amazon"
    Roku -> "roku"
    BankAccountInfo -> "bank_account_info"
    ApplePay -> "apple_pay"
    Sepadirectdebit -> "sepadirectdebit"
    Eft -> "eft"
    WireTransfer -> "wire_transfer"
    MoneyOrder -> "money_order"
    Check -> "check"
    AmazonBillingAgreement -> "amazon_billing_agreement"
    PaypalBillingAgreement -> "paypal_billing_agreement"
    GatewayToken -> "gateway_token"
    IbanBankAccount -> "iban_bank_account"
    Other -> "other"
