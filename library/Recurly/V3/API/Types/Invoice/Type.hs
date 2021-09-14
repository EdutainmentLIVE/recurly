module Recurly.V3.API.Types.Invoice.Type where

import Recurlude

data InvoiceType
  = ChargeInvoiceType
  | CreditInvoiceType
  | LegacyInvoiceType
  deriving (Eq, Show)

instance ToJSON InvoiceType where
  toJSON = toJSON . into @Text

instance FromJSON InvoiceType where
  parseJSON = withText "InvoiceType" $ eitherFail . tryInto @InvoiceType

instance TryFrom Text InvoiceType where
  tryFrom = maybeTryFrom $ \invoiceType -> case invoiceType of
    "charge" -> Just ChargeInvoiceType
    "credit" -> Just CreditInvoiceType
    "legacy" -> Just LegacyInvoiceType
    _ -> Nothing

instance From InvoiceType Text where
  from invoiceType = case invoiceType of
    ChargeInvoiceType -> "charge"
    CreditInvoiceType -> "credit"
    LegacyInvoiceType -> "legacy"
