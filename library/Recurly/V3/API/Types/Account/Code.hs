module Recurly.V3.API.Types.Account.Code where

import qualified Data.Csv as Csv

newtype AccountCode =
    AccountCode Text
    deriving (Eq, Ord, Show, FromJSON, ToJSON, Csv.FromField)

accountCodeToRecurlyText :: AccountCode -> Text
accountCodeToRecurlyText (AccountCode text) = "code-" <> text

accountCodeToText :: AccountCode -> Text
accountCodeToText (AccountCode text) = text

textToAccountCode :: Text -> AccountCode
textToAccountCode = AccountCode
