module Recurly.V3.API.Types.PaymentMethod.AccountType where

import Recurlude

data AccountType
  = Checking
  | Savings
  deriving (Eq, Show)

instance ToJSON AccountType where
  toJSON = toJSON . into @Text

instance FromJSON AccountType where
  parseJSON = withText "PaymentMethodAccountType" $ eitherFail . tryInto @AccountType

instance TryFrom Text AccountType where
  tryFrom = maybeTryFrom $ \accountType -> case accountType of
    "checking" -> Just Checking
    "savings" -> Just Savings
    _ -> Nothing

instance From AccountType Text where
  from accountType = case accountType of
    Checking -> "checking"
    Savings -> "savings"
