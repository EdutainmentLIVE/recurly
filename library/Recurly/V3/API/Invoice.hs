module Recurly.V3.API.Invoice where

-- import Recurlude

import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types as Types
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly

getInvoicePdf
  :: Types.InvoiceId
  -> Recurly.Recurly (Client.Response (Either RecurlyApi.RecurlyError Types.Base64))
getInvoicePdf invoiceId = do
  request <- RecurlyApi.makeRequest ["invoices", Types.invoiceIdToText invoiceId <> ".pdf"]
  RecurlyApi.sendRequest request
