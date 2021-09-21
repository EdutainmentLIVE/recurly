module Recurly.V3.API.Invoice where

import Recurlude

import qualified Data.ByteString.Lazy as LazyByteString
import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types.Invoice as Invoice
import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly
import Recurly.V3.Types.RecurlyException (RecurlyException)

getInvoicePdf
  :: Invoice.Id
  -> Recurly.Recurly (Client.Response (Either RecurlyException LazyByteString.ByteString))
getInvoicePdf invoiceId = do
  let rawInvoiceId = PathPiece.PathPiece $ into @Text invoiceId
  request <- RecurlyApi.makeRequest ["invoices", rawInvoiceId <> ".pdf"]
  RecurlyApi.sendRequestRaw request
