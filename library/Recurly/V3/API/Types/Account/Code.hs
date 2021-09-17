module Recurly.V3.API.Types.Account.Code where

import Recurlude

import qualified Data.Csv as Csv
import qualified Recurly.V3.API.Types.PathPiece as PathPiece

newtype Code = Code Text
    deriving (Eq, Ord, Show, FromJSON, ToJSON, Csv.FromField)

instance From Text Code

instance From Code Text

instance From Code PathPiece.PathPiece where
  from code = into @PathPiece.PathPiece $ "code-" <> into @Text code
