module Recurly.V3.API.Types.Account.LastName where

import Recurlude

newtype AccountLastName =
    AccountLastName Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text AccountLastName

instance From AccountLastName Text
