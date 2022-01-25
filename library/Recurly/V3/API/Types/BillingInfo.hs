module Recurly.V3.API.Types.BillingInfo
  ( module Recurly.V3.API.Types.BillingInfo
  , BillingInfo.PaymentMethod
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.Account.FirstName as Account
import qualified Recurly.V3.API.Types.Account.LastName as Account
import qualified Recurly.V3.API.Types.BillingInfo.PaymentMethod as BillingInfo

data BillingInfo = BillingInfo
  { id_ :: Text
  , paymentMethod :: BillingInfo.PaymentMethod
  , firstName :: Maybe Account.FirstName
  , lastName :: Maybe Account.LastName
  }
  deriving (Eq, Show)

instance FromJSON BillingInfo where
  parseJSON = withObject "BillingInfo" $ \obj -> do
    id_ <- aesonRequired obj "id"
    paymentMethod <- aesonRequired obj "payment_method"
    firstName <- aesonOptional obj "first_name"
    lastName <- aesonOptional obj "last_name"
    pure BillingInfo { id_, paymentMethod, firstName, lastName }
