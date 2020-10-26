module Recurly.V3.API.Types.AccountLineItem.Type where

import Recurlude

data AccountLineItemType = Charge | Credit
  deriving (Eq, Show)

instance ToJSON AccountLineItemType where
  toJSON = toJSON . accountLineItemTypeToText

instance FromJSON AccountLineItemType where
  parseJSON = withText "AccountLineItemType" $ eitherFail . textToAccountLineItemType

accountLineItemTypeToText :: AccountLineItemType -> Text
accountLineItemTypeToText accountlineitemtype = case accountlineitemtype of
  Charge -> "charge"
  Credit -> "credit"

textToAccountLineItemType :: Text -> Either String AccountLineItemType
textToAccountLineItemType accountLineItemType = case accountLineItemType of
  "charge" -> Right Charge
  "credit" -> Right Credit
  _ -> Left $ "Failed to parse AccountLineItemType from text: " <> show accountLineItemType
