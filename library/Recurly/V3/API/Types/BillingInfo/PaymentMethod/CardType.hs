module Recurly.V3.API.Types.BillingInfo.PaymentMethod.CardType where

import Recurlude

data CardType
  = AmericanExpress
  | Dankort
  | DinersClub
  | Discover
  | Forbrugsforeningen
  | JCB
  | Laser
  | Maestro
  | MasterCard
  | TestCard
  | UnionPay
  | Unknown
  | Visa
  | TarjetaNaranja
  deriving (Eq, Show)

instance ToJSON CardType where
  toJSON = toJSON . into @Text

instance FromJSON CardType where
  parseJSON = withText "PaymentMethod.CardType" $ eitherFail . tryInto @CardType

instance TryFrom Text CardType where
  tryFrom = maybeTryFrom $ \cardType -> case cardType of
    "American Express" -> Just AmericanExpress
    "Dankort" -> Just Dankort
    "Diners Club" -> Just DinersClub
    "Discover" -> Just Discover
    "Forbrugsforeningen" -> Just Forbrugsforeningen
    "JCB" -> Just JCB
    "Laser" -> Just Laser
    "Maestro" -> Just Maestro
    "MasterCard" -> Just MasterCard
    "Test Card" -> Just TestCard
    "Union Pay" -> Just UnionPay
    "Unknown" -> Just Unknown
    "Visa" -> Just Visa
    "Tarjeta Naranja" -> Just TarjetaNaranja
    _ -> Nothing

instance From CardType Text where
  from cardType = case cardType of
    AmericanExpress -> "American Express"
    Dankort -> "Dankort"
    DinersClub -> "Diners Club"
    Discover -> "Discover"
    Forbrugsforeningen -> "Forbrugsforeningen"
    JCB -> "JCB"
    Laser -> "Laser"
    Maestro -> "Maestro"
    MasterCard -> "MasterCard"
    TestCard -> "Test Card"
    UnionPay -> "Union Pay"
    Unknown -> "Unknown"
    Visa -> "Visa"
    TarjetaNaranja -> "Tarjeta Naranja"
