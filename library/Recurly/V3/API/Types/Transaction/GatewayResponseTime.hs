module Recurly.V3.API.Types.Transaction.GatewayResponseTime where

import Recurlude

newtype GatewayResponseTime = GatewayResponseTime Rational
    deriving (Eq, Show)


instance FromJSON GatewayResponseTime where
  parseJSON =
    withScientific "TransactionGatewayResponseTime"
      $ eitherFail
      . tryInto @GatewayResponseTime
      . toRational

instance TryFrom Rational GatewayResponseTime where
  tryFrom = maybeTryFrom
    $ \rational -> if rational >= 0 then Just $ GatewayResponseTime rational else Nothing

instance From GatewayResponseTime Rational
