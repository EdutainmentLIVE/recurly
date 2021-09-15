module Recurly.V3.API.Types.Plan.Id where

import Recurlude

newtype Id = Id Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Id

instance From Id Text
