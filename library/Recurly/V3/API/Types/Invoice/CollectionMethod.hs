module Recurly.V3.API.Types.Invoice.CollectionMethod where

import Recurlude

data CollectionMethod
  = Automatic
  | Manual
  deriving (Eq, Show)

instance ToJSON CollectionMethod where
  toJSON = toJSON . into @Text

instance FromJSON CollectionMethod where
  parseJSON = withText "InvoiceCollectionMethod" $ eitherFail . tryInto @CollectionMethod

instance TryFrom Text CollectionMethod where
  tryFrom = maybeTryFrom $ \collectionMethod -> case collectionMethod of
    "automatic" -> Just Automatic
    "manual" -> Just Manual
    _ -> Nothing

instance From CollectionMethod Text where
  from collectionMethod = case collectionMethod of
    Automatic -> "automatic"
    Manual -> "manual"
