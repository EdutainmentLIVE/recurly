module Recurly.V3.API.Types.Account.FirstName where

newtype AccountFirstName =
    AccountFirstName Text
    deriving (Eq, Show, FromJSON, ToJSON)

accountFirstNameToText :: AccountFirstName -> Text
accountFirstNameToText (AccountFirstName text) = text

textToAccountFirstName :: Text -> AccountFirstName
textToAccountFirstName = AccountFirstName
