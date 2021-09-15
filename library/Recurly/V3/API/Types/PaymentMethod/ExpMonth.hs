module Recurly.V3.API.Types.PaymentMethod.ExpMonth where

import Recurlude

newtype PaymentMethodExpMonth =
    PaymentMethodExpMonth Integer
    deriving (Eq, Show, FromJSON)

instance From Integer PaymentMethodExpMonth

instance From PaymentMethodExpMonth Integer
