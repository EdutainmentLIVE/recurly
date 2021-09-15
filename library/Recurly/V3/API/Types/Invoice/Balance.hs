module Recurly.V3.API.Types.Invoice.Balance where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype Balance = Balance Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD Balance

instance From Balance Money.DenseUSD
