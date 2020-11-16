module Recurlude
  ( module Control.Exception
  , module Control.Monad
  , module Control.Monad.Catch
  , module Control.Monad.IO.Class
  , module Data.Aeson
  , module Data.ByteString
  , module Data.Map
  , module Data.Maybe
  , module Data.Text
  , module Data.Time
  , module GHC.Generics
  , module Network.HTTP.Types
  , module Network.URI
  -- IO
  , Moon
  -- Logger
  , logLn
  , pShow
  -- Helpers
  , aesonOptional
  , aesonRequired
  , aesonPair
  , aesonPairHelper
  , eitherFail
  , maybeFail
  , maybeFailWith
  , utf8ToString
  , getCurrentTime
  ) where

-- Re-exports
import Control.Exception (Exception, displayException)
import Control.Monad (when)
import Control.Monad.Catch (MonadCatch, MonadThrow)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Data.Aeson (FromJSON, ToJSON, parseJSON, toJSON, withObject, withText)
import Data.ByteString (ByteString)
import Data.Map (Map)
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Data.Time (UTCTime)
import GHC.Generics (Generic)
import Network.HTTP.Types
  (Method, HeaderName, methodGet, methodPost, methodPut, methodDelete, statusCode)
import Network.URI (URI)


import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson
import qualified Data.IORef as IORef
import qualified Data.Text as Text
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as LT
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
  let
    timestamp =
      Time.formatTime Time.defaultTimeLocale (Time.iso8601DateFormat $ Just "%T%3Q%z") now
  liftIO . Logger.noticeM "Recurly" $ timestamp <> " " <> message

-- We are hacking a state in haskell here to keep a global boolean to save if
-- logger has been initalized yet or not. The noinline is required so that
-- haskell does not recreate the IORef every single time you retrieve it.
logInitRef :: IORef.IORef Bool
logInitRef = Unsafe.unsafePerformIO $ IORef.newIORef False
{-# NOINLINE logInitRef #-}

pShow :: Show a => a -> String
pShow = LT.unpack . Pretty.pShowNoColor

-- Helpers
aesonOptional :: FromJSON value => Aeson.Object -> String -> Aeson.Parser (Maybe value)
aesonOptional object key = object Aeson..:? Text.pack key

aesonRequired :: FromJSON value => Aeson.Object -> String -> Aeson.Parser value
aesonRequired object key = object Aeson..: Text.pack key

aesonPair :: (ToJSON value, Aeson.KeyValue pair) => String -> value -> pair
aesonPair key value = Text.pack key Aeson..= value

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

-- | Converts a UTF-8 encoded ByteString into String.
utf8ToString :: ByteString -> Either String String
utf8ToString = fmap Text.unpack . utf8ToText

-- | Converts a UTF-8 encoded ByteString into Text.
utf8ToText :: ByteString -> Either String Text
utf8ToText = either (Left . displayException) Right . T.decodeUtf8'

-- | Returns now
getCurrentTime :: MonadIO m => m UTCTime
getCurrentTime = liftIO Time.getCurrentTime
