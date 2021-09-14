module Recurly.V3.API.Types.Subscription.Uuid where

import Recurlude

import qualified Recurly.V3.API.Types.RecurlyText as RecurlyText

newtype SubscriptionUuid =
    SubscriptionUuid Text
    deriving (Eq, Show, FromJSON)

instance From Text SubscriptionUuid

instance From SubscriptionUuid Text

instance From SubscriptionUuid RecurlyText.RecurlyText where
  from = RecurlyText.RecurlyText "uuid-" . into @Text
