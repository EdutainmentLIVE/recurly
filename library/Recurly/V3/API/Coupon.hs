module Recurly.V3.API.Coupon where

import Recurlude

import qualified Data.Aeson as Aeson
import qualified Network.HTTP.Client as Client

import Recurly.V3.API.Types.Coupon (Coupon)
import Recurly.V3.API.Types.PostCoupon (PostCoupon)
import qualified Recurly.V3.Http as RecurlyApi
import Recurly.V3.Http (RecurlyError)
import qualified Recurly.V3.Recurly as Recurly

postCoupon :: PostCoupon -> Recurly.Recurly (Client.Response (Either RecurlyError Coupon))
postCoupon coupon = do
  request <- RecurlyApi.makeRequest ["coupons"]
  RecurlyApi.sendRequest request
    { Client.method = methodPost
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode coupon
    }
