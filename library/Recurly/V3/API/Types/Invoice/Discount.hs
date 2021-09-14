module Recurly.V3.API.Types.Invoice.Discount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceDiscount =
    InvoiceDiscount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD InvoiceDiscount

instance From InvoiceDiscount Money.DenseUSD
