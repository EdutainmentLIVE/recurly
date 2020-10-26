module Recurly.V3.API.Types.Transaction.IpAddressCountry where

newtype TransactionIpAddressCountry =
    TransactionIpAddressCountry Text
    deriving (Eq, Show, FromJSON)

transactionIpAddressCountryToText :: TransactionIpAddressCountry -> Text
transactionIpAddressCountryToText (TransactionIpAddressCountry text) = text

textToTransactionIpAddressCountry :: Text -> TransactionIpAddressCountry
textToTransactionIpAddressCountry = TransactionIpAddressCountry
