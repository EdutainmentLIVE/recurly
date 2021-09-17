module Recurly.V3.API.Types.TaxInfo.Type where

import Recurlude

newtype Type = Type Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Type

instance From Type Text
