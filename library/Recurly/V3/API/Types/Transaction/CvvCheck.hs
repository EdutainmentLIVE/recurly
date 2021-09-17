module Recurly.V3.API.Types.Transaction.CvvCheck where

import Recurlude

-- Yes recurly these names are very useful
data CvvCheck
  = D
  | I
  | M
  | N
  | P
  | S
  | U
  | X
  deriving (Eq, Show)

instance ToJSON CvvCheck where
  toJSON = toJSON . into @Text

instance FromJSON CvvCheck where
  parseJSON = withText "Transaction.CvvCheck" $ eitherFail . tryInto @CvvCheck

instance TryFrom Text CvvCheck where
  tryFrom = maybeTryFrom $ \transactionCvvCheck -> case transactionCvvCheck of
    "D" -> Just D
    "I" -> Just I
    "M" -> Just M
    "N" -> Just N
    "P" -> Just P
    "S" -> Just S
    "U" -> Just U
    "X" -> Just X
    _ -> Nothing

instance From CvvCheck Text where
  from transactionCvvCheck = case transactionCvvCheck of
    D -> "D"
    I -> "I"
    M -> "M"
    N -> "N"
    P -> "P"
    S -> "S"
    U -> "U"
    X -> "X"
