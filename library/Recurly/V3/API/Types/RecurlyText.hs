module Recurly.V3.API.Types.RecurlyText where

import Recurlude

data RecurlyText = RecurlyText
  { prefix :: Text
  , text :: Text
  }

instance From RecurlyText Text where
  from recurlyText = prefix recurlyText <> text recurlyText
