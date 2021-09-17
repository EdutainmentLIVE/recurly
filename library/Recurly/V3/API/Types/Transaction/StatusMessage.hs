module Recurly.V3.API.Types.Transaction.StatusMessage where

import Recurlude

newtype StatusMessage = StatusMessage Text
    deriving (Eq, Show, FromJSON)

instance From Text StatusMessage

instance From StatusMessage Text
