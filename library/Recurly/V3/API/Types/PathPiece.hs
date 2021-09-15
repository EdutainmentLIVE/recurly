module Recurly.V3.API.Types.PathPiece where

import Recurlude

newtype PathPiece = PathPiece Text deriving (Eq, Show, IsString, Semigroup)

instance From PathPiece Text

instance From Text PathPiece
