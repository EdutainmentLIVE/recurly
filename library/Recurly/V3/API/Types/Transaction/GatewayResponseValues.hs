module Recurly.V3.API.Types.Transaction.GatewayResponseValues where

import Recurlude

import qualified Data.Aeson as Aeson

newtype TransactionGatewayResponseValues =
    TransactionGatewayResponseValues (Map String Aeson.Value)
    deriving (Eq, Show, FromJSON)

instance From TransactionGatewayResponseValues (Map String Aeson.Value) where
