module Recurly.V3.API.Types.AccountLineItem.Type where

import Recurlude

data Type = Charge | Credit
  deriving (Eq, Show)

instance ToJSON Type where
  toJSON = toJSON . into @Text

instance FromJSON Type where
  parseJSON = withText "AccountLine.ItemType" $ eitherFail . tryInto @Type

instance TryFrom Text Type where
  tryFrom = maybeTryFrom $ \type_ -> case type_ of
    "charge" -> Just Charge
    "credit" -> Just Credit
    _ -> Nothing

instance From Type Text where
  from type_ = case type_ of
    Charge -> "charge"
    Credit -> "credit"
