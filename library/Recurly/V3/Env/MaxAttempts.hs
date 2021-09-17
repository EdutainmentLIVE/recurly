module Recurly.V3.Env.MaxAttempts where

import Recurlude

import qualified System.Envy as Envy
import qualified Text.Read as Read

newtype MaxAttempts = MaxAttempts Natural deriving (Eq)

instance Show MaxAttempts where
  show = show . maxAttemptsToNatural

instance Envy.Var MaxAttempts where
  toVar = show
  fromVar = fmap naturalToMaxAttempts . Read.readMaybe

naturalToMaxAttempts :: Natural -> MaxAttempts
naturalToMaxAttempts = MaxAttempts

maxAttemptsToNatural :: MaxAttempts -> Natural
maxAttemptsToNatural (MaxAttempts natural) = natural
