module Recurly.V3.API.Types.Currency where

import Recurlude

data Currency = USD
  deriving (Eq, Show)

instance ToJSON Currency where
  toJSON = toJSON . into @Text

instance FromJSON Currency where
  parseJSON = withText "Currency" $ eitherFail . tryInto @Currency

instance TryFrom Text Currency where
  tryFrom = maybeTryFrom $ \currency -> case currency of
    "USD" -> Just USD
    _ -> Nothing

instance From Currency Text where
  from currency = case currency of
    USD -> "USD"
