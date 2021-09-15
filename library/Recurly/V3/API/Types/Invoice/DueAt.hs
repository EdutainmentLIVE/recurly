module Recurly.V3.API.Types.Invoice.DueAt where

import Recurlude

newtype DueAt = DueAt UTCTime
    deriving (Eq, Show, FromJSON)

instance From UTCTime DueAt

instance From DueAt UTCTime
