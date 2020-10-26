module Recurly.V3.Env where

import qualified System.Envy as Envy

import qualified Recurly.V3.Env.ApiUri as Env
import qualified Recurly.V3.Env.MaxAttempts as Env
import qualified Recurly.V3.Env.Token as Env
import qualified Recurly.V3.Env.WebhookPassword as Env
import qualified Recurly.V3.Env.WebhookUsername as Env

data Env = Env
  { recurlyToken :: Env.Token
  , recurlyApiUrl :: Env.ApiUri
  , recurlyMaxAttempts :: Env.MaxAttempts
  , recurlyWebhookUsername :: Env.WebhookUsername
  , recurlyWebhookPassword :: Env.WebhookPassword
  }
  deriving Generic

instance Envy.FromEnv Env
