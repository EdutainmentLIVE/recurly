module Recurly.V3.API.Types.Account.Code where

import Recurlude

import qualified Data.Csv as Csv
import qualified Recurly.V3.API.Types.PathPiece as PathPiece

newtype AccountCode =
    AccountCode Text
    deriving (Eq, Ord, Show, FromJSON, ToJSON, Csv.FromField)

instance From Text AccountCode

instance From AccountCode Text

instance From AccountCode PathPiece.PathPiece where
  from code = into @PathPiece.PathPiece $ "code-" <> into @Text code
