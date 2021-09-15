module Recurly.V3.API.Types.Transaction.CollectionMethod where

import Recurlude

data CollectionMethod
  = Automatic
  | Manual
  deriving (Eq, Show)

instance ToJSON CollectionMethod where
  toJSON = toJSON . into @Text

instance FromJSON CollectionMethod where
  parseJSON = withText "TransactionCollectionMethod" $ eitherFail . tryInto @CollectionMethod

instance TryFrom Text CollectionMethod where
  tryFrom = maybeTryFrom $ \transactionCollectionMethod -> case transactionCollectionMethod of
    "automatic" -> Just Automatic
    "manual" -> Just Manual
    _ -> Nothing

instance From CollectionMethod Text where
  from transactionCollectionMethod = case transactionCollectionMethod of
    Automatic -> "automatic"
    Manual -> "manual"
