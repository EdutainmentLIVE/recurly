module Recurly.V3.API.Types.Invoice.TaxInfo where

import Recurlude

import qualified Recurly.V3.API.Types.TaxInfo.Rate as Types
import qualified Recurly.V3.API.Types.TaxInfo.Region as Types
import qualified Recurly.V3.API.Types.TaxInfo.Type as Types

data InvoiceTaxInfo = InvoiceTaxInfo
  { invoiceTaxInfoType :: Types.TaxInfoType
  , invoiceTaxInfoRegion :: Types.TaxInfoRegion
  , invoiceTaxInfoRate :: Types.TaxInfoRate
  }
  deriving (Eq, Show)

instance FromJSON InvoiceTaxInfo where
  parseJSON = withObject "InvoiceTaxInfo" $ \obj -> do
    type_ <- aesonRequired obj "type"
    region <- aesonRequired obj "region"
    rate <- aesonRequired obj "rate"
    pure InvoiceTaxInfo
      { invoiceTaxInfoType = type_
      , invoiceTaxInfoRegion = region
      , invoiceTaxInfoRate = rate
      }
