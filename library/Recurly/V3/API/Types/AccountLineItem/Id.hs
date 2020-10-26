module Recurly.V3.API.Types.AccountLineItem.Id where

newtype AccountLineItemId =
    AccountLineItemId Text
    deriving (Eq, Show, FromJSON, ToJSON)

accountLineItemIdToText :: AccountLineItemId -> Text
accountLineItemIdToText (AccountLineItemId text) = text

textToAccountLineItemId :: Text -> AccountLineItemId
textToAccountLineItemId = AccountLineItemId
