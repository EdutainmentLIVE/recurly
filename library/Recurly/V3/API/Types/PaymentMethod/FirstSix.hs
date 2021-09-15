module Recurly.V3.API.Types.PaymentMethod.FirstSix where

import Recurlude

newtype PaymentMethodFirstSix =
    PaymentMethodFirstSix Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodFirstSix

instance From PaymentMethodFirstSix Text
