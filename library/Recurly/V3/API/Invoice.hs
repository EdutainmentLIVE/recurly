module Recurly.V3.API.Invoice where

import Recurlude

import qualified Data.ByteString.Lazy as LazyByteString
import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types as Types
import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly

getInvoicePdf
  :: Types.InvoiceId
  -> Recurly.Recurly (Client.Response (Either RecurlyApi.RecurlyError LazyByteString.ByteString))
getInvoicePdf invoiceId = do
  let rawInvoiceId = PathPiece.PathPiece $ into @Text invoiceId
  request <- RecurlyApi.makeRequest ["invoices", rawInvoiceId <> ".pdf"]
  RecurlyApi.sendRequestRaw request
