module Recurly.V3.API.Types.Account.FirstName where

import Recurlude

newtype FirstName = FirstName Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text FirstName

instance From FirstName Text
