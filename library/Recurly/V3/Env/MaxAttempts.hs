module Recurly.V3.Env.MaxAttempts where

import Recurlude

import qualified System.Envy as Envy
import qualified Text.Read as Read

newtype MaxAttempts = MaxAttempts Natural deriving (Eq)

instance Show MaxAttempts where
  show = show . into @Natural

instance Envy.Var MaxAttempts where
  toVar = show
  fromVar = fmap (from @Natural) . Read.readMaybe

instance From Natural MaxAttempts

instance From MaxAttempts Natural
