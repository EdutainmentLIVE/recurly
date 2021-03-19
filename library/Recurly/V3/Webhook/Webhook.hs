module Recurly.V3.Webhook.Webhook where

import Recurlude

import qualified Control.Lens as Lens
import qualified Data.ByteString.Lazy as LazyByteString
import Data.CaseInsensitive (CI)
import qualified Data.Foldable as Foldable
import qualified Data.Monoid as Monoid
import qualified Data.String as String
import qualified Data.Text as Text
import qualified Text.XML as Xml
import qualified Text.XML.Lens as Lens
import Text.XML.Lens ((...))

import qualified Recurly.V3.API.Types as Types

data WebhookError
  = InvalidXml
  | NoAccountCode String -- ^ root xml node name
  | UnknownWebhook String -- ^ root xml node name
  deriving (Eq, Show)

instance Exception WebhookError

data Notification
  = AccountNew Types.AccountCode
  | AccountUpdated Types.AccountCode
  | AccountCanceled Types.AccountCode
  | AccountBillingInfoUpdated Types.AccountCode
  | AccountBillingInfoUpdateFailed Types.AccountCode
  | SubscriptionNew Types.AccountCode Types.SubscriptionUuid
  | SubscriptionUpdated Types.AccountCode Types.SubscriptionUuid
  | SubscriptionCanceled Types.AccountCode Types.SubscriptionUuid
  | SubscriptionExpired Types.AccountCode Types.SubscriptionUuid
  | SubscriptionRenewed Types.AccountCode Types.SubscriptionUuid
  | SubscriptionReactivated Types.AccountCode Types.SubscriptionUuid
  | SubscriptionPaused Types.AccountCode Types.SubscriptionUuid
  | SubscriptionResumed Types.AccountCode Types.SubscriptionUuid
  | SubscriptionScheduledPause Types.AccountCode Types.SubscriptionUuid
  | SubscriptionPauseModified Types.AccountCode Types.SubscriptionUuid
  | SubscriptionPausedRenewal Types.AccountCode Types.SubscriptionUuid
  | SubscriptionPauseCanceled Types.AccountCode Types.SubscriptionUuid
  | InvoiceNewCharge Types.AccountCode Types.InvoiceId
  | InvoiceProcessingCharge Types.AccountCode Types.InvoiceId
  | InvoicePastDueCharge Types.AccountCode Types.InvoiceId
  | InvoicePaidCharge Types.AccountCode Types.InvoiceId
  | InvoiceFailedCharge Types.AccountCode Types.InvoiceId
  | InvoiceReopenedCharge Types.AccountCode Types.InvoiceId
  | InvoiceUpdatedCharge Types.AccountCode Types.InvoiceId
  | InvoiceNewCredit Types.AccountCode Types.InvoiceId
  | InvoiceProcessingCredit Types.AccountCode Types.InvoiceId
  | InvoiceClosedCredit Types.AccountCode Types.InvoiceId
  | InvoiceVoidedCredit Types.AccountCode Types.InvoiceId
  | InvoiceReopenedCredit Types.AccountCode Types.InvoiceId
  | InvoiceOpenCredit Types.AccountCode Types.InvoiceId
  | InvoiceUpdatedCredit Types.AccountCode Types.InvoiceId
  | InvoiceNew Types.AccountCode Types.InvoiceId
  | InvoiceProcessing Types.AccountCode Types.InvoiceId
  | InvoiceClosed Types.AccountCode Types.InvoiceId
  | InvoicePastDue Types.AccountCode Types.InvoiceId
  | PaymentScheduled Types.AccountCode Types.TransactionId
  | PaymentProcessing Types.AccountCode Types.TransactionId
  | PaymentSuccessful Types.AccountCode Types.TransactionId
  | PaymentFailed Types.AccountCode Types.TransactionId
  | PaymentSuccessfulRefund Types.AccountCode Types.TransactionId
  | PaymentVoid Types.AccountCode Types.TransactionId
  | PaymentFraudInfoUpdated Types.AccountCode Types.TransactionId
  | PaymentTransactionStatusUpdated Types.AccountCode Types.TransactionId
  | PaymentTransactionAuthorized Types.AccountCode Types.TransactionId
  | CreditPaymentNew Types.AccountCode Types.CreditPaymentUuid
  | CreditPaymentVoided Types.AccountCode Types.CreditPaymentUuid
  | LegacyDunningEventNew Types.AccountCode Types.InvoiceId Types.SubscriptionUuid Types.TransactionId
  | DunningEventNew Types.AccountCode Types.InvoiceId Types.SubscriptionUuid
  deriving (Eq, Show)

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

