.class public Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants;
.super Ljava/lang/Object;
.source "UpgradeUtilConstants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;,
        Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;,
        Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$UpdateStatus;,
        Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;,
        Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;
    }
.end annotation


# static fields
.field public static final AB_UPGRADE_COMPLETED_INTENT:Ljava/lang/String; = "com.motorola.ccc.ota.AB_UPGRADE_COMPLETED"

.field public static final AB_UPGRADE_RESTART_PENDING:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.AB_UPGRADE_RESTART_PENDING"

.field public static final ACTION_AB_APPLY_PAYLOAD_STARTED_INTENT:Ljava/lang/String; = "com.motorola.ccc.ota.AB_APPLY_PAYLOAD_STARTED"

.field public static final ACTION_AB_APPLY_PAYLOAD_SUSPEND:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_AB_APPLY_PAYLOAD_SUSPEND"

.field public static final ACTION_AB_UPDATE_PROGRESS:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_AB_UPDATE_PROGRESS"

.field public static final ACTION_BATTERY_CHANGED:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.BATTERY_CHANGED"

.field public static final ACTION_BATTERY_LOW:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_BATTERY_LOW"

.field public static final ACTION_DATA_SAVER_DURING_AB_STREAMING:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_DATA_SAVER_DURING_AB_STREAMING"

.field public static final ACTION_DM_CANCEL_ONGOING_UPGRADE:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.ACTION_DM_CANCEL_ONGOING_UPGRADE"

.field public static final ACTION_MODEM_FSG_POLL:Ljava/lang/String; = "com.motorola.modemservice.START_FSG_POLLING"

.field public static final ACTION_MODEM_UPDATE:Ljava/lang/String; = "com.motorola.ccc.ota.MODEM_UPDATE"

.field public static final ACTION_MODEM_UPDATE_STATUS:Ljava/lang/String; = "com.motorola.modemservice.MODEM_UPDATE_STATUS"

.field public static final ACTION_MODEM_UPGRADE_POLL:Ljava/lang/String; = "com.motorola.ccc.ota.modem_upgrade_poll"

.field public static final ACTION_NOTIFICATION_SWIPED:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_NOTIFICATION_SWIPED"

.field public static final ACTION_OTA_DEFERRED:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_OTA_DEFERRED"

.field public static final ACTION_OTA_RESERVE_SPACE_RESPONSE:Ljava/lang/String; = "com.motorola.app.Actions.OTA_RESERVED_SPACE_RESPONSE"

.field public static final ACTION_OVERRIDE_METADATA:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.OVERRIDE_METADATA"

.field public static final ACTION_PAUSE_DOWNLOAD_FOR_CELLULAR:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_PAUSE_DOWNLOAD_FOR_CELLULAR"

.field public static final ACTION_SIM_STATE_CHANGE:Ljava/lang/String; = "android.intent.action.SIM_STATE_CHANGED"

.field public static final ACTION_SMART_UPDATE_CONFIG_CHANGED:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_SMART_UPDATE_CONFIG_CHANGED"

.field public static final ACTION_STOP_OTA_SERVICE:Ljava/lang/String; = "com.motorola.ccc.ota.STOP_OTA_SERVICE"

.field public static final ACTION_UPGRADE_POLL:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade_poll"

.field public static final ACTION_UPGRADE_UPDATE_STATUS:Ljava/lang/String; = "com.motorola.app.action.UPGRADE_UPDATE_STATUS"

.field public static final ACTION_VAB_ALLOCATE_SPACE_RESULT:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_VAB_ALLOCATE_SPACE_RESULT"

.field public static final ACTION_VAB_CLEANUP_APLLIED_PAYLOAD:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_CLEANUP_APLLIED_PAYLOAD"

.field public static final ACTION_VAB_VERIFY_STATUS:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_VAB_VERIFY_STATUS"

.field public static final ACTION_VERIFY_PAYLOAD_STATUS:Ljava/lang/String; = "com.motorola.ccc.ota.ACTION_VERIFY_PAYLOAD_STATUS"

.field public static final ACTIVITY_ANNOY_VALUE_EXPIRY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.ACTIVITY_ANNOY_VALUE_EXPIRY"

