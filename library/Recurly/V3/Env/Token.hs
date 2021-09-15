module Recurly.V3.Env.Token where

import Recurlude

import qualified System.Envy as Envy

newtype Token = Token ByteString deriving (Envy.Var)

instance From Token ByteString

instance From ByteString Token

instance From Text Token where
  from = via @ByteString
