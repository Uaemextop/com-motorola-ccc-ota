.class public Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;
.super Ljava/lang/Object;
.source "UpgradeUtilMethods.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final cancelBGInstallNotification(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_BG_INSTALL_NOTIFICATION_CLEAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final cancelDownloadNotification(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_DOWNLOAD_NOTIFICATION_CLEAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static cancelOta(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.CANCEL_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.ccc.ota.upgrade_status"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static cancelRestartNotification(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_RESTART_NOTIFICATION_CLEAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final cancelUpdateNotification(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_UPDATE_NOTIFICATION_CLEAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final deferredFromIntent(Landroid/content/Intent;)I
    .locals 2

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "com.motorola.blur.service.blur.upgrade.download.deferred"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_0
    return v1
.end method

.method public static final downloadOnWifiFromIntent(Landroid/content/Intent;)Z
    .locals 2

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "com.motorola.blur.service.blur.upgrade.download.on_wifi"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_0
    return v1
.end method

.method public static final downloadStatusFromIntent(Landroid/content/Intent;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;
    .locals 2

    const-string v0, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final errorFromIntent(Landroid/content/Intent;)Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE_RESPONSE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.motorola.blur.service.blur.upgrade.check_error"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    move-result-object p0

    return-object p0
.end method

.method private static getAllocateFreeSpaceIntent(Ljava/lang/String;J)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.free_space_req"

    invoke-virtual {v0, p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    return-object v0
.end method

.method public static final getDiscoverTime(Landroid/content/Intent;)I
    .locals 3

    const-string v0, "com.motorola.ccc.ota.upgrade.discover_time"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public static final getForceUpgradeTime(Landroid/content/Intent;)I
    .locals 3

    const-string v0, "com.motorola.ccc.ota.force_upgrade_time"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public static final getFreeSpaceFromIntent(Landroid/content/Intent;)J
    .locals 3

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "com.motorola.blur.service.blur.upgrade.free_space_req"

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "freeSpace = "

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v2, "OtaApp"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v0

    :cond_0
    return-wide v1
.end method

.method public static final getRequestId(Landroid/content/Intent;)I
    .locals 2

    const-string v0, "com.motorola.blur.service.blur.upgrade.requestid"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getStartRestartActivityIntent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.START_RESTART_ACTIVITY_INTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "CheckForMap"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method public static getStatusVerifyResult(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "no signature in file (no footer)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    move-object p0, v0

    goto :goto_1

    :cond_0
    const-string v0, "no signature in file (bad footer)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "EOCD marker found after start of EOCD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "EOCD marker found after start of EOCD(Signature info improper)"

    goto :goto_1

    :cond_2
    const-string v0, "signedData is null"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    :cond_3
    const-string v0, "encCerts is empty"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p0, "encCerts is empty(encoded certificate in signature is empty)"

    goto :goto_1

    :cond_4
    const-string v0, "signature contains no certificates"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_0

    :cond_5
    const-string v0, "no signer infos!"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string p0, "no signer infos!(no signer infos in encoded certificates)"

    goto :goto_1

    :cond_6
    const-string v0, "signature doesn\'t match any trusted key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_0

    :cond_7
    const-string v0, "verification was interrupted"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_0

    :cond_8
    const-string v0, "signature digest verification failed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    goto :goto_0

    :cond_9
    :goto_1
    return-object p0
.end method

.method public static getUpdateDownloadStatusIntent(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.bytes_received"

    invoke-virtual {v0, p0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.bytes_total"

    invoke-virtual {v0, p0, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.file_location"

    invoke-virtual {v0, p0, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, p0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.download.deferred"

    invoke-virtual {v0, p0, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.download.on_wifi"

    invoke-virtual {v0, p0, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "CheckForMap"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method public static getUpdateNotificationIntent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.download_opt_check"

    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method public static getUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/String;)Landroid/content/Intent;
    .locals 1

    new-instance p0, Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_LAUNCH_UPGRADE"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.upgrade_launch_proceed"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.KEY_INSTALL_MODE"

    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.KEY_CHECK_FOR_LOW_BATTERY"

    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object p0
.end method

.method public static informPendingRebootInfo(Landroid/content/Context;J)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.upgrade.AB_UPGRADE_RESTART_PENDING"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "key_force_install_time"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final isBootstrap(Landroid/content/Intent;)Z
    .locals 2

    const-string v0, "com.motorola.blur.service.blur.upgrade.bootstrap"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static final isInteractive(Landroid/content/Intent;)Z
    .locals 2

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getRequestId(Landroid/content/Intent;)I

    move-result v0

    const-string v1, "com.motorola.blur.service.blur.upgrade.interactive"

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static isSystemUser(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "user"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/UserManager;

    invoke-virtual {p0}, Landroid/os/UserManager;->isSystemUser()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const-string p0, "OtaApp"

    const-string v0, "UpdgradeUtilMethods:not a system user"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static final locationTypeFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    const-string v0, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static moveFotaToGettingDescriptorState(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.MOVE_FOTA_TO_GETTING_DESCRIPTOR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final proceedFromIntent(Landroid/content/Intent;)Z
    .locals 2

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_LAUNCH_UPGRADE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v0, "com.motorola.blur.service.blur.upgrade.upgrade_launch_proceed"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static final receivedBytesFromIntent(Landroid/content/Intent;)J
    .locals 3

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    const-string v0, "com.motorola.blur.service.blur.upgrade.bytes_received"

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0

    :cond_0
    return-wide v1
.end method

.method public static final registerWithForceUpgradeManager(Landroid/content/Context;J)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.REGISTER_FORCE_UPGRADE_MANAGER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.force_upgrade_time"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final registerWithWiFiDiscoveryManager(Landroid/content/Context;JZZ)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.REGISTER_WIFI_DISCOVER_MANAGER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.upgrade.discover_time"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "KEY_ONLY_ON_NETWORK"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "KEY_ALLOW_ON_ROAMING"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final responseActionFromIntent(Landroid/content/Intent;)Z
    .locals 2

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v0, "com.motorola.blur.service.blur.upgrade.response_action"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static final responseFlavourFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.motorola.blur.service.blur.upgrade.response_flavour"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static scheduleModemPolling()V
    .locals 4

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getMCFGConfigVersion()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x7

    invoke-virtual {v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-gt v1, v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendModemPollIntent(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->shutdownModemPolling()V

    :cond_1
    :goto_0
    return-void
.end method

.method public static sendActionAllocateSpaceResult(Landroid/content/Context;J)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_VAB_ALLOCATE_SPACE_RESULT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.upgrade.allocate_space_result"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendActionBatteryLow()V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_BATTERY_LOW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendActionDataSaverDuringABStreaming()V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_DATA_SAVER_DURING_AB_STREAMING"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendActionMetadataOverride(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.OVERRIDE_METADATA"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final sendActionUpdateResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_ACTION_UPDATE_RESPONSE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.check_error"

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.requestid"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.bootstrap"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_VERIFY_PAYLOAD_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {p2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.upgrade_status"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendActionVerifyPayloadStatus(Landroid/content/Context;Z)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_VAB_VERIFY_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.VAB_VALIDATION_STATUS"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private static sendAllocateFreeSpaceIntent(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;J)V
    .locals 0

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getAllocateFreeSpaceIntent(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendCheckForUpdate(Landroid/content/Context;ZI)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.bootstrap"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.requestid"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.interactive"

    const/4 p2, 0x0

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendCheckForUpdate(Landroid/content/Context;ZIZ)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.bootstrap"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.requestid"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.interactive"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendCheckForUpdateResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE_RESPONSE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.check_error"

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.requestid"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.bootstrap"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_NOTICE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result p1

    const-string p2, "com.motorola.blur.service.blur.upgrade.ota_update_planned"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static sendCleanupAppliedPayloadResult(Landroid/content/Context;I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sendCleanupAppliedPayloadResult : cleanupAppliedPayload="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_CLEANUP_APLLIED_PAYLOAD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.KEY_VAB_CLEANUP_APPLIED_PAYLOAD"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final sendDiscoverTimerExpiryIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.WIFI_DISCOVER_TIMER_EXPIRY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendDownloadCompletedToSettings(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.CusAndroidUtils.DOWNLOAD_COMPLETED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "sys_update_downloaded_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "OtaApp"

    const-string v2, "sendDownloadCompletedToSettings"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendDownloadNotificationResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.ccc.ota.UPGRADE_DOWNLOAD_NOTIFICATION_RESPONSE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendDownloadNotifiedToSettings(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.CusAndroidUtils.DOWNLOAD_NOTIFIED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "sys_update_available_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "OtaApp"

    const-string v2, "sendDownloadNotifiedToSettings"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendForceUpgradeTimerExpiryIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.FORCE_UPGRADE_TIMER_EXPIRY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendInstallSystemUpdateAvailableNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendMergeRestartIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.MERGE_RESTART_UPGRADE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendModemPollIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.modem_upgrade_poll"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final sendOtaServiceStopIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.STOP_OTA_SERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final sendPollIntent(Landroid/content/Context;)V
    .locals 0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->scheduleWorkManager(Landroid/content/Context;)V

    return-void
.end method

.method public static sendStartBackgroundInstallationFragment(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.START_BACKGROUND_INSTALLATION_FRAGMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendStartDownloadProgressFragment(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.START_DOWNLOAD_PROGRESS_FRAGMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static sendStartMergeRestartActivityIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.START_MERGE_RESTART_ACTIVITY_INTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendStartRestartActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getStartRestartActivityIntent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static sendSystemRestartNotificationForABUpdate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static sendSystemUpdateAvailableNotification(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.UPGRADE_UPDATE_NOTIFICATION_AVAILABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 11

    invoke-virtual {p2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v0, p1

    move-wide v2, p3

    move-wide/from16 v4, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move/from16 v9, p10

    move/from16 v10, p11

    invoke-static/range {v0 .. v10}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getUpdateDownloadStatusIntent(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    move-object v2, p0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendUpdateDownloadStatusError(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 12

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void
.end method

.method public static final sendUpdateDownloadStatusError(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    .locals 12

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v8, p3

    invoke-static/range {v0 .. v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void
.end method

.method public static final sendUpdateDownloadStatusError(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v8, p3

    move-object/from16 v9, p4

    invoke-static/range {v0 .. v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void
.end method

.method public static final sendUpdateDownloadStatusProgress(Landroid/content/Context;Ljava/lang/String;JJLjava/lang/String;)V
    .locals 12

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v3, p2

    move-wide/from16 v5, p4

    move-object/from16 v9, p6

    invoke-static/range {v0 .. v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void
.end method

.method public static final sendUpdateDownloadStatusRetried(Landroid/content/Context;Ljava/lang/String;JJ)V
    .locals 12

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v3, p2

    move-wide/from16 v5, p4

    invoke-static/range {v0 .. v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void
.end method

.method public static final sendUpdateDownloadStatusSuccess(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v3, p2

    move-wide v5, p2

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    invoke-static/range {v0 .. v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void
.end method

.method public static final sendUpdateDownloadStatusSuspended(Landroid/content/Context;Ljava/lang/String;JJLjava/lang/String;Z)V
    .locals 12

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const/4 v8, 0x0

    const/4 v10, -0x1

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v3, p2

    move-wide/from16 v5, p4

    move-object/from16 v9, p6

    move/from16 v11, p7

    invoke-static/range {v0 .. v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void
.end method

.method public static final sendUpdateNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2, p3, p4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getUpdateNotificationIntent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendUpdateNotificationResponse(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.response_action"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.response_flavour"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.KEY_DOWNLOAD_MODE"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendUpdateStatus(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "sendUpdateStatus: broadcast intent to showupdatestatusactivity"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p3, :cond_0

    const-string p1, "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    const-string p1, "com.motorola.blur.service.blur.upgrade.update_status"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.upgrade.failure_count"

    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendUpdaterStateReset(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_STATE_CLEAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final sendUpgradeExecute(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_EXECUTE_UPGRADE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.file_location"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final sendUpgradeStatus(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ZLjava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.app.action.UPGRADE_UPDATE_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.app.source.sha1"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.motorola.app.destination.sha1"

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.motorola.app.cus.info"

    invoke-virtual {v0, p2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.motorola.app.cus.state"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.app.release.notes"

    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.app.download.source"

    invoke-virtual {v0, p1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.app.time.stamp"

    invoke-virtual {v0, p1, p7, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "com.motorola.app.download.wifionly"

    invoke-virtual {v0, p1, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.ota.service.upgrade.displayVersion"

    invoke-virtual {v0, p1, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.upgrade.silentOta"

    invoke-virtual {v0, p1, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.upgrade.updateType"

    invoke-virtual {v0, p1, p12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static sendUpgradeStatusSuspended(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_AB_APPLY_PAYLOAD_SUSPEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final sendUserResponseDuringBackgroundInstallation(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.ccc.ota.USER_BACKGROUND_INSTALL_RESPONSE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final sendVerifyPayloadMetadataFileDownloadStatus(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_VERIFY_PAYLOAD_METADATA_DOWNLOAD_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "streaming_compatibility_status"

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.blur.service.blur.upgrade.free_space_req"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static final showAllocateFreeSpaceDialog(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;J)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendAllocateFreeSpaceIntent(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;J)V

    return-void
.end method

.method public static shutdownModemPolling()V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "MODEM_POLLING_TRIGGER"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->shutDownPolling(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static final totalBytesFromIntent(Landroid/content/Intent;)J
    .locals 3

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    const-string v0, "com.motorola.blur.service.blur.upgrade.bytes_total"

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0

    :cond_0
    return-wide v1
.end method

.method public static final unRegisterWithForceUpgradeManager(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.UNREGISTER_FORCE_UPGRADE_MANAGER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final unRegisterWithWiFiDiscoveryManager(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.UNREGISTER_WIFI_DISCOVER_MANAGER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static final versionFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_LAUNCH_UPGRADE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_EXECUTE_UPGRADE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return-object p0

    :cond_1
    :goto_0
    const-string v0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
