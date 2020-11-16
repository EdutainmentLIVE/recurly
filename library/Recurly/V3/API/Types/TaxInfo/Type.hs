module Recurly.V3.API.Types.TaxInfo.Type where

import Recurlude

newtype TaxInfoType =
    TaxInfoType Text
    deriving (Eq, Show, FromJSON, ToJSON)

taxInfoTypeToText :: TaxInfoType -> Text
taxInfoTypeToText (TaxInfoType text) = text

textToTaxInfoType :: Text -> TaxInfoType
textToTaxInfoType = TaxInfoType
