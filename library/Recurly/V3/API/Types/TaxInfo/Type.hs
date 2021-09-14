module Recurly.V3.API.Types.TaxInfo.Type where

import Recurlude

newtype TaxInfoType =
    TaxInfoType Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text TaxInfoType

instance From TaxInfoType Text
