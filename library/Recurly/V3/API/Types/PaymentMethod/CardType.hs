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
  toJSON = toJSON . into @Text

instance FromJSON PaymentMethodCardType where
  parseJSON = withText "PaymentMethodCardType" $ eitherFail . tryInto @PaymentMethodCardType

instance TryFrom Text PaymentMethodCardType where
  tryFrom = maybeTryFrom $ \paymentMethodCardType -> case paymentMethodCardType of
    "American Express" -> Just AmericanExpressCardType
    "Dankort" -> Just DankortCardType
    "Diners Club" -> Just DinersClubCardType
    "Discover" -> Just DiscoverCardType
    "Forbrugsforeningen" -> Just ForbrugsforeningenCardType
    "JCB" -> Just JCBCardType
    "Laser" -> Just LaserCardType
    "Maestro" -> Just MaestroCardType
    "MasterCard" -> Just MasterCardCardType
    "Test Card" -> Just TestCardCardType
    "Unknown" -> Just UnknownCardType
    "Visa" -> Just VisaCardType
    _ -> Nothing

instance From PaymentMethodCardType Text where
  from paymentMethodCardType = case paymentMethodCardType of
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
