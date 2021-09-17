module Recurly.V3.API.Types.Invoice.TaxInfo where

import Recurlude

import qualified Recurly.V3.API.Types.TaxInfo.Rate as TaxInfo
import qualified Recurly.V3.API.Types.TaxInfo.Region as TaxInfo
import qualified Recurly.V3.API.Types.TaxInfo.Type as TaxInfo

data TaxInfo = TaxInfo
  { type_ :: TaxInfo.Type
  , region :: TaxInfo.Region
  , rate :: TaxInfo.Rate
  }
  deriving (Eq, Show)

instance FromJSON TaxInfo where
  parseJSON = withObject "InvoiceTaxInfo" $ \obj -> do
    type_ <- aesonRequired obj "type"
    region <- aesonRequired obj "region"
    rate <- aesonRequired obj "rate"
    pure TaxInfo { type_, region, rate }
