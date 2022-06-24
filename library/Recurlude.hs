module Recurlude
  ( module Control.Exception
  , module Control.Monad
  , module Control.Monad.Catch
  , module Control.Monad.IO.Class
  , module Data.Aeson
  , module Data.ByteString
  , module Data.Either
  , module Data.Map
  , module Data.Maybe
  , module Data.Ratio
  , module Data.String
  , module Data.Text
  , module Data.Time
  , module GHC.Generics
  , module Network.HTTP.Types
  , module Network.URI
  , module Numeric.Natural
  , module Recurlude.WithCallStack
  , module Witch
  -- IO
  , Moon
  -- Logger
  , logLn
  , pShow
  -- Helpers
  , aesonOptional
  , aesonRequired
  , aesonWDefault
  , aesonPair
  , aesonPairHelper
  , eitherFail
  , eitherFailWith
  , maybeFail
  , maybeFailWith
  , getCurrentTime
  , hush
  ) where

-- Re-exports
import Control.Exception (Exception, displayException)
import Control.Monad (when)
import Control.Monad.Catch (MonadCatch, MonadThrow)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Data.Aeson (FromJSON, ToJSON, parseJSON, toJSON, withObject, withScientific, withText)
import Data.ByteString (ByteString)
import Data.Either (fromLeft, fromRight)
import Data.Map (Map)
import Data.Maybe (fromMaybe)
import Data.Ratio ((%))
import Data.String (IsString)
import Data.Text (Text)
import Data.Time (UTCTime)
import GHC.Generics (Generic)
import Network.HTTP.Types
  (HeaderName, Method, methodDelete, methodGet, methodPost, methodPut, statusCode)
import Network.URI (URI)
import Numeric.Natural (Natural)
import Recurlude.WithCallStack
import Witch (From(..), TryFrom(..), into, maybeTryFrom, tryInto, via)

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson
import qualified Data.IORef as IORef
import qualified Data.String as String
import qualified Data.Time as Time
import qualified System.IO as IO
import qualified System.IO.Unsafe as Unsafe
import qualified System.Log.Logger as Logger
import qualified Text.Pretty.Simple as Pretty

-- IO
type Moon io = (MonadThrow io, MonadIO io, MonadFail io)

-- Logger

initializeLogger :: MonadIO io => io ()
initializeLogger = liftIO $ do
  isInitialized <- IORef.atomicModifyIORef' logInitRef $ \x -> (True, x)
  when (not isInitialized) $ do
    IO.hSetEncoding IO.stdout IO.utf8
    IO.hSetEncoding IO.stderr IO.utf8
    Logger.updateGlobalLogger Logger.rootLoggerName $ Logger.setLevel Logger.NOTICE

-- | Logs out the given message on the @"Recurly"@ logger at the
-- 'Logger.NOTICE' priority. It also prepends the current time to the message.
logLn :: MonadIO io => String -> io ()
logLn message = do
  initializeLogger
  now <- getCurrentTime
  let timestamp = Time.formatTime Time.defaultTimeLocale "%Y-%m-%dT%T%3Q%z" now
  liftIO . Logger.noticeM "Recurly" $ timestamp <> " " <> message

{- hlint ignore logInitRef "Avoid restricted function" -}
-- We are hacking a state in haskell here to keep a global boolean to save if
-- logger has been initalized yet or not. The noinline is required so that
-- haskell does not recreate the IORef every single time you retrieve it.
logInitRef :: IORef.IORef Bool
logInitRef = Unsafe.unsafePerformIO $ IORef.newIORef False
{-# NOINLINE logInitRef #-}

pShow :: Show a => a -> String
pShow = into @String . Pretty.pShowNoColor

-- Helpers
aesonOptional :: FromJSON value => Aeson.Object -> String -> Aeson.Parser (Maybe value)
aesonOptional object key = object Aeson..:? String.fromString key

aesonRequired :: FromJSON value => Aeson.Object -> String -> Aeson.Parser value
aesonRequired object key = object Aeson..: String.fromString key

aesonWDefault :: FromJSON value => value -> Aeson.Object -> String -> Aeson.Parser value
aesonWDefault f object key = fmap (fromMaybe f) $ object Aeson..:? String.fromString key

aesonPair :: (ToJSON value, Aeson.KeyValue pair) => String -> value -> pair
aesonPair key value = String.fromString key Aeson..= value

aesonPairHelper :: [(String, record -> Aeson.Value)] -> record -> Aeson.Value
aesonPairHelper fields record =
  Aeson.object $ fmap (\(name, value) -> aesonPair name (value record)) fields

eitherFail :: (Show a, MonadFail m) => Either a b -> m b
eitherFail = eitherFailWith id

eitherFailWith :: (Show a, MonadFail m) => (b -> c) -> Either a b -> m c
eitherFailWith c = either (fail . show) (pure . c)

maybeFail :: MonadFail m => String -> Maybe a -> m a
maybeFail message = maybeFailWith message id

maybeFailWith :: MonadFail m => String -> (a -> b) -> Maybe a -> m b
maybeFailWith message c = maybe (fail message) (pure . c)

-- | Returns now
getCurrentTime :: MonadIO m => m UTCTime
getCurrentTime = liftIO Time.getCurrentTime

hush :: Either b a -> Maybe a
hush = either (const Nothing) pure
