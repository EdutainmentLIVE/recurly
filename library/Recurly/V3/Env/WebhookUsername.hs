module Recurly.V3.Env.WebhookUsername where

import qualified System.Envy as Envy

newtype WebhookUsername = WebhookUsername Text deriving (Envy.Var)

webhookUsernameToText :: WebhookUsername -> Text
webhookUsernameToText (WebhookUsername username) = username
