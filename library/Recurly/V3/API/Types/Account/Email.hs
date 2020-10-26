module Recurly.V3.API.Types.Account.Email where

newtype AccountEmail =
    AccountEmail Text
    deriving (Eq, Show, FromJSON, ToJSON)

accountEmailToText :: AccountEmail -> Text
accountEmailToText (AccountEmail text) = text

textToAccountEmail :: Text -> AccountEmail
textToAccountEmail = AccountEmail
