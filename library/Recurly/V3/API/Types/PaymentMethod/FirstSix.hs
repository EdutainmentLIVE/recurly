module Recurly.V3.API.Types.PaymentMethod.FirstSix where

import Recurlude

newtype FirstSix = FirstSix Text
    deriving (Eq, Show, FromJSON)

instance From Text FirstSix

instance From FirstSix Text
