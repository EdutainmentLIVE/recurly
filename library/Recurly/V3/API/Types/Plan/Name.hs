module Recurly.V3.API.Types.Plan.Name where

import Recurlude

newtype Name = Name Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Name

instance From Name Text
