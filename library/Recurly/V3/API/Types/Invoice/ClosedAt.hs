module Recurly.V3.API.Types.Invoice.ClosedAt where

import Recurlude

newtype CloseAt = CloseAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime CloseAt

instance From CloseAt UTCTime
