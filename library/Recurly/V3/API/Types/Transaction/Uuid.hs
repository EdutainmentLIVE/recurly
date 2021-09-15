module Recurly.V3.API.Types.Transaction.Uuid where

import Recurlude

newtype Uuid = Uuid Text
    deriving (Eq, Show, FromJSON)

instance From Text Uuid

instance From Uuid Text
