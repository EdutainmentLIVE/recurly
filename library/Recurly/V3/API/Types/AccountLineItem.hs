module Recurly.V3.API.Types.AccountLineItem where

import Recurlude

import qualified Recurly.V3.API.Types.Account as Types
import qualified Recurly.V3.API.Types.AccountLineItem.CreditReason as Types
import qualified Recurly.V3.API.Types.AccountLineItem.Id as Types
import qualified Recurly.V3.API.Types.AccountLineItem.Type as Types
import qualified Recurly.V3.API.Types.AccountLineItem.UnitAmount as Types
import qualified Recurly.V3.API.Types.Currency as Types

data AccountLineItem = AccountLineItem
  { accountLineItemId :: Types.AccountLineItemId
  , accountLineItemAccount :: Types.Account
  , accountLineItemCurrency :: Types.Currency
  , accountLineItemUnitAmount :: Types.AccountLineItemUnitAmount
  , accountLineItemType :: Types.AccountLineItemType
  , accountLineItemCreditReason :: Types.AccountLineItemCreditReason
  }
  deriving (Eq, Show)

instance FromJSON AccountLineItem where
  parseJSON = withObject "AccountLineItem" $ \obj -> do
    id_ <- aesonRequired obj "id"
    account <- aesonRequired obj "account"
    currency <- aesonRequired obj "currency"
    unitAmount <- aesonRequired obj "unit_amount"
    type_ <- aesonRequired obj "type"
    creditReason <- aesonRequired obj "credit_reason_code"
    pure AccountLineItem
      { accountLineItemId = id_
      , accountLineItemAccount = account
      , accountLineItemCurrency = currency
      , accountLineItemUnitAmount = unitAmount
      , accountLineItemType = type_
      , accountLineItemCreditReason = creditReason
      }
