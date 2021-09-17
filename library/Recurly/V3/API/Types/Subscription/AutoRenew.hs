module Recurly.V3.API.Types.Subscription.AutoRenew where

import Recurlude

newtype AutoRenew = AutoRenew Bool
    deriving (Eq, Show, FromJSON)

instance From Bool AutoRenew

instance From AutoRenew Bool
