module Recurly.V3.API.Types.Plan.Code where

import Recurlude

newtype Code = Code Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Code

instance From Code Text
