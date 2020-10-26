module Recurly.V3.API.Types.Subscription.UnitAmount where

import qualified Recurly.V3.API.Types.Money.Money as Money

newtype SubscriptionUnitAmount =
    SubscriptionUnitAmount Money.DenseUSD
    deriving (Eq, Show, FromJSON, ToJSON)

subscriptionUnitAmountToDenseUSD :: SubscriptionUnitAmount -> Money.DenseUSD
subscriptionUnitAmountToDenseUSD (SubscriptionUnitAmount denseUSD) = denseUSD

denseUSDToSubscriptionUnitAmount :: Money.DenseUSD -> SubscriptionUnitAmount
denseUSDToSubscriptionUnitAmount = SubscriptionUnitAmount
