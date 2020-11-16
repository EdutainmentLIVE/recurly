module Recurly.V3.API.Types.Account.Id where

import Recurlude

newtype AccountId =
    AccountId Text
    deriving (Eq, Show, FromJSON, ToJSON)

accountIdToRecurlyText :: AccountId -> Text
accountIdToRecurlyText (AccountId text) = text

textToAccountId :: Text -> AccountId
textToAccountId = AccountId
