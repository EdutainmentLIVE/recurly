module Recurly.V3.API.Types.Transaction.IpAddressV4 where

newtype TransactionIpAddressV4 =
    TransactionIpAddressV4 Text
    deriving (Eq, Show, FromJSON)

transactionIpAddressV4ToText :: TransactionIpAddressV4 -> Text
transactionIpAddressV4ToText (TransactionIpAddressV4 text) = text

textToTransactionIpAddressV4 :: Text -> TransactionIpAddressV4
textToTransactionIpAddressV4 = TransactionIpAddressV4
