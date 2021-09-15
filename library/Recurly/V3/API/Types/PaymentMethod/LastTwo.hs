module Recurly.V3.API.Types.PaymentMethod.LastTwo where

import Recurlude

newtype PaymentMethodLastTwo =
    PaymentMethodLastTwo Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodLastTwo

instance From PaymentMethodLastTwo Text
