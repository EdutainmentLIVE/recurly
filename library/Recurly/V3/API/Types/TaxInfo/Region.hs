module Recurly.V3.API.Types.TaxInfo.Region where

import Recurlude

newtype TaxInfoRegion =
    TaxInfoRegion Text
    deriving (Eq, Show, FromJSON, ToJSON)

taxInfoRegionToText :: TaxInfoRegion -> Text
taxInfoRegionToText (TaxInfoRegion text) = text

textToTaxInfoRegion :: Text -> TaxInfoRegion
textToTaxInfoRegion = TaxInfoRegion
