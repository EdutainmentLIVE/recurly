module Recurly.V3.API.Types.Transaction.GatewayResponseTime where

import Recurlude

newtype TransactionGatewayResponseTime =
    TransactionGatewayResponseTime Rational
    deriving (Eq, Show)


instance FromJSON TransactionGatewayResponseTime where
  parseJSON =
    withScientific "TransactionGatewayResponseTime"
      $ eitherFail
      . tryInto @TransactionGatewayResponseTime
      . toRational

instance TryFrom Rational TransactionGatewayResponseTime where
  tryFrom = maybeTryFrom $ \rational ->
    if rational >= 0 then Just $ TransactionGatewayResponseTime rational else Nothing

instance From TransactionGatewayResponseTime Rational
