module Recurly.V3.API.Types.PaymentMethod.ExpYear where

import Recurlude

newtype PaymentMethodExpYear =
    PaymentMethodExpYear Integer
    deriving (Eq, Show, FromJSON)

instance From Integer PaymentMethodExpYear

instance From PaymentMethodExpYear Integer
