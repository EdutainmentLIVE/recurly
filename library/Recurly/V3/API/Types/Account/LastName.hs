module Recurly.V3.API.Types.Account.LastName where

import Recurlude

newtype AccountLastName =
    AccountLastName Text
    deriving (Eq, Show, FromJSON, ToJSON)

accountLastNameToText :: AccountLastName -> Text
accountLastNameToText (AccountLastName text) = text

textToAccountLastName :: Text -> AccountLastName
textToAccountLastName = AccountLastName
