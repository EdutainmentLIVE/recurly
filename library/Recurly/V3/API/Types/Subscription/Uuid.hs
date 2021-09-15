module Recurly.V3.API.Types.Subscription.Uuid where

import Recurlude

import qualified Recurly.V3.API.Types.PathPiece as PathPiece

newtype SubscriptionUuid =
    SubscriptionUuid Text
    deriving (Eq, Show, FromJSON)

instance From Text SubscriptionUuid

instance From SubscriptionUuid Text

instance From SubscriptionUuid PathPiece.PathPiece where
  from code = into @PathPiece.PathPiece $ "uuid-" <> into @Text code
