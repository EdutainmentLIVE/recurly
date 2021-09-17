module Recurly.V3.API.Types.Transaction.StatusCode where

import Recurlude

newtype StatusCode = StatusCode Text
    deriving (Eq, Show, FromJSON)

instance From Text StatusCode

instance From StatusCode Text
