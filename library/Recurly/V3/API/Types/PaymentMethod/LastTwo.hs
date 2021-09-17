module Recurly.V3.API.Types.PaymentMethod.LastTwo where

import Recurlude

newtype LastTwo = LastTwo Text
    deriving (Eq, Show, FromJSON)

instance From Text LastTwo

instance From LastTwo Text
