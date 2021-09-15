module Recurly.V3.API.Types.Account.FirstName where

import Recurlude

newtype AccountFirstName =
    AccountFirstName Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text AccountFirstName

instance From AccountFirstName Text
