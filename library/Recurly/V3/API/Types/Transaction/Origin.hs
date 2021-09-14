module Recurly.V3.API.Types.Transaction.Origin where

import Recurlude

data TransactionOrigin
  = ApiTransactionOrigin
  | HppTransactionOrigin
  | MerchantTransactionOrigin
  | RecurlyAdminTransactionOrigin
  | RecurlyjsTransactionOrigin
  | RecurringTransactionOrigin
  | TransparentTransactionOrigin
  | ForceCollectTransactionOrigin
  | RefundedExternallyTransactionOrigin
  | ChargebackTransactionOrigin
  deriving (Eq, Show)

instance ToJSON TransactionOrigin where
  toJSON = toJSON . into @Text

instance FromJSON TransactionOrigin where
  parseJSON = withText "TransactionOrigin" $ eitherFail . tryInto @TransactionOrigin

instance TryFrom Text TransactionOrigin where
  tryFrom = maybeTryFrom $ \transactionOrigin -> case transactionOrigin of
    "api" -> Just ApiTransactionOrigin
    "hpp" -> Just HppTransactionOrigin
    "merchant" -> Just MerchantTransactionOrigin
    "recurly_admin" -> Just RecurlyAdminTransactionOrigin
    "recurlyjs" -> Just RecurlyjsTransactionOrigin
    "recurring" -> Just RecurringTransactionOrigin
    "transparent" -> Just TransparentTransactionOrigin
    "force_collect" -> Just ForceCollectTransactionOrigin
    "refunded_externally" -> Just RefundedExternallyTransactionOrigin
    "chargeback" -> Just ChargebackTransactionOrigin
    _ -> Nothing

instance From TransactionOrigin Text where
  from transactionOrigin = case transactionOrigin of
    ApiTransactionOrigin -> "api"
    HppTransactionOrigin -> "hpp"
    MerchantTransactionOrigin -> "merchant"
    RecurlyAdminTransactionOrigin -> "recurly_admin"
    RecurlyjsTransactionOrigin -> "recurlyjs"
    RecurringTransactionOrigin -> "recurring"
    TransparentTransactionOrigin -> "transparent"
    ForceCollectTransactionOrigin -> "force_collect"
    RefundedExternallyTransactionOrigin -> "refunded_externally"
    ChargebackTransactionOrigin -> "chargeback"
