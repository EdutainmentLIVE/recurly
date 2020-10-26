module Recurlude
  (
  -- IO
    Moon
  , IO.MonadIO
  , IO.liftIO
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
  )
where

import qualified Control.Monad.IO.Class as IO
import qualified Data.Aeson as Aeson
import qualified Data.ByteString as B
import qualified Data.IORef as IORef
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as LT
import qualified Data.Time as Time
import qualified System.IO as IO
import qualified System.IO.Unsafe as Unsafe
import qualified System.Log.Logger as Logger
import qualified Text.Pretty.Simple as Pretty

-- IO
type Moon io = (MonadThrow io, IO.MonadIO io, MonadFail io)

-- Logger

initializeLogger :: IO.MonadIO io => io ()
initializeLogger = IO.liftIO $ do
  isInitialized <- IORef.atomicModifyIORef' logInitRef $ \x -> (True, x)
  unless isInitialized $ do
    IO.hSetEncoding IO.stdout IO.utf8
    IO.hSetEncoding IO.stderr IO.utf8
    Logger.updateGlobalLogger Logger.rootLoggerName $ Logger.setLevel Logger.NOTICE

-- | Logs out the given message on the @"Recurly"@ logger at the
-- 'Logger.NOTICE' priority. It also prepends the current time to the message.
logLn :: IO.MonadIO io => String -> io ()
logLn message = do
  initializeLogger
  now <- getCurrentTime
  let timestamp = formatTime defaultTimeLocale (Time.iso8601DateFormat $ Just "%T%3Q%z") now
  IO.liftIO . Logger.noticeM "Recurly" $ timestamp <> " " <> message

-- We are hacking a state in haskell here to keep a global boolean to save if
-- logger has been initalized yet or not. The noinline is required so that
-- haskell does not recreate the IORef every single time you retrieve it.
logInitRef :: IORef.IORef Bool
logInitRef = Unsafe.unsafePerformIO $ IORef.newIORef False
{-# NOINLINE logInitRef #-}

pShow :: Show a => a -> String
pShow = LT.unpack . Pretty.pShowNoColor

-- Helpers
aesonOptional :: FromJSON value => Aeson.Object -> String -> Parser (Maybe value)
aesonOptional object key = object .:? toText key

aesonRequired :: FromJSON value => Aeson.Object -> String -> Parser value
aesonRequired object key = object .: toText key

aesonPair :: (ToJSON value, Aeson.KeyValue pair) => String -> value -> pair
aesonPair key value = toText key .= value

aesonPairHelper :: [(String, record -> JsonValue)] -> record -> JsonValue
aesonPairHelper fields record =
  Aeson.object $ fmap (\(name, value) -> aesonPair name (value record)) fields

eitherFail :: (Show a, MonadFail m) => Either a b -> m b
eitherFail = eitherFailWith identity

eitherFailWith :: (Show a, MonadFail m) => (b -> c) -> Either a b -> m c
eitherFailWith c = either (fail . show) (pure . c)

maybeFail :: MonadFail m => String -> Maybe a -> m a
maybeFail message = maybeFailWith message identity

maybeFailWith :: MonadFail m => String -> (a -> b) -> Maybe a -> m b
maybeFailWith message c = maybe (fail message) (pure . c)

-- | Converts a UTF-8 encoded ByteString into String.
utf8ToString :: B.ByteString -> Either String String
utf8ToString = fmap fromText . utf8ToText

-- | Converts a UTF-8 encoded ByteString into Text.
utf8ToText :: B.ByteString -> Either String Text
utf8ToText = either (Left . displayException) Right . T.decodeUtf8'
