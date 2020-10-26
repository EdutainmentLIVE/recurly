module Recurly.V3.API.Types.Currency where

import Recurlude

data Currency = USD
  deriving (Eq, Show)

instance ToJSON Currency where
  toJSON = toJSON . currencyToText

instance FromJSON Currency where
  parseJSON = withText "Currency" $ eitherFail . textToCurrency

currencyToText :: Currency -> Text
currencyToText currency = case currency of
  USD -> "USD"

textToCurrency :: Text -> Either String Currency
textToCurrency currency = case currency of
  "USD" -> Right USD
  _ -> Left $ "Failed to parse Currency from text: " <> show currency
