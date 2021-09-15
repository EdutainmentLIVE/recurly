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
  toJSON = toJSON . into @Text

instance FromJSON PaymentMethodObject where
  parseJSON = withText "PaymentMethodObject" $ eitherFail . tryInto @PaymentMethodObject

instance TryFrom Text PaymentMethodObject where
  tryFrom = maybeTryFrom $ \paymentMethodObject -> case paymentMethodObject of
    "credit_card" -> Just CreditCardPaymentMethodObject
    "paypal" -> Just PaypalPaymentMethodObject
    "amazon" -> Just AmazonPaymentMethodObject
    "roku" -> Just RokuPaymentMethodObject
    "bank_account_info" -> Just BankAccountInfoPaymentMethodObject
    "apple_pay" -> Just ApplePayPaymentMethodObject
    "sepadirectdebit" -> Just SepadirectdebitPaymentMethodObject
    "eft" -> Just EftPaymentMethodObject
    "wire_transfer" -> Just WireTransferPaymentMethodObject
    "money_order" -> Just MoneyOrderPaymentMethodObject
    "check" -> Just CheckPaymentMethodObject
    "amazon_billing_agreement" -> Just AmazonBillingAgreementPaymentMethodObject
    "paypal_billing_agreement" -> Just PaypalBillingAgreementPaymentMethodObject
    "gateway_token" -> Just GatewayTokenPaymentMethodObject
    "iban_bank_account" -> Just IbanBankAccountPaymentMethodObject
    "other" -> Just OtherPaymentMethodObject
    _ -> Nothing

instance From PaymentMethodObject Text where
  from paymentMethodObject = case paymentMethodObject of
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
