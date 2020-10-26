module Recurly.V3.API.Types.PostAccountLineItem where

import Recurlude

import qualified Recurly.V3.API.Types.AccountLineItem.CreditReason as Types
import qualified Recurly.V3.API.Types.AccountLineItem.Type as Types
import qualified Recurly.V3.API.Types.AccountLineItem.UnitAmount as Types
import qualified Recurly.V3.API.Types.Currency as Types

data PostAccountLineItem = PostAccountLineItem
  { postAccountLineItemCurrency :: Types.Currency
  , postAccountLineItemUnitAmount :: Types.AccountLineItemUnitAmount
  , postAccountLineItemType :: Types.AccountLineItemType
  , postAccountLineItemCreditReason :: Types.AccountLineItemCreditReason
  }
  deriving (Eq, Show)

instance ToJSON PostAccountLineItem where
  toJSON = aesonPairHelper
    [ ("currency", toJSON . postAccountLineItemCurrency)
    , ("unit_amount", toJSON . postAccountLineItemUnitAmount)
    , ("type", toJSON . postAccountLineItemType)
    , ("credit_reason_code", toJSON . postAccountLineItemCreditReason)
    ]
