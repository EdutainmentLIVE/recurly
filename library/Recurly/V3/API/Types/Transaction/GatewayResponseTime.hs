module Recurly.V3.API.Types.Transaction.GatewayResponseTime where

import Recurlude

import qualified Data.Scientific as Scientific

newtype TransactionGatewayResponseTime =
    TransactionGatewayResponseTime Rational
    deriving (Eq, Show)

instance FromJSON TransactionGatewayResponseTime where
  parseJSON value = do
    scientific :: Scientific.Scientific <- parseJSON value
    pure . TransactionGatewayResponseTime $ toRational scientific

transactionGatewayResponseTimeToRational :: TransactionGatewayResponseTime -> Rational
transactionGatewayResponseTimeToRational (TransactionGatewayResponseTime rational) = rational

rationalToTransactionGatewayResponseTime :: Rational -> Maybe TransactionGatewayResponseTime
rationalToTransactionGatewayResponseTime rational =
  if rational >= 0 then Just $ TransactionGatewayResponseTime rational else Nothing
