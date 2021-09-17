module Recurly.V3.Env.WebhookUsername where

import Recurlude

import qualified System.Envy as Envy

newtype WebhookUsername = WebhookUsername Text deriving (Envy.Var)

instance From Text WebhookUsername

instance From WebhookUsername Text
