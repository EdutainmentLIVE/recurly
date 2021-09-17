module Recurly.V3.API.Types.PaymentMethod.ExpMonth where

import Recurlude

newtype ExpMonth = ExpMonth Integer
    deriving (Eq, Show, FromJSON)

instance From Integer ExpMonth

instance From ExpMonth Integer
