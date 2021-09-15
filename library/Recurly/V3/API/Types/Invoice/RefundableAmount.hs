module Recurly.V3.API.Types.Invoice.RefundableAmount where

import Recurlude

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype InvoiceRefundableAmount =
    InvoiceRefundableAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON)

instance From Money.DenseUSD InvoiceRefundableAmount

instance From InvoiceRefundableAmount Money.DenseUSD
