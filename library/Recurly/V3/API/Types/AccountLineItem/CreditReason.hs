module Recurly.V3.API.Types.AccountLineItem.CreditReason where

import Recurlude

data AccountLineItemCreditReason = General | Service | Promotional
  deriving (Eq, Show)

instance ToJSON AccountLineItemCreditReason where
  toJSON = toJSON . into @Text

instance FromJSON AccountLineItemCreditReason where
  parseJSON =
    withText "AccountLineItemCreditReason" $ eitherFail . tryInto @AccountLineItemCreditReason

instance TryFrom Text AccountLineItemCreditReason where
  tryFrom = maybeTryFrom $ \accountLineItemCreditReason -> case accountLineItemCreditReason of
    "general" -> Just General
    "service" -> Just Service
    "promotional" -> Just Promotional
    _ -> Nothing

instance From AccountLineItemCreditReason Text where
  from accountLineItemCreditReason = case accountLineItemCreditReason of
    General -> "general"
    Service -> "service"
    Promotional -> "promotional"
