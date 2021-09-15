module Recurly.V3.API.Account where

import Recurlude

import qualified Data.Aeson as Aeson
import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types.Account as Account
import Recurly.V3.API.Types.Account (Account)
import Recurly.V3.API.Types.AccountCouponRedemption (AccountCouponRedemption)
import Recurly.V3.API.Types.AccountLineItem (AccountLineItem)
import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import Recurly.V3.API.Types.PostAccount (PostAccount)
import Recurly.V3.API.Types.PostAccountLineItem (PostAccountLineItem)
import Recurly.V3.API.Types.PutAccount (PutAccount)
import Recurly.V3.API.Types.Subscription (Subscription)
import qualified Recurly.V3.Http as RecurlyApi
import Recurly.V3.Http (RecurlyError)
import qualified Recurly.V3.Recurly as Recurly

getAccountSubscriptions
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyError [Subscription]))
getAccountSubscriptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "subscriptions"]
  RecurlyApi.sendRequestList request

getAccountCouponRedemptions
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyError [AccountCouponRedemption]))
getAccountCouponRedemptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "coupon_redemptions"]
  RecurlyApi.sendRequestList request

getActiveAccountCouponRedemption
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyError [AccountCouponRedemption]))
getActiveAccountCouponRedemption accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "coupon_redemptions", "active"]
  RecurlyApi.sendRequestList request

postAccount :: PostAccount -> Recurly.Recurly (Client.Response (Either RecurlyError Account))
postAccount account = do
  request <- RecurlyApi.makeRequest ["accounts"]
  RecurlyApi.sendRequest request
    { Client.method = methodPost
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode account
    }

putAccount
  :: Recurly.MonadRecurly m
  => Account.Code
  -> PutAccount
  -> m (Client.Response (Either RecurlyError Account))
putAccount accountCode account = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest ["accounts", into @PathPiece.PathPiece accountCode]
  RecurlyApi.sendRequest request
    { Client.method = methodPut
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode account
    }

postAccountLineItem
  :: Account.Code
  -> PostAccountLineItem
  -> Recurly.Recurly (Client.Response (Either RecurlyError AccountLineItem))
postAccountLineItem accountCode accountLineItem = do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "line_items"]
  RecurlyApi.sendRequest request
    { Client.method = methodPost
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode accountLineItem
    }

deleteActiveCouponRedemptions
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyError AccountCouponRedemption))
deleteActiveCouponRedemptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "coupon_redemptions", "active"]
  RecurlyApi.sendRequest request { Client.method = methodDelete }
