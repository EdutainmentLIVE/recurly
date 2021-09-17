module Recurly.V3.API.Types.Transaction.CustomerMessage where

import Recurlude

newtype CustomerMessage = CustomerMessage Text
    deriving (Eq, Show, FromJSON)

instance From Text CustomerMessage

instance From CustomerMessage Text
