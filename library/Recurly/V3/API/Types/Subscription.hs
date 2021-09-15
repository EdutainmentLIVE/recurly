module Recurly.V3.API.Types.Subscription
  ( module Recurly.V3.API.Types.Subscription
  , CouponRedemption.CouponRedemption
  , Subscription.Account
  , Subscription.ActivatedAt
  , Subscription.AutoRenew
  , Subscription.CanceledAt
  , Subscription.CreatedAt
  , Subscription.CurrentPeriodEndsAt
  , Subscription.CurrentPeriodStartedAt
  , Subscription.CurrentTermEndsAt
  , Subscription.CurrentTermStartedAt
  , Subscription.ExpiresAt
  , Subscription.Id
  , Subscription.PausedAt
  , Subscription.Plan
  , Subscription.Quantity
  , Subscription.RemainingBillingCycles
  , Subscription.RemainingPauseCycles
  , Subscription.RenewalBillingCycles
  , Subscription.State
  , Subscription.Subtotal
  , Subscription.TotalBillingCycles
  , Subscription.TrialEndsAt
  , Subscription.TrialStartedAt
  , Subscription.UnitAmount
  , Subscription.UpdatedAt
  , Subscription.Uuid
  ) where

import Recurlude

import qualified Recurly.V3.API.Types.CouponRedemption as CouponRedemption
import qualified Recurly.V3.API.Types.Currency as Currency
import qualified Recurly.V3.API.Types.Subscription.Account as Subscription
import qualified Recurly.V3.API.Types.Subscription.ActivatedAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.AutoRenew as Subscription
import qualified Recurly.V3.API.Types.Subscription.CanceledAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.CreatedAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.CurrentPeriodEndsAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.CurrentPeriodStartedAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.CurrentTermEndsAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.CurrentTermStartedAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.ExpiresAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.Id as Subscription
import qualified Recurly.V3.API.Types.Subscription.PausedAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.Plan as Subscription
import qualified Recurly.V3.API.Types.Subscription.Quantity as Subscription
import qualified Recurly.V3.API.Types.Subscription.RemainingBillingCycles as Subscription
import qualified Recurly.V3.API.Types.Subscription.RemainingPauseCycles as Subscription
import qualified Recurly.V3.API.Types.Subscription.RenewalBillingCycles as Subscription
import qualified Recurly.V3.API.Types.Subscription.State as Subscription
import qualified Recurly.V3.API.Types.Subscription.Subtotal as Subscription
import qualified Recurly.V3.API.Types.Subscription.TotalBillingCycles as Subscription
import qualified Recurly.V3.API.Types.Subscription.TrialEndsAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.TrialStartedAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.UnitAmount as Subscription
import qualified Recurly.V3.API.Types.Subscription.UpdatedAt as Subscription
import qualified Recurly.V3.API.Types.Subscription.Uuid as Subscription

data Subscription = Subscription
  { id_ :: Subscription.Id
  , uuid :: Subscription.Uuid
  , account :: Subscription.Account
  , plan :: Subscription.Plan
  , state :: Subscription.State
  , couponRedemptions :: [CouponRedemption.CouponRedemption]
  , currentPeriodStartedAt :: Subscription.CurrentPeriodStartedAt
  , currentPeriodEndsAt :: Subscription.CurrentPeriodEndsAt
  , currentTermStartedAt :: Maybe Subscription.CurrentTermStartedAt
  , currentTermEndsAt :: Maybe Subscription.CurrentTermEndsAt
  , trialStartedAt :: Maybe Subscription.TrialStartedAt
  , trialEndsAt :: Maybe Subscription.TrialEndsAt
  , remainingBillingCycles :: Maybe Subscription.RemainingBillingCycles
  , totalBillingCycles :: Maybe Subscription.TotalBillingCycles
  , renewalBillingCycles :: Maybe Subscription.RenewalBillingCycles
  , autoRenew :: Maybe Subscription.AutoRenew
  , pausedAt :: Maybe Subscription.PausedAt
  , remainingPauseCycles :: Maybe Subscription.RemainingPauseCycles
  , currency :: Currency.Currency
  , unitAmount :: Subscription.UnitAmount
  , quantity :: Subscription.Quantity
  , subtotal :: Subscription.Subtotal
  , createdAt :: Subscription.CreatedAt
  , updatedAt :: Subscription.UpdatedAt
  , activatedAt :: Subscription.ActivatedAt
  , canceledAt :: Maybe Subscription.CanceledAt
  , expiresAt :: Maybe Subscription.ExpiresAt
  }
  deriving Show

instance FromJSON Subscription where
  parseJSON = withObject "Subscription" $ \obj -> do
    id_ <- aesonRequired obj "id"
    uuid <- aesonRequired obj "uuid"
    account <- aesonRequired obj "account"
    plan <- aesonRequired obj "plan"
    state <- aesonRequired obj "state"
    couponRedemptions <- fmap (fromMaybe []) $ aesonOptional obj "coupon_redemptions"
    currentPeriodStartedAt <- aesonRequired obj "current_period_started_at"
    currentPeriodEndsAt <- aesonRequired obj "current_period_ends_at"
    currentTermStartedAt <- aesonOptional obj "current_term_started_at"
    currentTermEndsAt <- aesonOptional obj "current_term_ends_at"
    trialStartedAt <- aesonOptional obj "trial_started_at"
    trialEndsAt <- aesonOptional obj "trial_ends_at"
    remainingBillingCycles <- aesonOptional obj "remaining_billing_cycles"
    totalBillingCycles <- aesonOptional obj "total_billing_cycles"
    renewalBillingCycles <- aesonOptional obj "renewal_billing_cycles"
    autoRenew <- aesonOptional obj "auto_renew"
    pausedAt <- aesonOptional obj "paused_at"
    remainingPauseCycles <- aesonOptional obj "remaining_pause_cycles"
    currency <- aesonRequired obj "currency"
    unitAmount <- aesonRequired obj "unit_amount"
    quantity <- aesonRequired obj "quantity"
    subtotal <- aesonRequired obj "subtotal"
    createdAt <- aesonRequired obj "created_at"
    updatedAt <- aesonRequired obj "updated_at"
    activatedAt <- aesonRequired obj "activated_at"
    canceledAt <- aesonOptional obj "canceled_at"
    expiresAt <- aesonOptional obj "expires_at"
    pure Subscription
      { id_
      , uuid
      , account
      , plan
      , state
      , couponRedemptions
      , currentPeriodStartedAt
      , currentPeriodEndsAt
      , currentTermStartedAt
      , currentTermEndsAt
      , trialStartedAt
      , trialEndsAt
      , remainingBillingCycles
      , totalBillingCycles
      , renewalBillingCycles
      , autoRenew
      , pausedAt
      , remainingPauseCycles
      , currency
      , unitAmount
      , quantity
      , subtotal
      , createdAt
      , updatedAt
      , activatedAt
      , canceledAt
      , expiresAt
      }
