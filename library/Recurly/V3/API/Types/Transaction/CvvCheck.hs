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
  toJSON = toJSON . into @Text

instance FromJSON TransactionCvvCheck where
  parseJSON = withText "TransactionCvvCheck" $ eitherFail . tryInto @TransactionCvvCheck

instance TryFrom Text TransactionCvvCheck where
  tryFrom = maybeTryFrom $ \transactionCvvCheck -> case transactionCvvCheck of
    "D" -> Just DTransactionCvvCheck
    "I" -> Just ITransactionCvvCheck
    "M" -> Just MTransactionCvvCheck
    "N" -> Just NTransactionCvvCheck
    "P" -> Just PTransactionCvvCheck
    "S" -> Just STransactionCvvCheck
    "U" -> Just UTransactionCvvCheck
    "X" -> Just XTransactionCvvCheck
    _ -> Nothing

instance From TransactionCvvCheck Text where
  from transactionCvvCheck = case transactionCvvCheck of
    DTransactionCvvCheck -> "D"
    ITransactionCvvCheck -> "I"
    MTransactionCvvCheck -> "M"
    NTransactionCvvCheck -> "N"
    PTransactionCvvCheck -> "P"
    STransactionCvvCheck -> "S"
    UTransactionCvvCheck -> "U"
    XTransactionCvvCheck -> "X"
