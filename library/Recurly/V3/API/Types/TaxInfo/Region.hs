module Recurly.V3.API.Types.TaxInfo.Region where

import Recurlude

newtype TaxInfoRegion =
    TaxInfoRegion Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text TaxInfoRegion

instance From TaxInfoRegion Text
