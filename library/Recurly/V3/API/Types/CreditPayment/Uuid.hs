module Recurly.V3.API.Types.CreditPayment.Uuid where

import Recurlude

newtype Uuid = Uuid Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text Uuid

instance From Uuid Text
