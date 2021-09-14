module Recurly.V3.API.Types.Account.Code where

import Recurlude

import qualified Data.Csv as Csv
import qualified Recurly.V3.API.Types.RecurlyText as RecurlyText

newtype AccountCode =
    AccountCode Text
    deriving (Eq, Ord, Show, FromJSON, ToJSON, Csv.FromField)

instance From Text AccountCode

instance From AccountCode Text

instance From AccountCode RecurlyText.RecurlyText where
  from = RecurlyText.RecurlyText "code-" . into @Text
