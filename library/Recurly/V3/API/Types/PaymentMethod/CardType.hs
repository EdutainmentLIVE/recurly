module Recurly.V3.API.Types.PaymentMethod.CardType where

import Recurlude

data PaymentMethodCardType
  = AmericanExpressCardType
  | DankortCardType
  | DinersClubCardType
  | DiscoverCardType
  | ForbrugsforeningenCardType
  | JCBCardType
  | LaserCardType
  | MaestroCardType
  | MasterCardCardType
  | TestCardCardType
  | UnknownCardType
  | VisaCardType
  deriving (Eq, Show)

instance ToJSON PaymentMethodCardType where
  toJSON = toJSON . paymentmethodCardTypeToText

instance FromJSON PaymentMethodCardType where
  parseJSON = withText "PaymentMethodCardType" $ eitherFail . textToPaymentMethodCardType

paymentmethodCardTypeToText :: PaymentMethodCardType -> Text
paymentmethodCardTypeToText paymentmethodCardType = case paymentmethodCardType of
  AmericanExpressCardType -> "American Express"
  DankortCardType -> "Dankort"
  DinersClubCardType -> "Diners Club"
  DiscoverCardType -> "Discover"
  ForbrugsforeningenCardType -> "Forbrugsforeningen"
  JCBCardType -> "JCB"
  LaserCardType -> "Laser"
  MaestroCardType -> "Maestro"
  MasterCardCardType -> "MasterCard"
  TestCardCardType -> "Test Card"
  UnknownCardType -> "Unknown"
  VisaCardType -> "Visa"

textToPaymentMethodCardType :: Text -> Either String PaymentMethodCardType
textToPaymentMethodCardType paymentmethodCardType = case paymentmethodCardType of
  "American Express" -> Right AmericanExpressCardType
  "Dankort" -> Right DankortCardType
  "Diners Club" -> Right DinersClubCardType
  "Discover" -> Right DiscoverCardType
  "Forbrugsforeningen" -> Right ForbrugsforeningenCardType
  "JCB" -> Right JCBCardType
  "Laser" -> Right LaserCardType
  "Maestro" -> Right MaestroCardType
  "MasterCard" -> Right MasterCardCardType
  "Test Card" -> Right TestCardCardType
  "Unknown" -> Right UnknownCardType
  "Visa" -> Right VisaCardType
  _ -> Left $ "Failed to parse PaymentMethodCardType from text: " <> show paymentmethodCardType
