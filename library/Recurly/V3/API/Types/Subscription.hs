module Recurly.V3.API.Types.Subscription where

import Recurlude

import qualified Recurly.V3.API.Types.Currency as Types
import qualified Recurly.V3.API.Types.Subscription.Account as Types
import qualified Recurly.V3.API.Types.Subscription.ActivatedAt as Types
import qualified Recurly.V3.API.Types.Subscription.AutoRenew as Types
import qualified Recurly.V3.API.Types.Subscription.CanceledAt as Types
import qualified Recurly.V3.API.Types.Subscription.CouponRedemption as Types
import qualified Recurly.V3.API.Types.Subscription.CreatedAt as Types
import qualified Recurly.V3.API.Types.Subscription.CurrentPeriodEndsAt as Types
import qualified Recurly.V3.API.Types.Subscription.CurrentPeriodStartedAt as Types
import qualified Recurly.V3.API.Types.Subscription.CurrentTermEndsAt as Types
import qualified Recurly.V3.API.Types.Subscription.CurrentTermStartedAt as Types
import qualified Recurly.V3.API.Types.Subscription.ExpiresAt as Types
import qualified Recurly.V3.API.Types.Subscription.Id as Types
import qualified Recurly.V3.API.Types.Subscription.PausedAt as Types
import qualified Recurly.V3.API.Types.Subscription.Plan as Types
import qualified Recurly.V3.API.Types.Subscription.Quantity as Types
import qualified Recurly.V3.API.Types.Subscription.RemainingBillingCycles as Types
import qualified Recurly.V3.API.Types.Subscription.RemainingPauseCycles as Types
import qualified Recurly.V3.API.Types.Subscription.RenewalBillingCycles as Types
import qualified Recurly.V3.API.Types.Subscription.State as Types
import qualified Recurly.V3.API.Types.Subscription.Subtotal as Types
import qualified Recurly.V3.API.Types.Subscription.TotalBillingCycles as Types
import qualified Recurly.V3.API.Types.Subscription.TrialEndsAt as Types
import qualified Recurly.V3.API.Types.Subscription.TrialStartedAt as Types
import qualified Recurly.V3.API.Types.Subscription.UnitAmount as Types
import qualified Recurly.V3.API.Types.Subscription.UpdatedAt as Types
import qualified Recurly.V3.API.Types.Subscription.Uuid as Types

data Subscription = Subscription
  { subscriptionId :: Types.SubscriptionId
  , subscriptionUuid :: Types.SubscriptionUuid
  , subscriptionAccount :: Types.SubscriptionAccount
  , subscriptionPlan :: Types.SubscriptionPlan
  , subscriptionState :: Types.SubscriptionState
  , subscriptionCouponRedemptions :: [Types.SubscriptionCouponRedemption]
  , subscriptionCurrentPeriodStartedAt :: Types.SubscriptionCurrentPeriodStartedAt
  , subscriptionCurrentPeriodEndsAt :: Types.SubscriptionCurrentPeriodEndsAt
  , subscriptionCurrentTermStartedAt :: Maybe Types.SubscriptionCurrentTermStartedAt
  , subscriptionCurrentTermEndsAt :: Maybe Types.SubscriptionCurrentTermEndsAt
  , subscriptionTrialStartedAt :: Maybe Types.SubscriptionTrialStartedAt
  , subscriptionTrialEndsAt :: Maybe Types.SubscriptionTrialEndsAt
  , subscriptionRemainingBillingCycles :: Maybe Types.SubscriptionRemainingBillingCycles
  , subscriptionTotalBillingCycles :: Maybe Types.SubscriptionTotalBillingCycles
  , subscriptionRenewalBillingCycles :: Maybe Types.SubscriptionRenewalBillingCycles
  , subscriptionAutoRenew :: Maybe Types.SubscriptionAutoRenew
  , subscriptionPausedAt :: Maybe Types.SubscriptionPausedAt
  , subscriptionRemainingPauseCycles :: Maybe Types.SubscriptionRemainingPauseCycles
  , subscriptionCurrency :: Types.Currency
  , subscriptionUnitAmount :: Types.SubscriptionUnitAmount
  , subscriptionQuantity :: Types.SubscriptionQuantity
  , subscriptionSubtotal :: Types.SubscriptionSubtotal
  , subscriptionCreatedAt :: Types.SubscriptionCreatedAt
  , subscriptionUpdatedAt :: Types.SubscriptionUpdatedAt
  , subscriptionActivatedAt :: Types.SubscriptionActivatedAt
  , subscriptionCanceledAt :: Maybe Types.SubscriptionCanceledAt
  , subscriptionExpiresAt :: Maybe Types.SubscriptionExpiresAt
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
      { subscriptionId = id_
      , subscriptionUuid = uuid
      , subscriptionAccount = account
      , subscriptionPlan = plan
      , subscriptionState = state
      , subscriptionCouponRedemptions = couponRedemptions
      , subscriptionCurrentPeriodStartedAt = currentPeriodStartedAt
      , subscriptionCurrentPeriodEndsAt = currentPeriodEndsAt
      , subscriptionCurrentTermStartedAt = currentTermStartedAt
      , subscriptionCurrentTermEndsAt = currentTermEndsAt
      , subscriptionTrialStartedAt = trialStartedAt
      , subscriptionTrialEndsAt = trialEndsAt
      , subscriptionRemainingBillingCycles = remainingBillingCycles
      , subscriptionTotalBillingCycles = totalBillingCycles
      , subscriptionRenewalBillingCycles = renewalBillingCycles
      , subscriptionAutoRenew = autoRenew
      , subscriptionPausedAt = pausedAt
      , subscriptionRemainingPauseCycles = remainingPauseCycles
      , subscriptionCurrency = currency
      , subscriptionUnitAmount = unitAmount
      , subscriptionQuantity = quantity
      , subscriptionSubtotal = subtotal
      , subscriptionCreatedAt = createdAt
      , subscriptionUpdatedAt = updatedAt
      , subscriptionActivatedAt = activatedAt
      , subscriptionCanceledAt = canceledAt
      , subscriptionExpiresAt = expiresAt
      }
