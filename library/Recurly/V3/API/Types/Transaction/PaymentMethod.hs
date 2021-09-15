module Recurly.V3.API.Types.Transaction.PaymentMethod where

import Recurlude

import qualified Recurly.V3.API.Types.PaymentMethod.AccountType as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.BillingAgreementId as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.CardType as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.ExpMonth as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.ExpYear as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.FirstSix as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.GatewayCode as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.GatewayToken as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.LastFour as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.LastTwo as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.Object as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.RoutingNumber as PaymentMethod
import qualified Recurly.V3.API.Types.PaymentMethod.RoutingNumberBank as PaymentMethod

data PaymentMethod = PaymentMethod
  { object :: PaymentMethod.Object
  , cardType :: PaymentMethod.CardType
  , firstSix :: PaymentMethod.FirstSix
  , lastFour :: PaymentMethod.LastFour
  , lastTwo :: PaymentMethod.LastTwo
  , expMonth :: PaymentMethod.ExpMonth
  , expYear :: PaymentMethod.ExpYear
  , gatewayToken :: PaymentMethod.GatewayToken
  , gatewayCode :: PaymentMethod.GatewayCode
  , billingAgreementId :: PaymentMethod.BillingAgreementId
  , accountType :: PaymentMethod.AccountType
  , routingNumber :: PaymentMethod.RoutingNumber
  , routingNumberBank :: PaymentMethod.RoutingNumberBank
  }
  deriving (Eq, Show)

instance FromJSON PaymentMethod where
  parseJSON = withObject "TransactionPaymentMethod" $ \obj -> do
    object <- aesonRequired obj "object"
    cardType <- aesonRequired obj "card_type"
    firstSix <- aesonRequired obj "first_six"
    lastFour <- aesonRequired obj "last_four"
    lastTwo <- aesonRequired obj "last_two"
    expMonth <- aesonRequired obj "exp_month"
    expYear <- aesonRequired obj "exp_year"
    gatewayToken <- aesonRequired obj "gateway_token"
    gatewayCode <- aesonRequired obj "gateway_code"
    billingAgreementId <- aesonRequired obj "billing_agreement_id"
    accountType <- aesonRequired obj "account_type"
    routingNumber <- aesonRequired obj "routing_number"
    routingNumberBank <- aesonRequired obj "routing_number_bank"
    pure PaymentMethod
      { object
      , cardType
      , firstSix
      , lastFour
      , lastTwo
      , expMonth
      , expYear
      , gatewayToken
      , gatewayCode
      , billingAgreementId
      , accountType
      , routingNumber
      , routingNumberBank
      }
