module Recurly.V3.API.Types.Transaction.Origin where

import Recurlude

data Origin
  = Api
  | Hpp
  | Merchant
  | RecurlyAdmin
  | Recurlyjs
  | Recurring
  | Transparent
  | ForceCollect
  | RefundedExternally
  | Chargeback
  deriving (Eq, Show)

instance ToJSON Origin where
  toJSON = toJSON . into @Text

instance FromJSON Origin where
  parseJSON = withText "Transaction.Origin" $ eitherFail . tryInto @Origin

instance TryFrom Text Origin where
  tryFrom = maybeTryFrom $ \transactionOrigin -> case transactionOrigin of
    "api" -> Just Api
    "hpp" -> Just Hpp
    "merchant" -> Just Merchant
    "recurly_admin" -> Just RecurlyAdmin
    "recurlyjs" -> Just Recurlyjs
    "recurring" -> Just Recurring
    "transparent" -> Just Transparent
    "force_collect" -> Just ForceCollect
    "refunded_externally" -> Just RefundedExternally
    "chargeback" -> Just Chargeback
    _ -> Nothing

instance From Origin Text where
  from transactionOrigin = case transactionOrigin of
    Api -> "api"
    Hpp -> "hpp"
    Merchant -> "merchant"
    RecurlyAdmin -> "recurly_admin"
    Recurlyjs -> "recurlyjs"
    Recurring -> "recurring"
    Transparent -> "transparent"
    ForceCollect -> "force_collect"
    RefundedExternally -> "refunded_externally"
    Chargeback -> "chargeback"
