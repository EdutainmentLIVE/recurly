module Recurly.V3.API.Types.TaxInfo.Region where

import Recurlude

newtype Region = Region Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Region

instance From Region Text
