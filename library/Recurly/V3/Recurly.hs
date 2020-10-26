{-# LANGUAGE UndecidableInstances #-}
{- hlint ignore "Avoid restricted extensions" -}

module Recurly.V3.Recurly
  ( Env.Env(..)
  , MonadRecurly
  , Recurly(..)
  , env
  , liftRecurly
  , runRecurlySync
  )
where

import Recurlude

import qualified Control.Applicative as Applicative
import qualified Control.Monad as Monad
import qualified Control.Monad.Base as Base
import qualified Control.Monad.IO.Unlift as Unlift
import qualified Control.Monad.Reader as Reader
import qualified Control.Monad.Trans.Control as Control

import qualified Recurly.V3.Env as Env

class Base.MonadBase IO m => MonadRecurly m where
  liftRecurly :: Recurly a -> m a

newtype Recurly result = Recurly
  { unwrapRecurly :: Reader.ReaderT Env.Env IO result
  } deriving
    ( Applicative
    , Applicative.Alternative
    , Base.MonadBase IO
    , Control.MonadBaseControl IO
    , Functor
    , Monad
    , Monad.MonadPlus
    , MonadCatch
    , MonadFail
    , MonadIO
    , MonadThrow
    , Unlift.MonadUnliftIO
    )

instance MonadRecurly Recurly where
  liftRecurly action = do
    recurlyEnv <- env
    runRecurlySync recurlyEnv action

runRecurlySync :: MonadIO io => Env.Env -> Recurly result -> io result
runRecurlySync e = liftIO . flip Reader.runReaderT e . unwrapRecurly

env :: Recurly Env.Env
env = Recurly Reader.ask

overRecurly :: (Env.Env -> Env.Env) -> Recurly result -> Recurly result
overRecurly f = Recurly . Reader.withReaderT f . unwrapRecurly

instance Reader.MonadReader Env.Env Recurly where
  ask = env
  local = overRecurly
