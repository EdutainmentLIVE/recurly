module Recurly.V3.API.Types.Transaction.PaymentMethod where

import Recurlude

import qualified Recurly.V3.API.Types.PaymentMethod.AccountType as Types
import qualified Recurly.V3.API.Types.PaymentMethod.BillingAgreementId as Types
import qualified Recurly.V3.API.Types.PaymentMethod.CardType as Types
import qualified Recurly.V3.API.Types.PaymentMethod.ExpMonth as Types
import qualified Recurly.V3.API.Types.PaymentMethod.ExpYear as Types
import qualified Recurly.V3.API.Types.PaymentMethod.FirstSix as Types
import qualified Recurly.V3.API.Types.PaymentMethod.GatewayCode as Types
import qualified Recurly.V3.API.Types.PaymentMethod.GatewayToken as Types
import qualified Recurly.V3.API.Types.PaymentMethod.LastFour as Types
import qualified Recurly.V3.API.Types.PaymentMethod.LastTwo as Types
import qualified Recurly.V3.API.Types.PaymentMethod.Object as Types
import qualified Recurly.V3.API.Types.PaymentMethod.RoutingNumber as Types
import qualified Recurly.V3.API.Types.PaymentMethod.RoutingNumberBank as Types

data TransactionPaymentMethod = TransactionPaymentMethod
  { transactionPaymentMethodObject :: Types.PaymentMethodObject
  , transactionPaymentMethodCardType :: Types.PaymentMethodCardType
  , transactionPaymentMethodFirstSix :: Types.PaymentMethodFirstSix
  , transactionPaymentMethodLastFour :: Types.PaymentMethodLastFour
  , transactionPaymentMethodLastTwo :: Types.PaymentMethodLastTwo
  , transactionPaymentMethodExpMonth :: Types.PaymentMethodExpMonth
  , transactionPaymentMethodExpYear :: Types.PaymentMethodExpYear
  , transactionPaymentMethodGatewayToken :: Types.PaymentMethodGatewayToken
  , transactionPaymentMethodGatewayCode :: Types.PaymentMethodGatewayCode
  , transactionPaymentMethodBillingAgreementId :: Types.PaymentMethodBillingAgreementId
  , transactionPaymentMethodAccountType :: Types.PaymentMethodAccountType
  , transactionPaymentMethodRoutingNumber :: Types.PaymentMethodRoutingNumber
  , transactionPaymentMethodRoutingNumberBank :: Types.PaymentMethodRoutingNumberBank
  }
  deriving (Eq, Show)

instance FromJSON TransactionPaymentMethod where
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
    pure TransactionPaymentMethod
      { transactionPaymentMethodObject = object
      , transactionPaymentMethodCardType = cardType
      , transactionPaymentMethodFirstSix = firstSix
      , transactionPaymentMethodLastFour = lastFour
      , transactionPaymentMethodLastTwo = lastTwo
      , transactionPaymentMethodExpMonth = expMonth
      , transactionPaymentMethodExpYear = expYear
      , transactionPaymentMethodGatewayToken = gatewayToken
      , transactionPaymentMethodGatewayCode = gatewayCode
      , transactionPaymentMethodBillingAgreementId = billingAgreementId
      , transactionPaymentMethodAccountType = accountType
      , transactionPaymentMethodRoutingNumber = routingNumber
      , transactionPaymentMethodRoutingNumberBank = routingNumberBank
      }
