module Recurly.V3.API.Types.Account.LastName where

import Recurlude

newtype LastName = LastName Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text LastName

instance From LastName Text