.field public static final ALREADY_UP_TO_DATE:Ljava/lang/String; = "com.motorola.ccc.ota.ALREADY_UP_TO_DATE"

.field public static final CANCEL_UPDATE:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.CANCEL_UPDATE"

.field public static final CHAINED_UPDATE_DELAY_TIME:I = 0x384

.field public static final CREATE_RESERVE_SPACE_POST_FIFTEEN_MINUTES:Ljava/lang/String; = "com.motorola.app.CREATE_RESERVE_SPACE_POST_FIFTEEN_MINUTES"

.field public static final DEFAULT_MAX_INSTALL_DEFER_TIME:J = 0x5265c00L

.field public static final DEFAULT_MAX_REBOOT_DEFER_TIME:J = 0x2932e00L

.field public static final DEFAULT_MAX_RETRY_COUNT_DOWNLOAD_PACKAGE:I = 0x9

.field public static final DOWNLOAD:Ljava/lang/String; = "DOWNLOAD_DEFERRED"

.field public static final DOWNLOAD_COMPLETED_TO_SETTINGS:Ljava/lang/String; = "com.motorola.ccc.ota.CusAndroidUtils.DOWNLOAD_COMPLETED"

.field public static final DOWNLOAD_NOTIFIED_TO_SETTINGS:Ljava/lang/String; = "com.motorola.ccc.ota.CusAndroidUtils.DOWNLOAD_NOTIFIED"

.field public static final DOWNLOAD_OPTIONS:I = 0x2

.field public static final DOWNLOAD_PENDING_NOTIFICATION_EXPIRY_DAYS:J = 0xfL

.field public static final FINISH_BG_INSTALL_ACTIVITY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.FINISH_BG_INSTALL_ACTIVITY"

.field public static final FINISH_DOWNLOAD_ACTIVITY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.FINISH_DOWNLOAD_ACTIVITY"

.field public static final FINISH_DOWNLOAD_OPTIONS_FRAGMENT:Ljava/lang/String; = "com.motorola.ccc.ota.ui.finish_download_options_fragment"

.field public static final FINISH_DOWNLOAD_PROGRESS_ACTIVITY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.FINISH_DOWNLOAD_PROGRESS_ACTIVITY"

.field public static final FINISH_INSTALL_ACTIVITY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.FINISH_INSTALL_ACTIVITY"

.field public static final FINISH_MESSAGE_ACTIVITY:Ljava/lang/String; = "com.motorola.ccc.ota.ui.finish_message_activity"

.field public static final FINISH_RESTART_ACTIVITY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.FINISH_RESTART_ACTIVITY"

.field public static final FINISH_WARNING_ALERT_DIALOG:Ljava/lang/String; = "com.motorola.ccc.ota.ui.finish_wad"

.field public static final FORCE_UPGRADE_TIMER_EXPIRY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.FORCE_UPGRADE_TIMER_EXPIRY"

.field public static final FRAGMENT_TYPE:Ljava/lang/String; = "fragment_type"

.field public static final INSTALL:Ljava/lang/String; = "INSTALL_DEFERRED"

.field public static final INTENT_HEALTH_CHECK:Ljava/lang/String; = "com.motorola.com.ccc.ota.healthCheckIntent"

.field public static final KEY_AB_UPGRADE_STATUS_REASON:Ljava/lang/String; = "ab_upgrade_status_reason"

.field public static final KEY_AB_UPGRADE_STATUS_SUCCESS:Ljava/lang/String; = "ab_upgrade_status_success"

.field public static final KEY_ALLOCATE_SPACE_RESULT:Ljava/lang/String; = "com.motorola.ccc.ota.upgrade.allocate_space_result"

.field public static final KEY_ALLOW_ON_ROAMING:Ljava/lang/String; = "KEY_ALLOW_ON_ROAMING"

.field public static final KEY_ANNOY_EXPIRY_TARGET_INTENT:Ljava/lang/String; = "ANNOY_EXPIRY_INTENT"

.field public static final KEY_BOOTSTRAP:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.bootstrap"

.field public static final KEY_BYTES_RECEIVED:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.bytes_received"

.field public static final KEY_BYTES_TOTAL:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.bytes_total"

