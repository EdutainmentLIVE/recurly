module Recurly.V3.API.Types.Transaction.CollectionMethod where

import Recurlude

data TransactionCollectionMethod
  = AutomaticTransactionCollectionMethod
  | ManualTransactionCollectionMethod
  deriving (Eq, Show)

instance ToJSON TransactionCollectionMethod where
  toJSON = toJSON . into @Text

instance FromJSON TransactionCollectionMethod where
  parseJSON =
    withText "TransactionCollectionMethod" $ eitherFail . tryInto @TransactionCollectionMethod

instance TryFrom Text TransactionCollectionMethod where
  tryFrom = maybeTryFrom $ \transactionCollectionMethod -> case transactionCollectionMethod of
    "automatic" -> Just AutomaticTransactionCollectionMethod
    "manual" -> Just ManualTransactionCollectionMethod
    _ -> Nothing

instance From TransactionCollectionMethod Text where
  from transactionCollectionMethod = case transactionCollectionMethod of
    AutomaticTransactionCollectionMethod -> "automatic"
    ManualTransactionCollectionMethod -> "manual"
