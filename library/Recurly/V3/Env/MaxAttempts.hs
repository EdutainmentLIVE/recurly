module Recurly.V3.Env.MaxAttempts where

import qualified Numeric.Natural as Natural
import qualified System.Envy as Envy
import qualified Text.Read as Read

newtype MaxAttempts = MaxAttempts Natural.Natural deriving (Eq)

instance Show MaxAttempts where
  show = show . maxAttemptsToNatural

instance Envy.Var MaxAttempts where
  toVar = show
  fromVar = fmap naturalToMaxAttempts . Read.readMaybe

naturalToMaxAttempts :: Natural.Natural -> MaxAttempts
naturalToMaxAttempts = MaxAttempts

maxAttemptsToNatural :: MaxAttempts -> Natural.Natural
maxAttemptsToNatural (MaxAttempts natural) = natural
