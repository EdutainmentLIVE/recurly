module Recurly.V3.API.Subscription where

import Recurlude

import qualified Network.HTTP.Client as Client

import Recurly.V3.API.Types.Invoice (Invoice)
import qualified Recurly.V3.API.Types.PathPiece as PathPiece
import Recurly.V3.API.Types.Subscription (Subscription)
import qualified Recurly.V3.API.Types.Subscription as Subscription
import qualified Recurly.V3.Http as RecurlyApi
import qualified Recurly.V3.Recurly as Recurly
import Recurly.V3.Types.RecurlyException (RecurlyException)

getSubscription
  :: Subscription.Uuid -> Recurly.Recurly (Client.Response (Either RecurlyException Subscription))
getSubscription subscriptionUuid = do
  request <- RecurlyApi.makeRequest ["subscriptions", into @PathPiece.PathPiece subscriptionUuid]
  RecurlyApi.sendRequest request

getSubscriptionInvoices
  :: Recurly.MonadRecurly m
  => Subscription.Uuid
  -> m (Client.Response (Either RecurlyException [Invoice]))
getSubscriptionInvoices subscriptionUuid = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["subscriptions", into @PathPiece.PathPiece subscriptionUuid, "invoices"]
  RecurlyApi.sendRequestList request

cancelSubscription
  :: Recurly.MonadRecurly m
  => Subscription.Uuid
  -> m (Client.Response (Either RecurlyException Subscription))
cancelSubscription subscriptionUuid = Recurly.liftRecurly $ do
  request <- RecurlyApi.makeRequest
    ["subscriptions", into @PathPiece.PathPiece subscriptionUuid, "cancel"]
  RecurlyApi.sendRequest request { Client.method = methodPut }
