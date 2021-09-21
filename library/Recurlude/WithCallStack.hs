module Recurlude.WithCallStack where

import Control.Exception (Exception(..), SomeException(..), throw)
import Control.Monad.Catch (MonadThrow)
import GHC.Stack
  ( CallStack
  , HasCallStack
  , callStack
  , emptyCallStack
  , fromCallSiteList
  , getCallStack
  , prettyCallStack
  )
import Prelude

-- | This data type represents an exception along with a call stack. It is
-- assumed that the call stack comes from where the exception was thrown, but
-- that may not always be the case.
data WithCallStack = WithCallStack SomeException CallStack
  deriving Show

instance Exception WithCallStack where
  displayException (WithCallStack (SomeException e) s) =
    unlines [displayException e, prettyCallStack s]

appendCallStacks :: CallStack -> CallStack -> CallStack
appendCallStacks x y = fromCallSiteList $ getCallStack x <> getCallStack y

-- | Adds a call stack to some exception. If the exception already has a call
-- stack, the current call stack will be appended to it.
addCallStack :: HasCallStack => SomeException -> SomeException
addCallStack e1 = toException $ case fromException e1 of
  Just (WithCallStack e2 s) -> WithCallStack e2 $ appendCallStacks callStack s
  Nothing -> WithCallStack e1 callStack

-- | Extracts the call stack from some exception. If the exception was a
-- 'WithCallStack', that layer will be stripped off. If there was no call
-- stack, that part will be 'emptyCallStack'. If there were multiple call
-- stacks, they will be appended.
extractCallStack :: SomeException -> (SomeException, CallStack)
extractCallStack e1 = case fromException e1 of
  Just (WithCallStack e2 s) -> fmap (flip appendCallStacks s) $ extractCallStack e2
  Nothing -> (e1, emptyCallStack)

-- | Removes the call stack from some exception. If the exception didn't have a
-- call stack, it is returned unchanged.
removeCallStack :: SomeException -> SomeException
removeCallStack = fst . extractCallStack

-- | Attachs a call stack to an exception and then throws it. When possible you
-- should prefer this function over @throwIO@ and @throw@.
throwWithCallStack :: (HasCallStack, Exception e, MonadThrow m) => e -> m a
throwWithCallStack = throw . addCallStack . toException

castException :: Exception e => SomeException -> Maybe e
castException = fromException . removeCallStack

eitherThrow :: (HasCallStack, Exception e, MonadThrow m) => Either e a -> m a
eitherThrow = eitherThrowWith id

eitherThrowWith :: (HasCallStack, Exception e2, MonadThrow m) => (e1 -> e2) -> Either e1 a -> m a
eitherThrowWith f = either (throwWithCallStack . f) pure
