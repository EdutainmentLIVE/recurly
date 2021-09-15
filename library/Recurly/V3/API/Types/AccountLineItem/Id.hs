module Recurly.V3.API.Types.AccountLineItem.Id where

import Recurlude

newtype AccountLineItemId =
    AccountLineItemId Text
    deriving (Eq, Show, FromJSON, ToJSON)

instance From Text AccountLineItemId

instance From AccountLineItemId Text
