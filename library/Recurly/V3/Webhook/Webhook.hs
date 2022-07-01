{-# LANGUAGE DeriveAnyClass #-}

module Recurly.V3.Webhook.Webhook where

import Recurlude

import qualified Control.Lens as Lens
import qualified Data.ByteString.Lazy as LazyByteString
import Data.CaseInsensitive (CI)
import qualified Data.Foldable as Foldable
import qualified Data.Monoid as Monoid
import qualified Data.String as String
import qualified Text.XML as Xml
import qualified Text.XML.Lens as Lens
import Text.XML.Lens ((...))

import qualified Recurly.V3.API.Types.Account as Account
import qualified Recurly.V3.API.Types.CreditPayment as CreditPayment
import qualified Recurly.V3.API.Types.Invoice as Invoice
import qualified Recurly.V3.API.Types.Subscription as Subscription
import qualified Recurly.V3.API.Types.Transaction as Transaction

data WebhookError
  = InvalidXml
  | NoAccountCode String -- ^ root xml node name
  | UnknownWebhook String -- ^ root xml node name
  deriving (Eq, Show)

instance Exception WebhookError

data Notification
  = AccountNew Account.Code
  | AccountUpdated Account.Code
  | AccountCanceled Account.Code
  | AccountBillingInfoUpdated Account.Code
  | AccountBillingInfoUpdateFailed Account.Code
  | SubscriptionNew Account.Code Subscription.Uuid
  | SubscriptionUpdated Account.Code Subscription.Uuid
  | SubscriptionScheduledUpdate Account.Code Subscription.Uuid
  | SubscriptionCanceled Account.Code Subscription.Uuid
  | SubscriptionExpired Account.Code Subscription.Uuid
  | SubscriptionRenewed Account.Code Subscription.Uuid
  | SubscriptionReactivated Account.Code Subscription.Uuid
  | SubscriptionPaused Account.Code Subscription.Uuid
  | SubscriptionResumed Account.Code Subscription.Uuid
  | SubscriptionScheduledPause Account.Code Subscription.Uuid
  | SubscriptionPauseModified Account.Code Subscription.Uuid
  | SubscriptionPausedRenewal Account.Code Subscription.Uuid
  | SubscriptionPauseCanceled Account.Code Subscription.Uuid
  | InvoiceNewCharge Account.Code Invoice.Id
  | InvoiceProcessingCharge Account.Code Invoice.Id
  | InvoicePastDueCharge Account.Code Invoice.Id
  | InvoicePaidCharge Account.Code Invoice.Id
  | InvoiceFailedCharge Account.Code Invoice.Id
  | InvoiceReopenedCharge Account.Code Invoice.Id
  | InvoiceUpdatedCharge Account.Code Invoice.Id
  | InvoiceNewCredit Account.Code Invoice.Id
  | InvoiceProcessingCredit Account.Code Invoice.Id
  | InvoiceClosedCredit Account.Code Invoice.Id
  | InvoiceVoidedCredit Account.Code Invoice.Id
  | InvoiceReopenedCredit Account.Code Invoice.Id
  | InvoiceOpenCredit Account.Code Invoice.Id
  | InvoiceUpdatedCredit Account.Code Invoice.Id
  | InvoiceNew Account.Code Invoice.Id
  | InvoiceProcessing Account.Code Invoice.Id
  | InvoiceClosed Account.Code Invoice.Id
  | InvoicePastDue Account.Code Invoice.Id
  | PaymentScheduled Account.Code Transaction.Id
  | PaymentProcessing Account.Code Transaction.Id
  | PaymentSuccessful Account.Code Transaction.Id
  | PaymentFailed Account.Code Transaction.Id
  | PaymentSuccessfulRefund Account.Code Transaction.Id
  | PaymentVoid Account.Code Transaction.Id
  | PaymentFraudInfoUpdated Account.Code Transaction.Id
  | PaymentTransactionStatusUpdated Account.Code Transaction.Id
  | PaymentTransactionAuthorized Account.Code Transaction.Id
  | CreditPaymentNew Account.Code CreditPayment.Uuid
  | CreditPaymentVoided Account.Code CreditPayment.Uuid
  | LegacyDunningEventNew Account.Code Invoice.Id Subscription.Uuid Transaction.Id
  | DunningEventNew Account.Code Invoice.Id Subscription.Uuid
  deriving (Eq, Show, Generic, FromJSON, ToJSON)

-- brittany-next-binding --columns 300
documentToNotification :: Xml.Document -> Maybe Notification
documentToNotification document = Foldable.asum $ fmap
  (\notif -> notif document)
  [ getAccountInfo AccountNew "new_account_notification"
  , getAccountInfo AccountUpdated "updated_account_notification"
  , getAccountInfo AccountCanceled "canceled_account_notification"
  , getAccountInfo AccountBillingInfoUpdated "billing_info_updated_notification"
  , getAccountInfo AccountBillingInfoUpdateFailed "billing_info_update_failed_notification"
  , getSubscriptionInfo SubscriptionNew "reactivated_account_notification"
  , getSubscriptionInfo SubscriptionUpdated "updated_subscription_notification"
  , getSubscriptionInfo SubscriptionScheduledUpdate "scheduled_subscription_update_notification"
  , getSubscriptionInfo SubscriptionCanceled "canceled_subscription_notification"
  , getSubscriptionInfo SubscriptionExpired "expired_subscription_notification"
  , getSubscriptionInfo SubscriptionRenewed "renewed_subscription_notification"
  , getSubscriptionInfo SubscriptionReactivated "reactivated_account_notification"
  , getSubscriptionInfo SubscriptionPaused "subscription_paused_notification"
  , getSubscriptionInfo SubscriptionResumed "subscription_resumed_notification"
  , getSubscriptionInfo SubscriptionScheduledPause "scheduled_subscription_pause_notification"
  , getSubscriptionInfo SubscriptionPauseModified "subscription_pause_modified_notification"
  , getSubscriptionInfo SubscriptionPausedRenewal "paused_subscription_renewal_notification"
  , getSubscriptionInfo SubscriptionPauseCanceled "subscription_pause_canceled_notification"
  , getInvoiceInfo InvoiceNewCharge "new_charge_invoice_notification"
  , getInvoiceInfo InvoiceProcessingCharge "processing_charge_invoice_notification"
  , getInvoiceInfo InvoicePastDueCharge "past_due_charge_invoice_notification"
  , getInvoiceInfo InvoicePaidCharge "paid_charge_invoice_notification"
  , getInvoiceInfo InvoiceFailedCharge "failed_charge_invoice_notification"
  , getInvoiceInfo InvoiceReopenedCharge "reopened_charge_invoice_notification"
  , getInvoiceInfo InvoiceUpdatedCharge "updated_charge_invoice_notification"
  , getInvoiceInfo InvoiceNewCredit "new_credit_invoice_notification"
  , getInvoiceInfo InvoiceProcessingCredit "processing_credit_invoice_notification"
  , getInvoiceInfo InvoiceClosedCredit "closed_credit_invoice_notification"
  , getInvoiceInfo InvoiceVoidedCredit "voided_credit_invoice_notification"
  , getInvoiceInfo InvoiceReopenedCredit "reopened_credit_invoice_notification"
  , getInvoiceInfo InvoiceOpenCredit "open_credit_invoice_notification"
  , getInvoiceInfo InvoiceUpdatedCredit "updated_credit_invoice_notification"
  , getInvoiceInfo InvoiceNew "new_invoice_notification"
  , getInvoiceInfo InvoiceProcessing "processing_invoice_notification"
  , getInvoiceInfo InvoiceClosed "closed_invoice_notification"
  , getInvoiceInfo InvoicePastDue "past_due_invoice_notification"
  , getPaymentInfo PaymentScheduled "scheduled_payment_notification"
  , getPaymentInfo PaymentProcessing "processing_payment_notification"
  , getPaymentInfo PaymentSuccessful "successful_payment_notification"
  , getPaymentInfo PaymentFailed "failed_payment_notification"
  , getPaymentInfo PaymentSuccessfulRefund "successful_refund_notification"
  , getPaymentInfo PaymentVoid "void_payment_notification"
  , getPaymentInfo PaymentFraudInfoUpdated "fraud_info_updated_notification"
  , getPaymentInfo PaymentTransactionStatusUpdated "transaction_status_updated_notification"
  , getPaymentInfo PaymentTransactionAuthorized "transaction_authorized_notification"
  , getCreditPaymentInfo CreditPaymentNew "new_credit_payment_notification"
  , getCreditPaymentInfo CreditPaymentVoided "voided_credit_payment_notification"
  , getLegacyDunningInfo LegacyDunningEventNew "new_dunning_event_notification"
  -- it's important legacy comes before the new notification, because legacy has more information
  , getDunningInfo DunningEventNew "new_dunning_event_notification"
  ]

extractAccountCode :: Notification -> Account.Code
extractAccountCode notification = case notification of
  AccountNew a -> a
  AccountUpdated a -> a
  AccountCanceled a -> a
  AccountBillingInfoUpdated a -> a
  AccountBillingInfoUpdateFailed a -> a
  SubscriptionNew a _ -> a
  SubscriptionUpdated a _ -> a
  SubscriptionScheduledUpdate a _ -> a
  SubscriptionCanceled a _ -> a
  SubscriptionExpired a _ -> a
  SubscriptionRenewed a _ -> a
  SubscriptionReactivated a _ -> a
  SubscriptionPaused a _ -> a
  SubscriptionResumed a _ -> a
  SubscriptionScheduledPause a _ -> a
  SubscriptionPauseModified a _ -> a
  SubscriptionPausedRenewal a _ -> a
  SubscriptionPauseCanceled a _ -> a
  InvoiceNewCharge a _ -> a
  InvoiceProcessingCharge a _ -> a
  InvoicePastDueCharge a _ -> a
  InvoicePaidCharge a _ -> a
  InvoiceFailedCharge a _ -> a
  InvoiceReopenedCharge a _ -> a
  InvoiceUpdatedCharge a _ -> a
  InvoiceNewCredit a _ -> a
  InvoiceProcessingCredit a _ -> a
  InvoiceClosedCredit a _ -> a
  InvoiceVoidedCredit a _ -> a
  InvoiceReopenedCredit a _ -> a
  InvoiceOpenCredit a _ -> a
  InvoiceUpdatedCredit a _ -> a
  InvoiceNew a _ -> a
  InvoiceProcessing a _ -> a
  InvoiceClosed a _ -> a
  InvoicePastDue a _ -> a
  PaymentScheduled a _ -> a
  PaymentProcessing a _ -> a
  PaymentSuccessful a _ -> a
  PaymentFailed a _ -> a
  PaymentSuccessfulRefund a _ -> a
  PaymentVoid a _ -> a
  PaymentFraudInfoUpdated a _ -> a
  PaymentTransactionStatusUpdated a _ -> a
  PaymentTransactionAuthorized a _ -> a
  CreditPaymentNew a _ -> a
  CreditPaymentVoided a _ -> a
  LegacyDunningEventNew a _ _ _ -> a
  DunningEventNew a _ _ -> a

getAccountInfo :: (Account.Code -> notif) -> CI Text -> Xml.Document -> Maybe notif
getAccountInfo notif rootName document = notif <$> previewEl getAccountCode rootName document

getSubscriptionInfo
  :: (Account.Code -> Subscription.Uuid -> notif) -> CI Text -> Xml.Document -> Maybe notif
getSubscriptionInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getSubscriptionUuid rootName document

getInvoiceInfo :: (Account.Code -> Invoice.Id -> notif) -> CI Text -> Xml.Document -> Maybe notif
getInvoiceInfo notif rootName document =
  notif <$> previewEl getAccountCode rootName document <*> previewEl getInvoiceId rootName document

getPaymentInfo
  :: (Account.Code -> Transaction.Id -> notif) -> CI Text -> Xml.Document -> Maybe notif
getPaymentInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getTransactionId rootName document

getCreditPaymentInfo
  :: (Account.Code -> CreditPayment.Uuid -> notif) -> CI Text -> Xml.Document -> Maybe notif
getCreditPaymentInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getCreditPaymentUuid rootName document

getLegacyDunningInfo
  :: (Account.Code -> Invoice.Id -> Subscription.Uuid -> Transaction.Id -> notif)
  -> CI Text
  -> Xml.Document
  -> Maybe notif
getLegacyDunningInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getInvoiceId rootName document
    <*> previewEl getSubscriptionUuid rootName document
    <*> previewEl getTransactionId rootName document

getDunningInfo
  :: (Account.Code -> Invoice.Id -> Subscription.Uuid -> notif)
  -> CI Text
  -> Xml.Document
  -> Maybe notif
getDunningInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getInvoiceId rootName document
    <*> previewEl getSubscriptionUuid rootName document

getAccountCode :: CI Text -> Getter Xml.Document Account.Code
getAccountCode rootName = getEl rootName "account" "account_code" (into @Account.Code)

getSubscriptionUuid :: CI Text -> Getter Xml.Document Subscription.Uuid
getSubscriptionUuid rootName = getEl rootName "subscription" "uuid" (into @Subscription.Uuid)

-- Invoices don't have a uuid, not sure why the xml says uuid
getInvoiceId :: CI Text -> Getter Xml.Document Invoice.Id
getInvoiceId rootName = getEl rootName "invoice" "uuid" (into @Invoice.Id)

getTransactionId :: CI Text -> Getter Xml.Document Transaction.Id
getTransactionId rootName = getEl rootName "transaction" "id" (into @Transaction.Id)

getCreditPaymentUuid :: CI Text -> Getter Xml.Document CreditPayment.Uuid
getCreditPaymentUuid rootName = getEl rootName "credit_payment" "uuid" (into @CreditPayment.Uuid)

previewEl :: (CI Text -> Getter Xml.Document a) -> CI Text -> Xml.Document -> Maybe a
previewEl getter = Lens.preview . getter

getEl :: CI Text -> CI Text -> CI Text -> (Text -> a) -> Getter Xml.Document a
getEl rootName subName idName to =
  Lens.root
    . Lens.named rootName
    ... Lens.named subName
    ... Lens.named idName
    . Lens.text
    . Lens.to to

getNotificationType :: LazyByteString.ByteString -> Either WebhookError Notification
getNotificationType body = case Xml.parseLBS Xml.def body of
  Right notificationXml -> case documentToNotification notificationXml of
    Just notificationType -> Right notificationType
    Nothing -> Left . UnknownWebhook $ documentNameToString notificationXml
  Left _ -> Left InvalidXml

getNotificationAccountCode
  :: LazyByteString.ByteString -> Either WebhookError (Account.Code, String)
getNotificationAccountCode body = case Xml.parseLBS Xml.def body of
  Right notificationXml ->
    let rootName = documentNameToString notificationXml
    in
      case previewEl getAccountCode (String.fromString rootName) notificationXml of
        Just accountCode -> Right (accountCode, rootName)
        Nothing -> Left $ NoAccountCode rootName
  Left _ -> Left InvalidXml

documentNameToString :: Xml.Document -> String
documentNameToString = into @String . Xml.nameLocalName . Xml.elementName . Xml.documentRoot

type Getter from to = Lens.Getting (Monoid.First to) from to
