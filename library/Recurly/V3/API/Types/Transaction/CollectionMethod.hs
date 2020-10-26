module Recurly.V3.API.Types.Transaction.CollectionMethod where

import Recurlude

data TransactionCollectionMethod
  = AutomaticTransactionCollectionMethod
  | ManualTransactionCollectionMethod
  deriving (Eq, Show)

instance ToJSON TransactionCollectionMethod where
  toJSON = toJSON . transactionCollectionMethodToText

instance FromJSON TransactionCollectionMethod where
  parseJSON =
    withText "TransactionCollectionMethod" $ eitherFail . textToTransactionCollectionMethod

transactionCollectionMethodToText :: TransactionCollectionMethod -> Text
transactionCollectionMethodToText transactionCollectionMethod = case transactionCollectionMethod of
  AutomaticTransactionCollectionMethod -> "automatic"
  ManualTransactionCollectionMethod -> "manual"

textToTransactionCollectionMethod :: Text -> Either String TransactionCollectionMethod
textToTransactionCollectionMethod transactionCollectionMethod = case transactionCollectionMethod of
  "automatic" -> Right AutomaticTransactionCollectionMethod
  "manual" -> Right ManualTransactionCollectionMethod
  _ ->
    Left
      $ "Failed to parse TransactionCollectionMethod from text: "
      <> show transactionCollectionMethod