getAccountInfo :: (Types.AccountCode -> notif) -> CI Text -> Xml.Document -> Maybe notif
getAccountInfo notif rootName document = notif <$> previewEl getAccountCode rootName document

getSubscriptionInfo
  :: (Types.AccountCode -> Types.SubscriptionUuid -> notif)
  -> CI Text
  -> Xml.Document
  -> Maybe notif
getSubscriptionInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getSubscriptionUuid rootName document

getInvoiceInfo
  :: (Types.AccountCode -> Types.InvoiceId -> notif) -> CI Text -> Xml.Document -> Maybe notif
getInvoiceInfo notif rootName document =
  notif <$> previewEl getAccountCode rootName document <*> previewEl getInvoiceId rootName document

getPaymentInfo
  :: (Types.AccountCode -> Types.TransactionId -> notif) -> CI Text -> Xml.Document -> Maybe notif
getPaymentInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getTransactionId rootName document

getCreditPaymentInfo
  :: (Types.AccountCode -> Types.CreditPaymentUuid -> notif)
  -> CI Text
  -> Xml.Document
  -> Maybe notif
getCreditPaymentInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getCreditPaymentUuid rootName document

getLegacyDunningInfo
  :: ( Types.AccountCode
     -> Types.InvoiceId
     -> Types.SubscriptionUuid
     -> Types.TransactionId
     -> notif
     )
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
  :: (Types.AccountCode -> Types.InvoiceId -> Types.SubscriptionUuid -> notif)
  -> CI Text
  -> Xml.Document
  -> Maybe notif
getDunningInfo notif rootName document =
  notif
    <$> previewEl getAccountCode rootName document
    <*> previewEl getInvoiceId rootName document
    <*> previewEl getSubscriptionUuid rootName document

getAccountCode :: CI Text -> Getter Xml.Document Types.AccountCode
getAccountCode rootName = getEl rootName "account" "account_code" Types.textToAccountCode

getSubscriptionUuid :: CI Text -> Getter Xml.Document Types.SubscriptionUuid
getSubscriptionUuid rootName = getEl rootName "subscription" "uuid" Types.textToSubscriptionUuid

-- Invoices don't have a uuid, not sure why the xml says uuid
getInvoiceId :: CI Text -> Getter Xml.Document Types.InvoiceId
getInvoiceId rootName = getEl rootName "invoice" "uuid" Types.textToInvoiceId

getTransactionId :: CI Text -> Getter Xml.Document Types.TransactionId
getTransactionId rootName = getEl rootName "transaction" "id" Types.textToTransactionId

getCreditPaymentUuid :: CI Text -> Getter Xml.Document Types.CreditPaymentUuid
getCreditPaymentUuid rootName =
  getEl rootName "credit_payment" "uuid" Types.textToCreditPaymentUuid

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
  :: LazyByteString.ByteString -> Either WebhookError (Types.AccountCode, String)
getNotificationAccountCode body = case Xml.parseLBS Xml.def body of
  Right notificationXml ->
    let rootName = documentNameToString notificationXml
    in
      case previewEl getAccountCode (String.fromString rootName) notificationXml of
        Just accountCode -> Right (accountCode, rootName)
        Nothing -> Left $ NoAccountCode rootName
  Left _ -> Left InvalidXml

documentNameToString :: Xml.Document -> String
documentNameToString = Text.unpack . Xml.nameLocalName . Xml.elementName . Xml.documentRoot

type Getter from to = Lens.Getting (Monoid.First to) from to
