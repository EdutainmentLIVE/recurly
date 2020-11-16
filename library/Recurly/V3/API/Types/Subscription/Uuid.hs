module Recurly.V3.API.Types.Subscription.Uuid where

import Recurlude

newtype SubscriptionUuid =
    SubscriptionUuid Text
    deriving (Eq, Show, FromJSON)

subscriptionUuidToText :: SubscriptionUuid -> Text
subscriptionUuidToText (SubscriptionUuid text) = text

subscriptionUuidToRecurlyText :: SubscriptionUuid -> Text
subscriptionUuidToRecurlyText (SubscriptionUuid text) = "uuid-" <> text

textToSubscriptionUuid :: Text -> SubscriptionUuid
textToSubscriptionUuid = SubscriptionUuid