.field public static final KEY_CHECK_FOR_LOW_BATTERY:Ljava/lang/String; = "com.motorola.ccc.ota.KEY_CHECK_FOR_LOW_BATTERY"

.field public static final KEY_CHECK_RESPONSE_INTENT:Ljava/lang/String; = "com.motorola.blur.service.blur.check_response_intent"

.field public static final KEY_COMPATIBILITY_STATUS:Ljava/lang/String; = "streaming_compatibility_status"

.field public static final KEY_CURRENT_STATE:Ljava/lang/String; = "com.motorola.app.cus.state"

.field public static final KEY_DESTINAION_SHA1:Ljava/lang/String; = "com.motorola.app.destination.sha1"

.field public static final KEY_DESTINAION_VERSION:Ljava/lang/String; = "com.motorola.app.destination.version"

.field public static final KEY_DISCOVERY_TIME:Ljava/lang/String; = "com.motorola.ccc.ota.upgrade.discover_time"

.field public static final KEY_DISPLAY_VERSION:Ljava/lang/String; = "com.motorola.ota.service.upgrade.displayVersion"

.field public static final KEY_DL_PERCENTAGE:Ljava/lang/String; = "com.motorola.ccc.ota.download_percentage"

.field public static final KEY_DOWNLOAD_COMPLETED:Ljava/lang/String; = "sys_update_downloaded_timestamp"

.field public static final KEY_DOWNLOAD_DEFERRED:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.download.deferred"

.field public static final KEY_DOWNLOAD_MODE:Ljava/lang/String; = "com.motorola.ccc.ota.KEY_DOWNLOAD_MODE"

.field public static final KEY_DOWNLOAD_NOTIFIED:Ljava/lang/String; = "sys_update_available_timestamp"

.field public static final KEY_DOWNLOAD_ON_WIFI:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.download.on_wifi"

.field public static final KEY_DOWNLOAD_OPT_CHECK:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.download_opt_check"

.field public static final KEY_DOWNLOAD_REQ_FROM_NOTIFY:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.download_from_notify"

.field public static final KEY_DOWNLOAD_SOURCE:Ljava/lang/String; = "com.motorola.app.download.source"

.field public static final KEY_DOWNLOAD_STATUS:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.download_status"

.field public static final KEY_DOWNLOAD_WIFIONLY:Ljava/lang/String; = "com.motorola.app.download.wifionly"

.field public static final KEY_EXTRA_BOOTLOADER_UNLOCK:Ljava/lang/String; = "com.motorola.ccc.ota.bootloader_unlock"

.field public static final KEY_EXTRA_DEVICE_ROOTED:Ljava/lang/String; = "com.motorola.ccc.ota.device_rooted"

.field public static final KEY_EXTRA_MODEM_UPDATE_STATUS_CODE:Ljava/lang/String; = "errorCode"

.field public static final KEY_EXTRA_MODEM_UPDATE_STATUS_MSG:Ljava/lang/String; = "statusWord"

.field public static final KEY_FILE_LOCATION:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.file_location"

.field public static final KEY_FORCE_INSTALL_TIME:Ljava/lang/String; = "key_force_install_time"

.field public static final KEY_FORCE_UPGRADE_TIME:Ljava/lang/String; = "com.motorola.ccc.ota.force_upgrade_time"

.field public static final KEY_FREE_SPACE_REQUIRED:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.free_space_req"

.field public static final KEY_FULL_SCREEN_REMINDER:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.KEY_FULL_SCREEN_REMINDER"

.field public static final KEY_HISTORY_RELEASE_NOTES:Ljava/lang/String; = "releaseNotes"

.field public static final KEY_HISTORY_SOURCE_VERSION:Ljava/lang/String; = "sourceVersion"

.field public static final KEY_HISTORY_TARGET_VERSION:Ljava/lang/String; = "targetVersion"

.field public static final KEY_HISTORY_UPDATE_TIME:Ljava/lang/String; = "updateTime"

.field public static final KEY_HISTORY_UPDATE_TYPE:Ljava/lang/String; = "updateType"

.field public static final KEY_HISTORY_UPGRADE_NOTES:Ljava/lang/String; = "upgradeNotes"

.field public static final KEY_INSTALLER:Ljava/lang/String; = "com.motorola.app.installer"

