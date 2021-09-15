module Recurly.V3.API.Types.Subscription.Quantity where

import Recurlude

newtype Quantity = Quantity Integer
    deriving (Eq, Show, FromJSON)

instance From Integer Quantity

instance From Quantity Integer
