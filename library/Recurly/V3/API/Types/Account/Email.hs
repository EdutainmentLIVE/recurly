module Recurly.V3.API.Types.Account.Email where

import Recurlude

newtype AccountEmail =
    AccountEmail Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text AccountEmail

instance From AccountEmail Text
