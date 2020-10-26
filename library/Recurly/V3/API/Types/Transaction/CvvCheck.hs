module Recurly.V3.API.Types.Transaction.CvvCheck where

import Recurlude

-- Yes recurly these names are very useful
data TransactionCvvCheck
  = DTransactionCvvCheck
  | ITransactionCvvCheck
  | MTransactionCvvCheck
  | NTransactionCvvCheck
  | PTransactionCvvCheck
  | STransactionCvvCheck
  | UTransactionCvvCheck
  | XTransactionCvvCheck
  deriving (Eq, Show)

instance ToJSON TransactionCvvCheck where
  toJSON = toJSON . transactionCvvCheckToText

instance FromJSON TransactionCvvCheck where
  parseJSON = withText "TransactionCvvCheck" $ eitherFail . textToTransactionCvvCheck

transactionCvvCheckToText :: TransactionCvvCheck -> Text
transactionCvvCheckToText transactionCvvCheck = case transactionCvvCheck of
  DTransactionCvvCheck -> "D"
  ITransactionCvvCheck -> "I"
  MTransactionCvvCheck -> "M"
  NTransactionCvvCheck -> "N"
  PTransactionCvvCheck -> "P"
  STransactionCvvCheck -> "S"
  UTransactionCvvCheck -> "U"
  XTransactionCvvCheck -> "X"

textToTransactionCvvCheck :: Text -> Either String TransactionCvvCheck
textToTransactionCvvCheck transactionCvvCheck = case transactionCvvCheck of
  "D" -> Right DTransactionCvvCheck
  "I" -> Right ITransactionCvvCheck
  "M" -> Right MTransactionCvvCheck
  "N" -> Right NTransactionCvvCheck
  "P" -> Right PTransactionCvvCheck
  "S" -> Right STransactionCvvCheck
  "U" -> Right UTransactionCvvCheck
  "X" -> Right XTransactionCvvCheck
  _ -> Left $ "Failed to parse TransactionCvvCheck from text: " <> show transactionCvvCheck
