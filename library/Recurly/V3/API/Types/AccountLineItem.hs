module Recurly.V3.API.Types.AccountLineItem
  ( module Recurly.V3.API.Types.AccountLineItem
  , Account.Account
  , AccountLineItem.CreditReason
  , AccountLineItem.Id
  , AccountLineItem.Type
  , AccountLineItem.UnitAmount
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.Account as Account
import qualified Recurly.V3.API.Types.AccountLineItem.CreditReason as AccountLineItem
import qualified Recurly.V3.API.Types.AccountLineItem.Id as AccountLineItem
import qualified Recurly.V3.API.Types.AccountLineItem.Type as AccountLineItem
import qualified Recurly.V3.API.Types.AccountLineItem.UnitAmount as AccountLineItem
import qualified Recurly.V3.API.Types.Currency as Currency

data AccountLineItem = AccountLineItem
  { id_ :: AccountLineItem.Id
  , account :: Account.Account
  , currency :: Currency.Currency
  , unitAmount :: AccountLineItem.UnitAmount
  , type_ :: AccountLineItem.Type
  , creditReason :: AccountLineItem.CreditReason
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
    pure AccountLineItem { id_, account, currency, unitAmount, type_, creditReason }
