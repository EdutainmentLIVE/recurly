module Recurly.V3.API.Types.Plan.Code where

newtype PlanCode =
    PlanCode Text
    deriving (Eq, Show, FromJSON, ToJSON)

planCodeToText :: PlanCode -> Text
planCodeToText (PlanCode text) = text

textToPlanCode :: Text -> PlanCode
textToPlanCode = PlanCode
