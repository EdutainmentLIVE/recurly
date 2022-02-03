module Recurly.V3.API.Types.BillingInfo.PaymentMethod
  ( module Recurly.V3.API.Types.BillingInfo.PaymentMethod
  , PaymentMethod.CardType
  , PaymentMethod.Object
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.BillingInfo.PaymentMethod.CardType as PaymentMethod
import qualified Recurly.V3.API.Types.BillingInfo.PaymentMethod.Object as PaymentMethod

data PaymentMethod = PaymentMethod
  { object :: PaymentMethod.Object
  , cardType :: Mayb PaymentMethod.CardType
  , lastFour :: Mayb Text
  , month :: Mayb Integer
  , year :: Mayb Integer
  , payPalBillingAgreementId :: Maybe Text
  }
  deriving (Eq, Show)

instance FromJSON PaymentMethod where
  parseJSON = withObject "PaymentMethod" $ \obj -> do
    object <- aesonRequired obj "object"
    cardType <- aesonOptional obj "card_type"
    lastFour <- aesonOptional obj "last_four"
    month <- aesonOptional obj "exp_month"
    year <- aesonOptional obj "exp_year"
    payPalBillingAgreementId <- aesonOptional obj "billing_agreement_id"
    pure PaymentMethod { object, cardType, lastFour, month, year, payPalBillingAgreementId }
