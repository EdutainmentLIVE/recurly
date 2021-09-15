module Recurly.V3.API.Types.Transaction.Success where

import Recurlude

newtype Success = Success Bool
    deriving (Eq, Show, FromJSON)

instance From Bool Success

instance From Success Bool
