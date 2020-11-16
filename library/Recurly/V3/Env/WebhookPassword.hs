module Recurly.V3.Env.WebhookPassword where

import Recurlude

import qualified System.Envy as Envy

newtype WebhookPassword = WebhookPassword Text deriving (Envy.Var)

webhookPasswordToText :: WebhookPassword -> Text
webhookPasswordToText (WebhookPassword password) = password
