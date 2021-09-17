module Recurly.V3.API.Types.PostAccountLineItem
  ( module Recurly.V3.API.Types.PostAccountLineItem
  , AccountLineItem.CreditReason
  , AccountLineItem.Type
  , AccountLineItem.UnitAmount
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.AccountLineItem.CreditReason as AccountLineItem
import qualified Recurly.V3.API.Types.AccountLineItem.Type as AccountLineItem
import qualified Recurly.V3.API.Types.AccountLineItem.UnitAmount as AccountLineItem
import qualified Recurly.V3.API.Types.Currency as Currency

data PostAccountLineItem = PostAccountLineItem
  { currency :: Currency.Currency
  , unitAmount :: AccountLineItem.UnitAmount
  , type_ :: AccountLineItem.Type
  , creditReason :: AccountLineItem.CreditReason
  }
  deriving (Eq, Show)

instance ToJSON PostAccountLineItem where
  toJSON = aesonPairHelper
    [ ("currency", toJSON . currency)
    , ("unit_amount", toJSON . unitAmount)
    , ("type", toJSON . type_)
    , ("credit_reason_code", toJSON . creditReason)
    ]
