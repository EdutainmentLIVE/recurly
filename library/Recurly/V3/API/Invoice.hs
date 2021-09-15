module Recurly.V3.API.Invoice where

import Recurlude

import qualified Data.ByteString.Lazy as LazyByteString
import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types.Invoice as Invoice
import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import qualified Recurly.V3.Http as RecurlyApi
import Recurly.V3.Http (RecurlyError)
import qualified Recurly.V3.Recurly as Recurly

getInvoicePdf
  :: Invoice.Id -> Recurly.Recurly (Client.Response (Either RecurlyError LazyByteString.ByteString))
getInvoicePdf invoiceId = do
  let rawInvoiceId = PathPiece.PathPiece $ into @Text invoiceId
  request <- RecurlyApi.makeRequest ["invoices", rawInvoiceId <> ".pdf"]
  RecurlyApi.sendRequestRaw request
