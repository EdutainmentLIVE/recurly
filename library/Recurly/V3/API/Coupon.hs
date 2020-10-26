module Recurly.V3.API.Coupon where

import qualified Network.HTTP.Client as Client
import qualified Network.HTTP.Types as Http

import qualified Recurly.V3.API.Types as Types
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly

postCoupon
  :: Types.PostCoupon
  -> Recurly.Recurly (Client.Response (Either RecurlyApi.RecurlyError Types.Coupon))
postCoupon coupon = do
  request <- RecurlyApi.makeRequest ["coupons"]
  RecurlyApi.sendRequest request
    { Client.method = Http.methodPost
    , Client.requestBody = Client.RequestBodyLBS $ jsonEncode coupon
    }
