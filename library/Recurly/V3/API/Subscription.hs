module Recurly.V3.API.Subscription where

import Recurlude

import qualified Network.HTTP.Client as Client

import qualified Recurly.V3.API.Types as Types
import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly

getSubscription
  :: Types.SubscriptionUuid
  -> Recurly.Recurly (Client.Response (Either RecurlyApi.RecurlyError Types.Subscription))
getSubscription subscriptionUuid = do
  request <- RecurlyApi.makeRequest ["subscriptions", into @PathPiece.PathPiece subscriptionUuid]
  RecurlyApi.sendRequest request

getSubscriptionInvoices
  :: Recurly.MonadRecurly m
  => Types.SubscriptionUuid
  -> m (Client.Response (Either RecurlyApi.RecurlyError [Types.Invoice]))
getSubscriptionInvoices subscriptionUuid = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["subscriptions", into @PathPiece.PathPiece subscriptionUuid, "invoices"]
  RecurlyApi.sendRequestList request

cancelSubscription
  :: Recurly.MonadRecurly m
  => Types.SubscriptionUuid
  -> m (Client.Response (Either RecurlyApi.RecurlyError Types.Subscription))
cancelSubscription subscriptionUuid = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["subscriptions", into @PathPiece.PathPiece subscriptionUuid, "cancel"]
  RecurlyApi.sendRequest request { Client.method = methodPut }
