module Recurly.V3.API.Types.Subscription.Id where

newtype SubscriptionId =
    SubscriptionId Text
    deriving (Eq, Show, FromJSON)

subscriptionIdToText :: SubscriptionId -> Text
subscriptionIdToText (SubscriptionId text) = text

textToSubscriptionId :: Text -> SubscriptionId
textToSubscriptionId = SubscriptionId