.field public static final KEY_INSTALL_MODE:Ljava/lang/String; = "com.motorola.ccc.ota.KEY_INSTALL_MODE"

.field public static final KEY_INTERACTIVE:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.interactive"

.field public static final KEY_INVALID_VALUE:Ljava/lang/String; = "invalid"

.field public static final KEY_LAUNCH_MODE:Ljava/lang/String; = "com.motorola.blur.service.blur.update.launch_mode"

.field public static final KEY_LOCATION_TYPE:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.location_type"

.field public static final KEY_METADATA:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.metadata"

.field public static final KEY_NOTIFICATION_TYPE:Ljava/lang/String; = "NOTIFICATION_TYPE"

.field public static final KEY_ONLY_ON_NETWORK:Ljava/lang/String; = "KEY_ONLY_ON_NETWORK"

.field public static final KEY_OTA_UPDATE_PLANNED:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.ota_update_planned"

.field public static final KEY_PACKAGE_SIZE:Ljava/lang/String; = "com.motorola.ccc.ota.KEY_PACKAGE_SIZE"

.field public static final KEY_PERCENTAGE:Ljava/lang/String; = "com.motorola.ccc.ota.upgrade_percentage"

.field public static final KEY_REASON:Ljava/lang/String; = "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

.field public static final KEY_RELEASE_NOTES:Ljava/lang/String; = "com.motorola.app.release.notes"

.field public static final KEY_REQUESTID:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.requestid"

.field public static final KEY_RESERVE_SPACE_IN_MB:Ljava/lang/String; = "com.motorola.app.KEY_RESERVE_SPACE_IN_MB"

.field public static final KEY_RESPONSE_ACTION:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.response_action"

.field public static final KEY_RESPONSE_FLAVOUR:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.response_flavour"

.field public static final KEY_SDCARD_DOWNLOAD_LOCATION:Ljava/lang/String; = "sdcard"

.field public static final KEY_SERVICE_STARTED_ON_CHK_UPDATE:Ljava/lang/String; = "com.motorola.ccc.ota.SERVICE_STARTED_ON_CHK_UPDATE"

.field public static final KEY_SILENT_OTA:Ljava/lang/String; = "com.motorola.blur.service.upgrade.silentOta"

.field public static final KEY_SMART_UPDATE_ENABLED:Ljava/lang/String; = "com.motorola.ccc.ota.SMART_UPDATE_ENABLED"

.field public static final KEY_SOURCE_SHA1:Ljava/lang/String; = "com.motorola.app.source.sha1"

.field public static final KEY_SU_CANCEL_BY_DM:Ljava/lang/String; = " cancelled by DM"

.field public static final KEY_TIMESTAMP:Ljava/lang/String; = "com.motorola.app.time.stamp"

.field public static final KEY_UPDATE_ACTION_RESPONSE:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.check_error"

.field public static final KEY_UPDATE_FAILURE_COUNT:Ljava/lang/String; = "com.motorola.ccc.ota.upgrade.failure_count"

.field public static final KEY_UPDATE_INFO:Ljava/lang/String; = "com.motorola.app.cus.info"

.field public static final KEY_UPDATE_STATUS:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.update_status"

.field public static final KEY_UPDATE_TYPE:Ljava/lang/String; = "com.motorola.blur.service.upgrade.updateType"

.field public static final KEY_UPGRADE_LAUNCH_PROCEED:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.upgrade_launch_proceed"

.field public static final KEY_UPGRADE_STATUS:Ljava/lang/String; = "com.motorola.ccc.ota.upgrade_status"

.field public static final KEY_VAB_CLEANUP_APPLIED_PAYLOAD:Ljava/lang/String; = "com.motorola.ccc.ota.KEY_VAB_CLEANUP_APPLIED_PAYLOAD"

.field public static final KEY_VAB_VALIDATION_STATUS:Ljava/lang/String; = "com.motorola.ccc.ota.VAB_VALIDATION_STATUS"

.field public static final KEY_VERSION:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.version"

.field public static final KEY_WEBVIEW_BASE_FRAGMENT_STATS:Ljava/lang/String; = "webViewBaseFragmentStats"

.field public static final KEY_WEBVIEW_URL:Ljava/lang/String; = "webViewURL"

