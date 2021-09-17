module Recurly.V3.API.Types.Invoice.Number where

import Recurlude

newtype Number = Number Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Number

instance From Number Text
