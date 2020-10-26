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
  toJSON = toJSON . transactionOriginToText

instance FromJSON TransactionOrigin where
  parseJSON = withText "TransactionOrigin" $ eitherFail . textToTransactionOrigin

transactionOriginToText :: TransactionOrigin -> Text
transactionOriginToText transactionOrigin = case transactionOrigin of
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

textToTransactionOrigin :: Text -> Either String TransactionOrigin
textToTransactionOrigin transactionOrigin = case transactionOrigin of
  "api" -> Right ApiTransactionOrigin
  "hpp" -> Right HppTransactionOrigin
  "merchant" -> Right MerchantTransactionOrigin
  "recurly_admin" -> Right RecurlyAdminTransactionOrigin
  "recurlyjs" -> Right RecurlyjsTransactionOrigin
  "recurring" -> Right RecurringTransactionOrigin
  "transparent" -> Right TransparentTransactionOrigin
  "force_collect" -> Right ForceCollectTransactionOrigin
  "refunded_externally" -> Right RefundedExternallyTransactionOrigin
  "chargeback" -> Right ChargebackTransactionOrigin
  _ -> Left $ "Failed to parse TransactionOrigin from text: " <> show transactionOrigin
