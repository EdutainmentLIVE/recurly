module Recurly.V3.API.Types.Account.Id where

import Recurlude

newtype AccountId =
    AccountId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text AccountId

instance From AccountId Text
