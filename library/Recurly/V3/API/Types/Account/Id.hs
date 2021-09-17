module Recurly.V3.API.Types.Account.Id where

import Recurlude

newtype Id = Id Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Id

instance From Id Text
