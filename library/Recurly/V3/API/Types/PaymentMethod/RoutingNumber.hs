module Recurly.V3.API.Types.PaymentMethod.RoutingNumber where

import Recurlude

newtype RoutingNumber = RoutingNumber Text
    deriving (Eq, Show, FromJSON)

instance From Text RoutingNumber

instance From RoutingNumber Text
