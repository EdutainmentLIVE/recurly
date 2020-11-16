module Recurly.V3.API.Types.AccountLineItem.UnitAmount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

-- Note: This value can be negative or positive and recurly does not care, its value
-- is governed by AccountLineItemType.
-- A positive or negative amount with type=charge will result in a positive unit_amount.
-- A positive or negative amount with type=credit will result in a negative unit_amount.
-- https://developers.recurly.com/api/v2019-10-10/index.html#operation/create_line_item
newtype AccountLineItemUnitAmount =
    AccountLineItemUnitAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

accountLineItemUnitAmountToDenseUSD :: AccountLineItemUnitAmount -> Money.DenseUSD
accountLineItemUnitAmountToDenseUSD (AccountLineItemUnitAmount denseUSD) = denseUSD

denseUSDToAccountLineItemUnitAmount :: Money.DenseUSD -> AccountLineItemUnitAmount
denseUSDToAccountLineItemUnitAmount = AccountLineItemUnitAmount
