module Recurly.V3.API.Types.Account.Email where

import Recurlude

newtype Email = Email Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Email

instance From Email Text
