module Recurly.V3.API.Types.AccountLineItem.CreditReason where

import Recurlude

data CreditReason = General | Service | Promotional
  deriving (Eq, Show)

instance ToJSON CreditReason where
  toJSON = toJSON . into @Text

instance FromJSON CreditReason where
  parseJSON = withText "AccountLineItem.CreditReason" $ eitherFail . tryInto @CreditReason

instance TryFrom Text CreditReason where
  tryFrom = maybeTryFrom $ \creditReason -> case creditReason of
    "general" -> Just General
    "service" -> Just Service
    "promotional" -> Just Promotional
    _ -> Nothing

instance From CreditReason Text where
  from creditReason = case creditReason of
    General -> "general"
    Service -> "service"
    Promotional -> "promotional"
