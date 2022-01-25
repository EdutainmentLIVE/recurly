module Recurly.V3.API.Account where

import Recurlude

import qualified Data.Aeson as Aeson
import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types.Account as Account
import Recurly.V3.API.Types.Account (Account)
import Recurly.V3.API.Types.AccountCouponRedemption (AccountCouponRedemption)
import Recurly.V3.API.Types.AccountLineItem (AccountLineItem)
import Recurly.V3.API.Types.BillingInfo (BillingInfo)
import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import Recurly.V3.API.Types.PostAccount (PostAccount)
import Recurly.V3.API.Types.PostAccountLineItem (PostAccountLineItem)
import Recurly.V3.API.Types.PutAccount (PutAccount)
import Recurly.V3.API.Types.Subscription (Subscription)
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly
import Recurly.V3.Types.RecurlyException (RecurlyException)

getAccountBillingInfo
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyException BillingInfo))
getAccountBillingInfo accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "billing_info"]
  RecurlyApi.sendRequest request

getAccountSubscriptions
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyException [Subscription]))
getAccountSubscriptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "subscriptions"]
  RecurlyApi.sendRequestList request

getAccountCouponRedemptions
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyException [AccountCouponRedemption]))
getAccountCouponRedemptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "coupon_redemptions"]
  RecurlyApi.sendRequestList request

getActiveAccountCouponRedemption
  :: Recurly.MonadRecurly m
  => Account.Code
  -> m (Client.Response (Either RecurlyException [AccountCouponRedemption]))
getActiveAccountCouponRedemption accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "coupon_redemptions", "active"]
  RecurlyApi.sendRequestList request

postAccount :: PostAccount -> Recurly.Recurly (Client.Response (Either RecurlyException Account))
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
  -> m (Client.Response (Either RecurlyException Account))
putAccount accountCode account = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest ["accounts", into @PathPiece.PathPiece accountCode]
  RecurlyApi.sendRequest request
    { Client.method = methodPut
    , Client.requestBody = Client.RequestBodyLBS $ Aeson.encode account
    }

postAccountLineItem
  :: Account.Code
  -> PostAccountLineItem
  -> Recurly.Recurly (Client.Response (Either RecurlyException AccountLineItem))
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
  -> m (Client.Response (Either RecurlyException AccountCouponRedemption))
deleteActiveCouponRedemptions accountCode = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["accounts", into @PathPiece.PathPiece accountCode, "coupon_redemptions", "active"]
  RecurlyApi.sendRequest request { Client.method = methodDelete }
