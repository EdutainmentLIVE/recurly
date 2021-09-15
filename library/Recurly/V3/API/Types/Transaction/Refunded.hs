module Recurly.V3.API.Types.Transaction.Refunded where

import Recurlude

newtype Refunded = Refunded Bool
    deriving (Eq, Show, FromJSON)

instance From Bool Refunded

instance From Refunded Bool
