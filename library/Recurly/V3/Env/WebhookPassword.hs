module Recurly.V3.Env.WebhookPassword where

import Recurlude

import qualified System.Envy as Envy

newtype WebhookPassword = WebhookPassword Text deriving (Envy.Var)

instance From Text WebhookPassword

instance From WebhookPassword Text
