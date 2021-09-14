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
  toJSON = toJSON . into @Text

instance FromJSON TransactionType where
  parseJSON = withText "TransactionType" $ eitherFail . tryInto @TransactionType

instance TryFrom Text TransactionType where
  tryFrom = maybeTryFrom $ \transactionType -> case transactionType of
    "authorization" -> Just AuthorizationTransactionType
    "capture" -> Just CaptureTransactionType
    "purchase" -> Just PurchaseTransactionType
    "refund" -> Just RefundTransactionType
    "verify" -> Just VerifyTransactionType
    _ -> Nothing

instance From TransactionType Text where
  from transactionType = case transactionType of
    AuthorizationTransactionType -> "authorization"
    CaptureTransactionType -> "capture"
    PurchaseTransactionType -> "purchase"
    RefundTransactionType -> "refund"
    VerifyTransactionType -> "verify"
