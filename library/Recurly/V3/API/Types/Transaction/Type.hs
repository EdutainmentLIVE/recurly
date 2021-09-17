module Recurly.V3.API.Types.Transaction.Type where

import Recurlude

data Type
  = Authorization
  | Capture
  | Purchase
  | Refund
  | Verify
  deriving (Eq, Show)

instance ToJSON Type where
  toJSON = toJSON . into @Text

instance FromJSON Type where
  parseJSON = withText "Transaction.Type" $ eitherFail . tryInto @Type

instance TryFrom Text Type where
  tryFrom = maybeTryFrom $ \transactionType -> case transactionType of
    "authorization" -> Just Authorization
    "capture" -> Just Capture
    "purchase" -> Just Purchase
    "refund" -> Just Refund
    "verify" -> Just Verify
    _ -> Nothing

instance From Type Text where
  from transactionType = case transactionType of
    Authorization -> "authorization"
    Capture -> "capture"
    Purchase -> "purchase"
    Refund -> "refund"
    Verify -> "verify"
