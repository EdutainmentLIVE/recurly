module Recurly.V3.API.Types.Invoice.Type where

import Recurlude

data Type
  = Charge
  | Credit
  | Legacy
  deriving (Eq, Show)

instance ToJSON Type where
  toJSON = toJSON . into @Text

instance FromJSON Type where
  parseJSON = withText "InvoiceType" $ eitherFail . tryInto @Type

instance TryFrom Text Type where
  tryFrom = maybeTryFrom $ \type_ -> case type_ of
    "charge" -> Just Charge
    "credit" -> Just Credit
    "legacy" -> Just Legacy
    _ -> Nothing

instance From Type Text where
  from type_ = case type_ of
    Charge -> "charge"
    Credit -> "credit"
    Legacy -> "legacy"
