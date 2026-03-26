.class public final Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "OtaMainBroadcastReceiver.java"


# static fields
.field private static final DB_LOC:Ljava/lang/String; = "cus.db"

.field private static env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field private static mForceUpgradeManager:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

.field private static mOtaWiFiDiscoveryManager:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

.field private static settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private static sm:Lcom/motorola/ccc/ota/CusSM;


# direct methods
.method static bridge synthetic -$$Nest$sfgetsm()Lcom/motorola/ccc/ota/CusSM;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized handleIntent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 25

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string v3, "AndroidClientUpgradeService.handleIntent: "

    const-string v4, "Description: "

    const-string v5, "Download Mode changed. Wifi Only = "

    const-string v6, "AndroidClientUpgradeService.handleIntent "

    const-string v7, "Modem result status errorCode="

    const-string v8, "Received ACTION_CAPTIVE_PORTAL_LOGGED_IN intent, result="

    const-string v9, "AndroidClientUpgradeService.handleIntent: "

    monitor-enter p0

    :try_start_0
    const-string v10, "OtaApp"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    if-nez v9, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v9

    const-string v10, "connectivity"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/ConnectivityManager;

    new-instance v11, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sput-object v11, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance v11, Lcom/motorola/ccc/ota/env/AndroidENV;

    const-string v12, "cus.db"

    sget-object v13, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v11, v12, v9, v13}, Lcom/motorola/ccc/ota/env/AndroidENV;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sput-object v11, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    new-instance v11, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    invoke-direct {v11, v9}, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;-><init>(Landroid/content/Context;)V

    sput-object v11, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->mOtaWiFiDiscoveryManager:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    new-instance v11, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    invoke-direct {v11, v9}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;-><init>(Landroid/content/Context;)V

    sput-object v11, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->mForceUpgradeManager:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    new-instance v9, Lcom/motorola/ccc/ota/CusSM;

    sget-object v11, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    sget-object v12, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v9, v11, v10, v12}, Lcom/motorola/ccc/ota/CusSM;-><init>(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sput-object v9, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/CusSM;->onStart()V

    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.motorola.ccc.ota.START_ACTION"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v9, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.motorola.ccc.ota.STOP_ACTION"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    sget-object v9, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/CusSM;->onDestroy()V

    :cond_2
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.motorola.ccc.ota.STOP_OTA_SERVICE"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    sget-object v9, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/CusSM;->onIntentOtaServiceStop()V

    :cond_3
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    const-string v1, "OtaApp"

    const-string v3, "AndroidClientUpgradeService.handleIntent: %s : bootstrap %s interactive %s id (%s)"

    const-string v4, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE"

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isBootstrap(Landroid/content/Intent;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isInteractive(Landroid/content/Intent;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getRequestId(Landroid/content/Intent;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v4, v5, v6, v7}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isBootstrap(Landroid/content/Intent;)Z

    move-result v3

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getRequestId(Landroid/content/Intent;)I

    move-result v4

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isInteractive(Landroid/content/Intent;)Z

    move-result v2

    invoke-virtual {v1, v3, v4, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentCheckForUpdate(ZIZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    :try_start_2
    const-string v9, "com.motorola.enterprise.asc.ACTION_ASC_SESSION_DONE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const/4 v12, -0x1

    if-nez v9, :cond_49

    const-string v9, "com.motorola.ccc.ota.ACTION_ASC_OTA_INTERNAL_TIMEOUT"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    goto/16 :goto_8

    :cond_5
    const-string v9, "com.motorola.asc.ACTION_ASC_SYSTEM_UPDATE_POLICY_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/CusSM;->isBusy()Z

    move-result v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->onSystemUpdatePolicyChanged(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_6
    :try_start_3
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v13, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    const-string v1, "com.motorola.ccc.ota.KEY_DOWNLOAD_MODE"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->versionFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->responseActionFromIntent(Landroid/content/Intent;)Z

    move-result v5

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->responseFlavourFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v5, v2, v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentUpdateNotificationResponse(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :cond_7
    :try_start_4
    const-string v9, "com.motorola.ccc.ota.UPGRADE_UPDATE_NOTIFICATION_AVAILABLE_RESPONSE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const/4 v13, 0x0

    if-eqz v9, :cond_9

    const-string v1, "com.motorola.blur.service.blur.upgrade.download_from_notify"

    invoke-virtual {v2, v1, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "com.motorola.blur.service.blur.upgrade.KEY_FULL_SCREEN_REMINDER"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_8

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ACTIVITY_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_REQ_FROM_NOTIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_8
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentSystemUpdateNotificationResponse(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-void

    :cond_9
    :try_start_5
    const-string v9, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE_RESPONSE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    const-string v1, "UpdateKey"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "com.motorola.blur.service.blur.upgrade.KEY_FULL_SCREEN_REMINDER"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v3, v1, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentInstallSystemUpdateNotificationResponse(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return-void

    :cond_a
    :try_start_6
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v14, "com.motorola.ccc.ota.UPGRADE_DOWNLOAD_NOTIFICATION_RESPONSE"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    const-string v1, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentDownloadNotificationResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p0

    return-void

    :cond_b
    :try_start_7
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v14, "com.motorola.ccc.ota.UPGRADE_BACKGROUND_INSTALL_CANCEL_RESPONSE"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentBackgroundInstallCancelResponse()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit p0

    return-void

    :cond_c
    :try_start_8
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v14, "com.motorola.ccc.ota.USER_BACKGROUND_INSTALL_RESPONSE"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    const-string v1, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentBackgroundInstallResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    monitor-exit p0

    return-void

    :cond_d
    :try_start_9
    const-string v9, "android.os.action.DEVICE_IDLE_MODE_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentDeviceIdleModeChanged()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    monitor-exit p0

    return-void

    :cond_e
    :try_start_a
    const-string v9, "android.net.conn.RESTRICT_BACKGROUND_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentDeviceDatasaverModeChanged()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    monitor-exit p0

    return-void

    :cond_f
    :try_start_b
    const-string v9, "com.motorola.ccc.ota.Actions.BATTERY_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    const-string v9, "BatteryLow"

    invoke-virtual {v2, v9, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v9

    sget-object v14, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v14, v9}, Lcom/motorola/ccc/ota/CusSM;->onActionBatteryChanged(Z)V

    :cond_10
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v14, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const/4 v14, 0x1

    if-eqz v9, :cond_12

    const-string v1, "com.motorola.ccc.ota.Action.USER_DEFERERD_WIFI_SETUP"

    const-string v3, "whom"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_SETTINGS_DEFFERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_PROMPT_COUNT_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_PROMPT_COUNT_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    add-int/2addr v1, v14

    invoke-virtual {v2, v3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    :cond_11
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->pleaseRunStateMachine()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    monitor-exit p0

    return-void

    :cond_12
    :try_start_c
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.ccc.ota.ACTION_VERIFY_PAYLOAD_STATUS"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    const-string v1, "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.motorola.ccc.ota.upgrade_status"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v4, v1, v3, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentVerifyPayloadStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    monitor-exit p0

    return-void

    :cond_13
    :try_start_d
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.ccc.ota.ACTION_VAB_VERIFY_STATUS"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14

    const-string v1, "com.motorola.ccc.ota.VAB_VALIDATION_STATUS"

    invoke-virtual {v2, v1, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentVABVerifyPayloadStatus(Z)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    monitor-exit p0

    return-void

    :cond_14
    :try_start_e
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.ccc.ota.ACTION_VAB_ALLOCATE_SPACE_RESULT"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15

    const-string v1, "com.motorola.ccc.ota.upgrade.allocate_space_result"

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v3, v1, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentAllocateSpaceResult(J)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    monitor-exit p0

    return-void

    :cond_15
    :try_start_f
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.app.CREATE_RESERVE_SPACE_POST_FIFTEEN_MINUTES"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_16

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->createReserveSpace()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    monitor-exit p0

    return-void

    :cond_16
    :try_start_10
    const-string v9, "com.motorola.ccc.ota.ACTION_CLEANUP_APLLIED_PAYLOAD"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_17

    const-string v1, "com.motorola.ccc.ota.KEY_VAB_CLEANUP_APPLIED_PAYLOAD"

    invoke-virtual {v2, v1, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentVABCleanupAppliedPayload(I)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    monitor-exit p0

    return-void

    :cond_17
    :try_start_11
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.blur.service.blur.Actions.UPGRADE_LAUNCH_UPGRADE"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_18

    const-string v1, "com.motorola.ccc.ota.KEY_CHECK_FOR_LOW_BATTERY"

    invoke-virtual {v2, v1, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "com.motorola.ccc.ota.KEY_INSTALL_MODE"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->versionFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v5

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->proceedFromIntent(Landroid/content/Intent;)Z

    move-result v2

    invoke-virtual {v4, v5, v2, v1, v3}, Lcom/motorola/ccc/ota/CusSM;->onIntentLaunchUpgrade(Ljava/lang/String;ZZLjava/lang/String;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    monitor-exit p0

    return-void

    :cond_18
    :try_start_12
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_48

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "android.intent.action.REBOOT"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_19

    goto/16 :goto_7

    :cond_19
    const-string v9, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a

    sget-object v9, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isSimLoaded(Landroid/content/Intent;)Z

    move-result v15

    invoke-virtual {v9, v15}, Lcom/motorola/ccc/ota/CusSM;->onSimStateChanged(Z)V

    :cond_1a
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.ccc.ota.pm.POLLINGMGR_CONNECTIVITY"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1c

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->isRadioUp(Landroid/content/Intent;)Z

    move-result v9

    if-eqz v9, :cond_1b

    sget-object v9, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/CusSM;->onRadioUp()V

    goto :goto_0

    :cond_1b
    sget-object v9, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/CusSM;->onRadioDown()V

    :cond_1c
    :goto_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.ccc.ota.pm.POLLINGMGR_ROAMING_CHANGE"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1e

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->isRoaming(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_1d

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onRoaming()V

    goto :goto_1

    :cond_1d
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onNotRoaming()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :cond_1e
    :try_start_13
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.ccc.ota.CusAndroidUtils.INTERNAL_NOTIFICATION"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1f

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->versionFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->typeFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->resultFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v4, v2}, Lcom/motorola/ccc/ota/CusSM;->onInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    monitor-exit p0

    return-void

    :cond_1f
    :try_start_14
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "com.motorola.ccc.ota.CusAndroidUtils.START_DOWNLOAD_NOTIFICATION"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_20

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->versionFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/CusSM;->onStartDownloadNotification(Ljava/lang/String;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    monitor-exit p0

    return-void

    :cond_20
    :try_start_15
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v15, "android.net.netmon.captive_portal_logged_in"

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_21

    const-string v1, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "result"

    invoke-virtual {v2, v4, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onRadioUp()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    monitor-exit p0

    return-void

    :cond_21
    :try_start_16
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    const-string v9, "com.motorola.app.Actions.GET_OTA_RESERVED_SPACE"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_22

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->sendAvailableReserveSpace()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    monitor-exit p0

    return-void

    :cond_22
    :try_start_17
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    const-string v9, "com.motorola.ccc.ota.CusAndroidUtils.ACTION_GET_DESCRIPTOR"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_23

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->versionFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->reportStatusFromIntent(Landroid/content/Intent;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getReasonFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v4, v2}, Lcom/motorola/ccc/ota/CusSM;->onActionGetDescriptor(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    monitor-exit p0

    return-void

    :cond_23
    :try_start_18
    const-string v8, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_24

    const-string v2, "OtaApp"

    const-string v3, "locale changed: Refresh Ota notification if available"

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->refreshOtaNotifications(Landroid/content/Context;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    monitor-exit p0

    return-void

    :cond_24
    :try_start_19
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    const-string v9, "com.motorola.blur.service.blur.cUsPollingService.pollingManagerIntent"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const/4 v9, 0x2

    if-eqz v8, :cond_25

    const-string v8, "OtaApp"

    const-string v15, "CusPollingService interval expired, doing check for upgrade"

    invoke-static {v8, v15}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v8, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v8, v13, v9, v13}, Lcom/motorola/ccc/ota/CusSM;->onPollingExpiryNotification(ZIZ)V

    :cond_25
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    const-string v15, "com.motorola.ccc.ota.ModemPollingManager.pollingManagerIntent"

    invoke-virtual {v8, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_26

    const-string v8, "OtaApp"

    const-string v15, "ModemPollingManager service interval expired, doing check for modem upgrade"

    invoke-static {v8, v15}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v8, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v8, v13, v13}, Lcom/motorola/ccc/ota/CusSM;->onModemPollingExpiryNotification(ZZ)V

    :cond_26
    const-string v8, "com.motorola.modemservice.START_FSG_POLLING"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_27

    const-string v8, "OtaApp"

    const-string v15, "Received com.motorola.modemservice.START_FSG_POLLING intent from modem app to trigger polling, so sending poll check request to check modem update"

    invoke-static {v8, v15}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v8, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v8, v15, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    sget-object v8, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_MODEM_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/32 v9, 0x5265c00

    invoke-virtual {v8, v15, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v8, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v10, 0x7

    invoke-virtual {v8, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->scheduleModemWorkManager(Landroid/content/Context;)V

    sget-object v8, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v8, v13, v13}, Lcom/motorola/ccc/ota/CusSM;->onModemPollingExpiryNotification(ZZ)V

    :cond_27
    const-string v8, "com.motorola.modemservice.MODEM_UPDATE_STATUS"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_28

    const-string v8, "statusWord"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "errorCode"

    invoke-virtual {v2, v9, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    const-string v10, "OtaApp"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v12, " : status msg = "

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v10, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v7, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v7, v9, v8}, Lcom/motorola/ccc/ota/CusSM;->onModemUpdateStatusResult(ILjava/lang/String;)V

    :cond_28
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.motorola.com.ccc.ota.healthCheckIntent"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_29

    sget-object v7, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/CusSM;->timeForAHealthCheckUp()V

    :cond_29
    const-string v7, "com.motorola.ccc.ota.ACTION_SMART_UPDATE_CONFIG_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2a

    const-string v1, "com.motorola.ccc.ota.SMART_UPDATE_ENABLED"

    invoke-virtual {v2, v1, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentSmartUpdateConfigChanged(Z)V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    monitor-exit p0

    return-void

    :cond_2a
    :try_start_1a
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.motorola.android.fota.FOTA_REQUEST_UPDATE_RESPONSE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2b

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIdFromIntent(Landroid/content/Intent;)J

    move-result-wide v3

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getErrorFromIntent(Landroid/content/Intent;)I

    move-result v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v3, v4, v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentFotaRequestUpdateResponse(JI)V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_0

    monitor-exit p0

    return-void

    :cond_2b
    :try_start_1b
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2d

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIdFromIntent(Landroid/content/Intent;)J

    move-result-wide v17

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getSizeFromIntent(Landroid/content/Intent;)J

    move-result-wide v7

    const-string v1, "com.motorola.android.fota.fotainterface.WIFI_ONLY_PACKAGE"

    invoke-virtual {v2, v1, v14}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v24

    const-wide/16 v9, -0x1

    cmp-long v1, v7, v9

    if-nez v1, :cond_2c

    const-string v1, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " no size for action setting default"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v5, 0x400

    goto :goto_2

    :cond_2c
    move-wide v5, v7

    :goto_2
    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getDDDescriptionFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIsForcedFromIntent(Landroid/content/Intent;)Z

    move-result v3

    const-string v7, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_UPDATE_TYPE"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v7, "OtaApp"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, " Forced: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, " Size: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, "Update type: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v16, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    move-wide/from16 v19, v5

    move-object/from16 v21, v1

    move/from16 v22, v3

    move-object/from16 v23, v2

    invoke-virtual/range {v16 .. v24}, Lcom/motorola/ccc/ota/CusSM;->onIntentFotaUpdateAvailable(JJLjava/lang/String;ZLjava/lang/String;Z)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_0

    monitor-exit p0

    return-void

    :cond_2d
    :try_start_1c
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v6, "com.motorola.android.fota.FOTA_DOWNLOAD_MODE_CHANGED"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2f

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIdFromIntent(Landroid/content/Intent;)J

    move-result-wide v6

    const-string v4, "com.motorola.android.fota.fotainterface.WIFI_ONLY_PACKAGE"

    invoke-virtual {v2, v4, v14}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    const-string v8, "OtaApp"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v5

    if-eqz v5, :cond_2e

    sget-object v5, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v5, v6, v7, v4}, Lcom/motorola/ccc/ota/CusSM;->onIntentFotaDownloadModeChanged(JZ)V

    goto :goto_3

    :cond_2e
    sget-object v4, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/CusSM;->onIntentFotaDownloadModeChanged()V

    :cond_2f
    :goto_3
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.motorola.ccc.ota.MOVE_FOTA_TO_GETTING_DESCRIPTOR"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->moveFotaToGettingDescriptorState()V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_0

    monitor-exit p0

    return-void

    :cond_30
    :try_start_1d
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.motorola.android.fota.FOTA_USER_ALERT_CELLULAR_OPT"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->showPopupToOptCellularDataAtt(Landroid/content/Context;)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_0

    monitor-exit p0

    return-void

    :cond_31
    :try_start_1e
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.motorola.android.fota.FOTA_DOWNLOAD_COMPLETE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_32

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIdFromIntent(Landroid/content/Intent;)J

    move-result-wide v3

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getErrorFromIntent(Landroid/content/Intent;)I

    move-result v1

    const-string v5, "com.motorola.android.fotaInterface.DL_PACKAGE_PATH"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v5, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v5, v3, v4, v1, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentFotaDownloadCompleted(JILjava/lang/String;)V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_0

    monitor-exit p0

    return-void

    :cond_32
    :try_start_1f
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.motorola.android.fota.FOTA_SERVER_TRANSPORT_MEDIA"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    const-string v1, "com.motorola.android.fota.fotainterface.EXTRA_SERVER_TRANSPORT_MEDIA"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVER_FOTA_TRANSPORTMEDIA_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_0

    monitor-exit p0

    return-void

    :cond_33
    :try_start_20
    const-string v4, "com.motorola.ccc.ota.Actions.REGISTER_WIFI_DISCOVER_MANAGER"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getDiscoverTime(Landroid/content/Intent;)I

    move-result v1

    const-string v3, "KEY_ONLY_ON_NETWORK"

    invoke-virtual {v2, v3, v14}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    const-string v4, "KEY_ALLOW_ON_ROAMING"

    invoke-virtual {v2, v4, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    sget-object v4, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->mOtaWiFiDiscoveryManager:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    invoke-virtual {v4, v1, v3, v2}, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;->init(IZZ)V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_0

    monitor-exit p0

    return-void

    :cond_34
    :try_start_21
    const-string v4, "com.motorola.ccc.ota.Actions.UNREGISTER_WIFI_DISCOVER_MANAGER"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_35

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->mOtaWiFiDiscoveryManager:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;->onDestroy()V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_0

    monitor-exit p0

    return-void

    :cond_35
    :try_start_22
    const-string v4, "com.motorola.ccc.ota.WiFiDiscoveryManager.pollingManagerIntent"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_47

    const-string v4, "com.motorola.ccc.ota.Actions.WIFI_DISCOVER_TIMER_EXPIRY"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_36

    goto/16 :goto_6

    :cond_36
    const-string v4, "com.motorola.ccc.ota.Actions.REGISTER_FORCE_UPGRADE_MANAGER"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_37

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getForceUpgradeTime(Landroid/content/Intent;)I

    move-result v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->mForceUpgradeManager:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->init(I)V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_0

    monitor-exit p0

    return-void

    :cond_37
    :try_start_23
    const-string v4, "com.motorola.ccc.ota.Actions.UNREGISTER_FORCE_UPGRADE_MANAGER"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->mForceUpgradeManager:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->onDestroy()V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_0

    monitor-exit p0

    return-void

    :cond_38
    :try_start_24
    const-string v4, "com.motorola.ccc.ota.ForceUpgradeManager.pollingManagerIntent"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_46

    const-string v4, "com.motorola.ccc.ota.Actions.FORCE_UPGRADE_TIMER_EXPIRY"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_39

    goto/16 :goto_5

    :cond_39
    const-string v4, "android.provider.Telephony.SECRET_CODE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3b

    const-string v1, "OtaApp"

    const-string v3, "Triggering a Polling Initiated Check for Update on keypress"

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "66336"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3a

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1, v13, v13}, Lcom/motorola/ccc/ota/CusSM;->onModemPollingExpiryNotification(ZZ)V

    goto :goto_4

    :cond_3a
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/4 v2, 0x2

    invoke-virtual {v1, v13, v2, v13}, Lcom/motorola/ccc/ota/CusSM;->onPollingExpiryNotification(ZIZ)V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_0

    :goto_4
    monitor-exit p0

    return-void

    :cond_3b
    :try_start_25
    const-string v4, "com.motorola.ccc.ota.Actions.CloudPicker"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    invoke-static {}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isDogfoodDevice()Z

    move-result v4

    if-eqz v4, :cond_3c

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-class v3, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_0

    monitor-exit p0

    return-void

    :cond_3c
    :try_start_26
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.motorola.ccc.ota.AB_UPGRADE_COMPLETED"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3d

    const-string v1, "ab_upgrade_status_success"

    invoke-virtual {v2, v1, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "ab_upgrade_status_reason"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v4, v1, v3, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentABApplyingPatchCompleted(ZLjava/lang/String;Ljava/lang/String;)V
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_0

    monitor-exit p0

    return-void

    :cond_3d
    :try_start_27
    const-string v4, "android.app.action.SYSTEM_UPDATE_POLICY_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3f

    const-string v4, "STANDALONE"

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getAscVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_0

    if-eqz v4, :cond_3e

    monitor-exit p0

    return-void

    :cond_3e
    :try_start_28
    new-instance v4, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v4}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    sget-object v5, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/CusSM;->isBusy()Z

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->onSystemUpdatePolicyChanged(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    :cond_3f
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.motorola.ccc.ota.Actions.ACTION_DM_CANCEL_ONGOING_UPGRADE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_41

    const-string v4, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopBGInstallActivity(Landroid/content/Context;)V

    :cond_40
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    const-string v3, "UpdateType"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/CusSM;->onIntentDmCancelUpgrade(Ljava/lang/String;)V
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_0

    monitor-exit p0

    return-void

    :cond_41
    :try_start_29
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.motorola.cce.Actions.CCE_SETTINGS_UPDATED"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/env/CceSyncSettingsHandler;->fetchSettingsList(Landroid/content/Context;)V
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_0

    monitor-exit p0

    return-void

    :cond_42
    :try_start_2a
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v3, "com.motorola.cce.Actions.CCE_SEND_SETTINGS_RESPONSE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_43

    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v2, v1, v3}, Lcom/motorola/ccc/ota/env/CceSyncSettingsHandler;->onReceiveSettingsList(Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_0

    monitor-exit p0

    return-void

    :cond_43
    :try_start_2b
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v3, "com.motorola.ccc.ota.Actions.CANCEL_UPDATE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    const-string v1, "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "com.motorola.ccc.ota.upgrade_status"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    aput-object v1, v5, v13

    aput-object v3, v5, v14

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    :cond_44
    const-string v1, "com.motorola.ccc.ota.Actions.OVERRIDE_METADATA"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_45

    const-string v1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_0

    :cond_45
    monitor-exit p0

    return-void

    :cond_46
    :goto_5
    :try_start_2c
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentForceUpgradeTimerExpiry()V
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_0

    monitor-exit p0

    return-void

    :cond_47
    :goto_6
    :try_start_2d
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onIntentWiFiDiscoverTimerExpiry()V
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_0

    monitor-exit p0

    return-void

    :cond_48
    :goto_7
    :try_start_2e
    sget-object v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/CusSM;->onDeviceShutdown()V
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_0

    monitor-exit p0

    return-void

    :cond_49
    :goto_8
    :try_start_2f
    const-string v1, "EXTRA_ASC_RESULT"

    invoke-virtual {v2, v1, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "TRANSACTION_ID"

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    sget-object v4, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object v5, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v4, v1, v2, v3, v5}, Lcom/motorola/ccc/ota/CusSM;->onIntentASCSessionDone(IJLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    move-object v1, v0

    monitor-exit p0

    throw v1
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;-><init>(Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;Landroid/content/Intent;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method
