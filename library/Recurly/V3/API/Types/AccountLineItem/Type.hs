module Recurly.V3.API.Types.AccountLineItem.Type where

import Recurlude

data AccountLineItemType = Charge | Credit
  deriving (Eq, Show)

instance ToJSON AccountLineItemType where
  toJSON = toJSON . into @Text

instance FromJSON AccountLineItemType where
  parseJSON = withText "AccountLineItemType" $ eitherFail . tryInto @AccountLineItemType

instance TryFrom Text AccountLineItemType where
  tryFrom = maybeTryFrom $ \accountLineItemType -> case accountLineItemType of
    "charge" -> Just Charge
    "credit" -> Just Credit
    _ -> Nothing

instance From AccountLineItemType Text where
  from accountLineItemType = case accountLineItemType of
    Charge -> "charge"
    Credit -> "credit"
