module Recurly.V3.API.Types.Subscription.Uuid where

import Recurlude

import qualified Recurly.V3.API.Types.PathPiece as PathPiece

newtype Uuid = Uuid Text
    deriving (Eq, Show, Generic, FromJSON, ToJSON)

instance From Text Uuid

instance From Uuid Text

instance From Uuid PathPiece.PathPiece where
  from code = into @PathPiece.PathPiece $ "uuid-" <> into @Text code
