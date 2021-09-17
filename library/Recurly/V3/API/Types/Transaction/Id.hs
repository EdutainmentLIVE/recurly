module Recurly.V3.API.Types.Transaction.Id where

import Recurlude

newtype Id = Id Text
    deriving (Eq, Show, FromJSON)

instance From Text Id

instance From Id Text
