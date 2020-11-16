module Recurly.V3.API.Types.Plan.Id where

import Recurlude

newtype PlanId =
    PlanId Text
    deriving (Eq, Show, FromJSON, ToJSON)

planIdToText :: PlanId -> Text
planIdToText (PlanId text) = text

textToPlanId :: Text -> PlanId
textToPlanId = PlanId