.field public static final MERGE_RESTART_UPGRADE:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.MERGE_RESTART_UPGRADE"

.field public static final MOTOROLA_WEBSITE:Ljava/lang/String; = "https://www.motorola.com"

.field public static final MOVE_FOTA_TO_GETTING_DESCRIPTOR:Ljava/lang/String; = "com.motorola.ccc.ota.MOVE_FOTA_TO_GETTING_DESCRIPTOR"

.field public static final NOTIFICATION_ID:Ljava/lang/String; = "notification_id"

.field public static final ONE_DAY_IN_MILLISECONDS:J = 0x5265c00L

.field public static final ONE_HOUR:J = 0x36ee80L

.field public static final OTA_SERVICE_RESTART_ACTION:Ljava/lang/String; = "com.motorola.ccc.ota.Action.OTA_SERVICE_RESTART"

.field public static final OTA_START_ACTION:Ljava/lang/String; = "com.motorola.ccc.ota.START_ACTION"

.field public static final OTA_STOP_ACTION:Ljava/lang/String; = "com.motorola.ccc.ota.STOP_ACTION"

.field public static final OTA_WAITING_FOR_MODEM_UPDATE_STATUS_EXP_DAYS:I = 0x2

.field public static final PROVISION_DEVICE_RESPONSE_INTENT:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.CCE_PROVISION_DEVICE_RESPONSE"

.field public static final REFRESH_CHKUPDATE_UI_ON_SIMCHANGE:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.REFRESH_CHKUPDATE_UI_ON_SIMCHANGE"

.field public static final REGISTER_FORCE_UPGRADE_MANAGER:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.REGISTER_FORCE_UPGRADE_MANAGER"

.field public static final REGISTER_WIFI_DISCOVER_MANAGER:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.REGISTER_WIFI_DISCOVER_MANAGER"

.field public static final RESTART:Ljava/lang/String; = "RESTART_DEFERRED"

.field public static final RESTART_PENDING_NOTIFICATION_EXPIRY_DAYS:J = 0xfL

.field public static final RUN_STATE_MACHINE:Ljava/lang/String; = "com.motorola.ccc.ota.RUN_STATE_MACHINE"

.field public static final SETUP_TOS_ACCEPTED:Ljava/lang/String; = "com.motorola.ccc.cce.SETUP_TOS_ACCEPTED"

.field public static final SIXTY_MINUTES:I = 0x3c

.field public static final SMART_UPDATE_OPTIN:Ljava/lang/String; = "smartupdateOptin"

.field public static final SMART_UPDATE_RANDOM_NUMBER:I = 0x1770

.field public static final SMART_UPDATE_USER_OPTIN:Ljava/lang/String; = "com.motorola.ccc.ota.smart.update.USER_OPTIN"

.field public static final SOFTBANK_APN_NAME:Ljava/lang/String; = "plus.acs.jp.v6"

.field public static final SOFTBANK_PROXY_HOST:Ljava/lang/String; = "dmint.softbank.ne.jp"

.field public static final SOFTBANK_PROXY_PORT:I = 0x1f90

.field public static final START_BACKGROUND_INSTALLATION_FRAGMENT:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.START_BACKGROUND_INSTALLATION_FRAGMENT"

.field public static final START_DOWNLOAD_PROGRESS_FRAGMENT:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.START_DOWNLOAD_PROGRESS_FRAGMENT"

.field public static final START_MERGE_RESTART_ACTIVITY_INTENT:Ljava/lang/String; = "com.motorola.ccc.ota.START_MERGE_RESTART_ACTIVITY_INTENT"

.field public static final START_RESTART_ACTIVITY_INTENT:Ljava/lang/String; = "com.motorola.ccc.ota.START_RESTART_ACTIVITY_INTENT"

.field public static final STATS_TYPE:Ljava/lang/String; = "ota_deferred"

.field public static final SYSTEM_UPDATE_POLICY_POSTPONE_INTERVAL:J = 0x9a7ec800L

.field public static final UNREGISTER_FORCE_UPGRADE_MANAGER:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.UNREGISTER_FORCE_UPGRADE_MANAGER"

