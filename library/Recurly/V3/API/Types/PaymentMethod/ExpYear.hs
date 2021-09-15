module Recurly.V3.API.Types.PaymentMethod.ExpYear where

import Recurlude

newtype ExpYear = ExpYear Integer
    deriving (Eq, Show, FromJSON)

instance From Integer ExpYear

instance From ExpYear Integer
