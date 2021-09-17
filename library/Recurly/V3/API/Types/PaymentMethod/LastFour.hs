module Recurly.V3.API.Types.PaymentMethod.LastFour where

import Recurlude

newtype LastFour = LastFour Text
    deriving (Eq, Show, FromJSON)

instance From Text LastFour

instance From LastFour Text