.field public static final UNREGISTER_WIFI_DISCOVER_MANAGER:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.UNREGISTER_WIFI_DISCOVER_MANAGER"

.field public static final UPDATE_ERROR_REASON_MAX_LENGTH:I = 0x1770

.field public static final UPGRADE_ACTION_UPDATE_RESPONSE:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_ACTION_UPDATE_RESPONSE"

.field public static final UPGRADE_BACKGROUND_INSTALL_CANCEL_RESPONSE:Ljava/lang/String; = "com.motorola.ccc.ota.UPGRADE_BACKGROUND_INSTALL_CANCEL_RESPONSE"

.field public static final UPGRADE_CHECK_FOR_UPDATE:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE"

.field public static final UPGRADE_CHECK_FOR_UPDATE_RESPONSE:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE_RESPONSE"

.field public static final UPGRADE_DOWNLOAD_NOTIFICATION_RESPONSE:Ljava/lang/String; = "com.motorola.ccc.ota.UPGRADE_DOWNLOAD_NOTIFICATION_RESPONSE"

.field public static final UPGRADE_EXECUTE_UPGRADE:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_EXECUTE_UPGRADE"

.field public static final UPGRADE_INSTALL_NOTIFICATION_AVAILABLE:Ljava/lang/String; = "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE"

.field public static final UPGRADE_INSTALL_NOTIFICATION_AVAILABLE_RESPONSE:Ljava/lang/String; = "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE_RESPONSE"

.field public static final UPGRADE_LAUNCH_UPGRADE:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_LAUNCH_UPGRADE"

.field public static final UPGRADE_RESTART_NOTIFICATION:Ljava/lang/String; = "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

.field public static final UPGRADE_UPDATER_BG_INSTALL_NOTIFICATION_CLEAR:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_BG_INSTALL_NOTIFICATION_CLEAR"

.field public static final UPGRADE_UPDATER_DOWNLOAD_NOTIFICATION_CLEAR:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_DOWNLOAD_NOTIFICATION_CLEAR"

.field public static final UPGRADE_UPDATER_INSTALL_NOTIFICATION_CLEAR:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_INSTALL_NOTIFICATION_CLEAR"

.field public static final UPGRADE_UPDATER_RESTART_NOTIFICATION_CLEAR:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_RESTART_NOTIFICATION_CLEAR"

.field public static final UPGRADE_UPDATER_STATE_CLEAR:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_STATE_CLEAR"

.field public static final UPGRADE_UPDATER_UPDATE_NOTIFICATION_CLEAR:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_UPDATE_NOTIFICATION_CLEAR"

.field public static final UPGRADE_UPDATE_DOWNLOAD_STATUS:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

.field public static final UPGRADE_UPDATE_NOTIFICATION:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION"

.field public static final UPGRADE_UPDATE_NOTIFICATION_AVAILABLE:Ljava/lang/String; = "com.motorola.ccc.ota.UPGRADE_UPDATE_NOTIFICATION_AVAILABLE"

.field public static final UPGRADE_UPDATE_NOTIFICATION_AVAILABLE_RESPONSE:Ljava/lang/String; = "com.motorola.ccc.ota.UPGRADE_UPDATE_NOTIFICATION_AVAILABLE_RESPONSE"

.field public static final UPGRADE_UPDATE_NOTIFICATION_RESPONSE:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

.field public static final UPGRADE_UPDATE_STATUS:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

.field public static final UPGRADE_UPDATE_VERIFY_PAYLOAD_METADATA_DOWNLOAD_STATUS:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_VERIFY_PAYLOAD_METADATA_DOWNLOAD_STATUS"

.field public static final USER_BACKGROUND_INSTALL_RESPONSE:Ljava/lang/String; = "com.motorola.ccc.ota.USER_BACKGROUND_INSTALL_RESPONSE"

.field public static final VAB_MERGE_REBOOT_FAILURE_MAX_COUNT:I = 0x1

.field public static final WAITING_FOR_NETWORK:J = -0x6c1L

.field public static final WARNING_ALERT_DIALOG:I = 0x0

.field public static final WIFI_DISCOVER_TIMER_EXPIRY:Ljava/lang/String; = "com.motorola.ccc.ota.Actions.WIFI_DISCOVER_TIMER_EXPIRY"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
