module Recurly.V3.API.Types.AccountLineItem.CreditReason where

import Recurlude

data AccountLineItemCreditReason = General | Service | Promotional
  deriving (Eq, Show)

instance ToJSON AccountLineItemCreditReason where
  toJSON = toJSON . accountLineItemCreditReasonToText

instance FromJSON AccountLineItemCreditReason where
  parseJSON =
    withText "AccountLineItemCreditReason" $ eitherFail . textToAccountLineItemCreditReason

accountLineItemCreditReasonToText :: AccountLineItemCreditReason -> Text
accountLineItemCreditReasonToText accountlineitemcreditreason = case accountlineitemcreditreason of
  General -> "general"
  Service -> "service"
  Promotional -> "promotional"

textToAccountLineItemCreditReason :: Text -> Either String AccountLineItemCreditReason
textToAccountLineItemCreditReason accountLineItemType = case accountLineItemType of
  "general" -> Right General
  "service" -> Right Service
  "promotional" -> Right Promotional
  _ -> Left $ "Failed to parse AccountLineItemCreditReason from text: " <> show accountLineItemType
