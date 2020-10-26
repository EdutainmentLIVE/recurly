module Recurly.V3.API.Types.Plan.Name where

newtype PlanName =
    PlanName Text
    deriving (Eq, Show, FromJSON, ToJSON)

planNameToText :: PlanName -> Text
planNameToText (PlanName text) = text

textToPlanName :: Text -> PlanName
textToPlanName = PlanName
