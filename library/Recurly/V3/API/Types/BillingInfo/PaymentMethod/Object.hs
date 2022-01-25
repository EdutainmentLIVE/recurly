module Recurly.V3.API.Types.BillingInfo.PaymentMethod.Object where

import Recurlude

data Object
  = Amazon
  | AmazonBillingAgreement
  | ApplePay
  | BankAccountInfo
  | Check
  | CreditCard
  | Eft
  | GatewayToken
  | IbanBankAccount
  | MoneyOrder
  | Other
  | Paypal
  | PaypalBillingAgreement
  | Roku
  | Sepadirectdebit
  | WireTransfer
  | BraintreeVZero
  deriving (Eq, Show)

instance ToJSON Object where
  toJSON = toJSON . into @Text

instance FromJSON Object where
  parseJSON = withText "PaymentMethod.Object" $ eitherFail . tryInto @Object

instance TryFrom Text Object where
  tryFrom = maybeTryFrom $ \object -> case object of
    "amazon" -> Just Amazon
    "amazon_billing_agreement" -> Just AmazonBillingAgreement
    "apple_pay" -> Just ApplePay
    "bank_account_info" -> Just BankAccountInfo
    "check" -> Just Check
    "credit_card" -> Just CreditCard
    "eft" -> Just Eft
    "gateway_token" -> Just GatewayToken
    "iban_bank_account" -> Just IbanBankAccount
    "money_order" -> Just MoneyOrder
    "other" -> Just Other
    "paypal" -> Just Paypal
    "paypal_billing_agreement" -> Just PaypalBillingAgreement
    "roku" -> Just Roku
    "sepadirectdebit" -> Just Sepadirectdebit
    "wire_transfer" -> Just WireTransfer
    "braintree_v_zero" -> Just BraintreeVZero
    _ -> Nothing

instance From Object Text where
  from object = case object of
    Amazon -> "amazon"
    AmazonBillingAgreement -> "amazon_billing_agreement"
    ApplePay -> "apple_pay"
    BankAccountInfo -> "bank_account_info"
    Check -> "check"
    CreditCard -> "credit_card"
    Eft -> "eft"
    GatewayToken -> "gateway_token"
    IbanBankAccount -> "iban_bank_account"
    MoneyOrder -> "money_order"
    Other -> "other"
    Paypal -> "paypal"
    PaypalBillingAgreement -> "paypal_billing_agreement"
    Roku -> "roku"
    Sepadirectdebit -> "sepadirectdebit"
    WireTransfer -> "wire_transfer"
    BraintreeVZero -> "braintree_v_zero"
