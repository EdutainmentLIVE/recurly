module Recurly.V3.API.Types.Transaction.GatewayResponseValues where

import Recurlude

import qualified Data.Aeson as Aeson

newtype GatewayResponseValues = GatewayResponseValues (Map String Aeson.Value)
    deriving (Eq, Show, FromJSON)

instance From GatewayResponseValues (Map String Aeson.Value) where
