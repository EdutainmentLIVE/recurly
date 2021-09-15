module Recurly.V3.API.Types.PaymentMethod.LastFour where

import Recurlude

newtype PaymentMethodLastFour =
    PaymentMethodLastFour Text
    deriving (Eq, Show, FromJSON)

instance From Text PaymentMethodLastFour

instance From PaymentMethodLastFour Text
