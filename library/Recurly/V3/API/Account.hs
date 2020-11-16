module Recurly.V3.API.Account where

import Recurlude

import qualified Data.Aeson as Aeson
import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types as Types
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly

getAccountSubscriptions
  :: Recurly.MonadRecurly m
  => Types.AccountCode
  -> m (Client.Response (Either RecurlyApi.RecurlyError [Types.Subscription]))
getAccountSubscriptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", Types.accountCodeToRecurlyText accountCode, "subscriptions"]
  RecurlyApi.sendRequestList request

getAccountCouponRedemptions
  :: Recurly.MonadRecurly m
  => Types.AccountCode
  -> m (Client.Response (Either RecurlyApi.RecurlyError [Types.AccountCouponRedemption]))
getAccountCouponRedemptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", Types.accountCodeToRecurlyText accountCode, "coupon_redemptions"]
  RecurlyApi.sendRequestList request

getActiveAccountCouponRedemption
  :: Recurly.MonadRecurly m
  => Types.AccountCode
  -> m
       ( Client.Response
           (Either RecurlyApi.RecurlyError (Maybe Types.AccountCouponRedemption))
       )
getActiveAccountCouponRedemption accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", Types.accountCodeToRecurlyText accountCode, "coupon_redemptions", "active"]
  RecurlyApi.withNotFoundHandler $ RecurlyApi.sendRequest request

postAccount
  :: Types.PostAccount
  -> Recurly.Recurly (Client.Response (Either RecurlyApi.RecurlyError Types.Account))
postAccount account = do
  request <- RecurlyApi.makeRequest ["accounts"]
  RecurlyApi.sendRequest request
    { Client.method = methodPost
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode account
    }

putAccount
  :: Recurly.MonadRecurly m
  => Types.AccountCode
  -> Types.PutAccount
  -> m (Client.Response (Either RecurlyApi.RecurlyError Types.Account))
putAccount accountCode account = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest ["accounts", Types.accountCodeToRecurlyText accountCode]
  RecurlyApi.sendRequest request
    { Client.method = methodPut
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode account
    }

postAccountLineItem
  :: Types.AccountCode
  -> Types.PostAccountLineItem
  -> Recurly.Recurly (Client.Response (Either RecurlyApi.RecurlyError Types.AccountLineItem))
postAccountLineItem accountCode accountLineItem = do
  request <- RecurlyApi.makeRequest
    ["accounts", Types.accountCodeToRecurlyText accountCode, "line_items"]
  RecurlyApi.sendRequest request
    { Client.method = methodPost
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode accountLineItem
    }

deleteActiveCouponRedemptions
  :: Recurly.MonadRecurly m
  => Types.AccountCode
  -> m (Client.Response (Either RecurlyApi.RecurlyError Types.AccountCouponRedemption))
deleteActiveCouponRedemptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", Types.accountCodeToRecurlyText accountCode, "coupon_redemptions", "active"]
  RecurlyApi.sendRequest request { Client.method = methodDelete }
