module Recurly.V3.API.Types.Transaction.Type where

import Recurlude

data TransactionType
  = AuthorizationTransactionType
  | CaptureTransactionType
  | PurchaseTransactionType
  | RefundTransactionType
  | VerifyTransactionType
  deriving (Eq, Show)

instance ToJSON TransactionType where
  toJSON = toJSON . transactionTypeToText

instance FromJSON TransactionType where
  parseJSON = withText "TransactionType" $ eitherFail . textToTransactionType

transactionTypeToText :: TransactionType -> Text
transactionTypeToText transactionType = case transactionType of
  AuthorizationTransactionType -> "authorization"
  CaptureTransactionType -> "capture"
  PurchaseTransactionType -> "purchase"
  RefundTransactionType -> "refund"
  VerifyTransactionType -> "verify"

textToTransactionType :: Text -> Either String TransactionType
textToTransactionType transactionType = case transactionType of
  "authorization" -> Right AuthorizationTransactionType
  "capture" -> Right CaptureTransactionType
  "purchase" -> Right PurchaseTransactionType
  "refund" -> Right RefundTransactionType
  "verify" -> Right VerifyTransactionType
  _ -> Left $ "Failed to parse TransactionType from text: " <> show transactionType
