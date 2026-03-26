.class public final Lcom/motorola/ccc/ota/CusSM;
.super Ljava/lang/Object;
.source "CusSM.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;,
        Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;,
        Lcom/motorola/ccc/ota/CusSM$defaultAction;
    }
.end annotation


# static fields
.field private static _downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

.field private static _installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

.field private static _isSendingUpgradeStatus:I

.field private static _mTimer:Ljava/util/Timer;


# instance fields
.field private _db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

.field private final _env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field private _isRoaming:Z

.field private final _sl:Lcom/motorola/ccc/ota/stats/StatsListener;

.field private final _upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

.field private final _versionhandler:Lcom/motorola/ccc/ota/NewVersionHandler;

.field private final cm:Landroid/net/ConnectivityManager;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;


# direct methods
.method static bridge synthetic -$$Nest$fget_db(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fget_env(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fget_sl(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/stats/StatsListener;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_sl:Lcom/motorola/ccc/ota/stats/StatsListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fget_upgradePlugins(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/UpgradeSources;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcm(Lcom/motorola/ccc/ota/CusSM;)Landroid/net/ConnectivityManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->cm:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p7}, Lcom/motorola/ccc/ota/CusSM;->failNotify(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrunStateMachine(Lcom/motorola/ccc/ota/CusSM;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstopTimer(Lcom/motorola/ccc/ota/CusSM;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    sget v0, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->IDLE:I

    sput v0, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_mTimer:Ljava/util/Timer;

    return-void
.end method

.method public constructor <init>(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iput-object p3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->cm:Landroid/net/ConnectivityManager;

    const-string v0, "OtaApp"

    const-string v1, "CusSM.CusSM: constructing a CusSM object"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;-><init>(Lcom/motorola/ccc/ota/CusSM;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_versionhandler:Lcom/motorola/ccc/ota/NewVersionHandler;

    new-instance v1, Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-direct {v1, p0, v0, p1, p3}, Lcom/motorola/ccc/ota/sources/UpgradeSources;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iput-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->createDatabase()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    new-instance p1, Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-direct {p1, p2, p3}, Lcom/motorola/ccc/ota/stats/StatsListener;-><init>(Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_sl:Lcom/motorola/ccc/ota/stats/StatsListener;

    new-instance p1, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    return-void
.end method

.method private checkAndCreateReserveSpace()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->RESERVE_SPACE_IN_MB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getReservedSpaceValue()J

    move-result-wide v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->RESERVE_SPACE_IN_MB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Setting value spaceValue: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->scheduleCreateReserveSpace()V

    return-void
.end method

.method private checkAndSendRebootDuringABApplyingUpgradingState()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v2, v3, :cond_6

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CusSM.checkAndSendRebootDuringABApplyingUpgradingState : OTA restarted during "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaApp"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, -0x1

    invoke-virtual {v2, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v2, v6, v4

    if-ltz v2, :cond_5

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v5, "FAILED_FOTA."

    const-string v6, "Exceeded max update defer time"

    if-ne v2, v4, :cond_3

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2, v4, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->isMemoryLowForBackgroundInstallation(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "CusSM.checkAndSendRebootDuringABAplyingState:OTA is stuck in the ABApplying state due to low memory canceling the update"

    invoke-static {v3, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {p0, v0, v1, v6, v5}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v2, v4, :cond_5

    const-string v2, "CusSM.checkAndSendRebootDuringUpgradingState: OTA restarted during Upgrading state"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v1, v0}, Lcom/motorola/ccc/ota/CusSM;->checkSpace(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    move-result-object v2

    sget-object v4, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_NOT_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    if-ne v2, v4, :cond_4

    const-string v2, "CusSM.checkAndSendRebootDuringUpgradingState:OTA is stuck in the Upgrading state due to low memory canceling the update"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->getUpgradeStatusConstants(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    invoke-virtual {p0, v0, v6, v5}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    return-void

    :cond_5
    const-wide/32 v2, 0x5265c00

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v1, v2, v3, v0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->settingMaxDeferTimeForFOTAUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;JLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_6
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_7

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_7

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_7

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_8

    :cond_7
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnableBatteryStatusReceiver()Z

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getBatteryLevel(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_MIN_BATTERY_LEVEL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v3, 0x14

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    if-lt v0, v1, :cond_8

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_8
    return-void
.end method

.method private checkAndSendRebootDuringDLNotification()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v1, v2, :cond_2

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    return-void

    :cond_2
    :goto_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.checkAndSendRebootDuringDLNotification: device rebooted during download communicate to stats module"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendRebootDuringDownloadIntent()V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnableBatteryStatusReceiver()Z

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getBatteryLevel(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_MIN_BATTERY_LEVEL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v3, 0x14

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    if-lt v0, v1, :cond_3

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_3
    return-void
.end method

.method private checkForChain(ZLcom/motorola/ccc/ota/sources/UpgradeSourceType;)V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    new-instance v0, Lcom/motorola/ccc/ota/CusSM$2;

    invoke-direct {v0, p0, p2}, Lcom/motorola/ccc/ota/CusSM$2;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V

    const-wide/16 v1, 0x384

    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p1, v0, v1, v2, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    :cond_0
    return-void
.end method

.method private checkForUpdateInSDCard(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "CusSM.checkForUpdateInSDCard : OTA update is going on"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->isExternalScopedStorageMounted()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object p0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getExternalScopedStorage()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->checkForUpdate(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private checkForUpgradeCompleted()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "CusSM.checkForUpgradeCompleted: no upgrade result files found"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->doSanityCheck()V

    return-void
.end method

.method private checkIfAlreadyUpdating(IZ)Z
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-object v2, v0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/motorola/ccc/ota/CusSM;->extractOtaVersionList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_14

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    move v5, v3

    move v6, v5

    move v7, v6

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v8, v0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v8, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v4

    if-nez v4, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    sget-object v10, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v8, v10, :cond_0

    sget v5, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    sget v8, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->SENDING:I

    if-ne v5, v8, :cond_2

    move v5, v9

    move v6, v5

    goto :goto_0

    :cond_2
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v5, v8, :cond_3

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v5, v8, :cond_4

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v5

    if-nez v5, :cond_4

    move v5, v9

    move v7, v5

    goto :goto_0

    :cond_4
    move v5, v9

    goto :goto_0

    :cond_5
    if-eqz v5, :cond_14

    iget-object v2, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-nez v2, :cond_6

    sget-object v2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->ordinal()I

    move-result v2

    if-ne v1, v2, :cond_6

    if-eqz v4, :cond_6

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    if-eq v2, v5, :cond_6

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    if-eq v2, v5, :cond_6

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v10

    iget-object v11, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v12

    iget-object v2, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v14

    iget-object v2, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    const/4 v13, 0x1

    invoke-static/range {v10 .. v15}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->from(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    iget-object v2, v0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v4, v0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v4

    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "CusSM.checkIfAlreadyUpdating: attempt to check for upgrade while an upgrade is in prgress: state="

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v5, "OtaApp"

    invoke-static {v5, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_ALREADY:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    sget-object v10, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v8, v10, :cond_7

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    sget-object v10, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v8, v10, :cond_8

    :cond_7
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v8

    if-nez v8, :cond_8

    move v8, v9

    goto :goto_1

    :cond_8
    move v8, v3

    :goto_1
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v10

    sget-object v11, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v10, v11, :cond_9

    move v10, v9

    goto :goto_2

    :cond_9
    move v10, v3

    :goto_2
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDataNetworkRoaming(Landroid/content/Context;)Z

    move-result v11

    iget-object v12, v0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    iget-object v13, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v12, v4, v13}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->shouldIBlockUpdateForSystemPolicy(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v12

    if-eqz v12, :cond_a

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_POLICY_SET:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto/16 :goto_4

    :cond_a
    if-eqz v6, :cond_b

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_CONTACTING_SERVER:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_4

    :cond_b
    if-eqz v7, :cond_c

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_DOWNLOADING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_4

    :cond_c
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v6, v7, :cond_13

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v6, v7, :cond_13

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v6, v7, :cond_13

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v6, v7, :cond_d

    goto :goto_3

    :cond_d
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v6, v7, :cond_e

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_MERGE_PENDING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_4

    :cond_e
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v6, v7, :cond_f

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_MERGE_RESTART:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_4

    :cond_f
    if-eqz v11, :cond_11

    if-nez v8, :cond_10

    if-eqz v10, :cond_11

    :cond_10
    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_ROAMING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_4

    :cond_11
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isInActiveCall(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_12

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_IN_CALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_4

    :cond_12
    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_4

    :cond_13
    :goto_3
    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :goto_4
    :try_start_0
    iget-object v0, v0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v3

    move/from16 v4, p2

    invoke-interface {v0, v2, v1, v4, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    const-string v0, "Invalid JSON metadata, problem in parsing metadata"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_5
    return v9

    :cond_14
    return v3
.end method

.method private checkIfForceDownloadTimerExpired()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->forceDownloadTimerSanityCheck(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getForceDownloadDelay(J)I

    move-result v0

    if-gtz v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendForceUpgradeTimerExpiryIntent()V

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    int-to-long v0, v0

    invoke-interface {p0, v0, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->registerWithForceUpgradeManager(J)V

    :goto_0
    return-void
.end method

.method private checkIfForceUpgradeTimerExpired()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->forceUpgradeTimerSanityCheck(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-lez v6, :cond_1

    cmp-long v7, v0, v2

    if-ltz v7, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendForceUpgradeTimerExpiryIntent()V

    return-void

    :cond_1
    if-lez v6, :cond_2

    cmp-long v2, v0, v2

    if-gez v2, :cond_2

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    sub-long/2addr v2, v0

    add-long/2addr v0, v2

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    const-wide/16 v0, 0x3e8

    div-long/2addr v2, v0

    invoke-interface {p0, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->registerWithForceUpgradeManager(J)V

    :cond_2
    return-void
.end method

.method private checkIfWifiDiscoveryTimerExpired()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->wifiDiscoverySanityCheck(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-lez v6, :cond_1

    cmp-long v7, v0, v2

    if-ltz v7, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendDiscoverTimerExpiryIntent()V

    return-void

    :cond_1
    if-lez v6, :cond_3

    cmp-long v2, v0, v2

    if-gez v2, :cond_3

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    sub-long/2addr v2, v0

    add-long/2addr v0, v2

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v4, 0x1

    const-wide/16 v5, 0x3e8

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    div-long/2addr v2, v5

    invoke-interface {p0, v2, v3, v1, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->registerWithWiFiDiscoveryManager(JZZ)V

    goto :goto_0

    :cond_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    div-long/2addr v2, v5

    invoke-interface {p0, v2, v3, v4, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->registerWithWiFiDiscoveryManager(JZZ)V

    :cond_3
    :goto_0
    return-void
.end method

.method private declared-synchronized checkSpace(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    .locals 15

    move-object v1, p0

    const-string v0, "CusSM.checkSpace: Freed "

    const-string v2, "CusSM.checkSpace: not enough free space on /data. Package needs \""

    const-string v3, "CusSM.checkSpace, available space in data is "

    monitor-enter p0

    :try_start_0
    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v5

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getAvailableDataPartitionSize()J

    move-result-wide v5

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/motorola/otalib/common/metaData/MetaData;->getExtraSpace()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v11, v7, v9

    if-gtz v11, :cond_0

    const-wide/32 v7, 0x3200000

    :cond_0
    const-string v11, "OtaApp"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-wide/32 v13, 0x100000

    div-long v9, v5, v13

    invoke-virtual {v12, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, " MB; extra space needed in data is "

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    div-long v9, v7, v13

    invoke-virtual {v3, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, " MB; dataSpaceRetryCount "

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v11, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    cmp-long v3, v5, v7

    if-ltz v3, :cond_2

    if-lez v4, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    move-object/from16 v4, p2

    invoke-interface {v0, v4, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE_AFTER_LOW_STORAGE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_1
    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_2
    sub-long v3, v7, v5

    :try_start_2
    div-long/2addr v3, v13

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getNumFilesInDir()J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-lez v9, :cond_3

    long-to-int v9, v3

    int-to-long v9, v9

    invoke-static {v9, v10}, Lcom/motorola/ccc/ota/utils/FileUtils;->calculateNumFilesNeeded(J)J

    move-result-wide v9

    invoke-static {v9, v10}, Lcom/motorola/ccc/ota/utils/FileUtils;->deleteReserveSpaceFiles(J)Z

    move-result v9

    if-eqz v9, :cond_3

    const-string v2, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " MB"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_3
    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-wide/16 v2, 0x0

    cmp-long v2, v7, v2

    if-lez v2, :cond_4

    div-long/2addr v7, v13

    goto :goto_0

    :cond_4
    const-wide/16 v7, 0x32

    :goto_0
    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " MB\" free, available space on /data is \""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    div-long/2addr v5, v13

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " MB\"."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "OtaApp"

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_NOT_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private cleanupModemVersion(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_PREVIOUS_TRACKING_ID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupModemPrefs(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupModemFiles()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->canISendSuccessiveModemPollRequest()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/CusSM;->onModemPollingExpiryNotification(ZZ)V

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {v0, v1, v2, p1, p0}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver;->getInstallTypeHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    move-result-object p0

    sput-object p0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    if-eqz p0, :cond_3

    invoke-interface {p0}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->clearRetryTasks()V

    :cond_3
    return-void
.end method

.method private cleanupVersion(Ljava/lang/String;)V
    .locals 4

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOtaSystemBindServiceEnabledState(Landroid/content/Context;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupModemVersion(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PREVIOUS_TRACKING_ID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupFiles()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanScopedStorageFiles()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupPrefs(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_sl:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->stopListener()V

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disableBatteryStatusReceiver()Z

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->clearPrepareForUnattendedUpdate()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    if-eqz p1, :cond_3

    invoke-interface {p1}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->clearRetryTasks()V

    :cond_3
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdaterStateReset()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->unregisterFromHealthCheck()V

    return-void
.end method

.method private cleanupVersionSilent(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PREVIOUS_TRACKING_ID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanScopedStorageFiles()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupPrefs(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_sl:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->stopListener()V

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disableBatteryStatusReceiver()Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->clearRetryTasks()V

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdaterStateReset()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->unregisterFromHealthCheck()V

    return-void
.end method

.method private doPolicyBundleUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;)V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelDownloadNotification()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INCREMENTAL_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getIncrementalVersion()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v6, "woohoo"

    const-string v7, "SUCCESS."

    const/4 v5, 0x1

    move-object v3, p2

    invoke-interface/range {v2 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    const-string p1, "OtaApp"

    const-string v0, "CusSM.runStateMachine, preparing the device to upgrade policy bundle"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/FileUtils;->doPolicyBundleUpdate(Ljava/lang/String;)V

    invoke-direct {p0, p2}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersionSilent(Ljava/lang/String;)V

    return-void
.end method

.method private doSanityCheck()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->isChangeInSrc(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_6

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v4

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v4, v7, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v4, v7}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->isUpdateSuccessful(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->doesDeviceSupportVABUpdate()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/otalib/common/metaData/MetaData;->getBitmap()I

    move-result v3

    sget-object v4, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->enableVABMergeFeature:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->ordinal()I

    move-result v4

    invoke-static {v3, v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOtaSystemBindServiceEnabledState(Landroid/content/Context;Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2, v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_PROCESS_RUNNING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    :cond_3
    return-void

    :cond_4
    invoke-direct {p0, v1, v2}, Lcom/motorola/ccc/ota/CusSM;->resetToUpgradeSuccess(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    goto/16 :goto_0

    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "CusSM.doSanityCheck: !!forcefully moving version:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to Result state as there is a version mismatch!!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OtaApp"

    invoke-static {v4, v3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Forcefully moving version: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to Result state current version is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "TARGET_VERSION_MISMATCH."

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/motorola/ccc/ota/CusSM;->resetToUpgradeFailure(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_6
    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_ATTEMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_UPGRADE_ATTEMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v7, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    if-lt v3, v4, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v3, "/data/misc/update_engine_log/update_engine.log"

    invoke-static {v3, v5}, Lcom/motorola/ccc/ota/utils/FileUtils;->getFailureDetailsFromFileToUpload(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_7
    const-string v3, "Update failed due to an unknown problem during upgrade"

    :goto_1
    const-string v4, "DEVICE_BOOTED_FROM_SRC."

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/motorola/ccc/ota/CusSM;->resetToUpgradeFailure(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_8
    return-void
.end method

.method private extractOtaVersionList(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 p0, 0x0

    if-nez p1, :cond_0

    return-object p0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    move-object p1, p0

    :cond_3
    return-object p1
.end method

.method private declared-synchronized failNotify(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    const-string v0, "CusSM.failNotify: notification failed from repository "

    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p7

    const-string v1, ":"

    invoke-virtual {p7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p7

    invoke-virtual {p7, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string p5, "OtaApp"

    new-instance p7, Ljava/lang/StringBuilder;

    invoke-direct {p7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p7

    const-string v0, " for reason "

    invoke-virtual {p7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p7

    invoke-virtual {p7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p7

    const-string v0, "; additional information: "

    invoke-virtual {p7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p7

    invoke-virtual {p7, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p7

    invoke-virtual {p7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p7

    invoke-static {p5, p7}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->isBusy()Z

    move-result p5

    if-nez p5, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v7, p6

    invoke-interface/range {v1 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setStatus(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized failProgress(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p1, "OtaApp"

    const-string p2, "no version found for this version in db,drop the request to floor"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v5, 0x0

    move-object v3, p1

    move-object v6, p3

    move-object v7, p4

    invoke-interface/range {v2 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->scheduleCreateReserveSpace()V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object p3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p3

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object p4

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3, p1, p2, p4, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catch_0
    :try_start_3
    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->getUpgradeStatusConstants(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    move-result-object p2

    invoke-direct {p0, v0, p2}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    :goto_0
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private forceDownloadTimerExpired()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "CusSm.forceDownloadTimerExpired"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->forceDownloadTimerSanityCheck(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithForceUpgradeManager()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->forceDownload()V

    return-void
.end method

.method private forceDownloadTimerSanityCheck(Ljava/lang/String;)Z
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    const-string v1, "OtaApp"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "CusSM.forceDownloadTimerSanityCheck: version is not in db "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmpg-double v3, v3, v5

    if-gez v3, :cond_1

    return v2

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {p0, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long p0, v3, v5

    if-gez p0, :cond_2

    return v2

    :cond_2
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p0, v3, :cond_3

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusSM.forceDownloadTimerSanityCheck failed: version %s that is in state %s (expected state other than Result)"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method private forceUpgradeTimerExpired()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->forceUpgradeTimerSanityCheck(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithForceUpgradeManager()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteForceUpgradeValues(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->forceUpgrade()V

    goto :goto_0

    :cond_1
    const-string p0, "OtaApp"

    const-string v0, "CusSM.onIntentForceUpgradeTimerExpiry: Strange, not able to over write metadata values forceUpgradeTime will not work"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private forceUpgradeTimerSanityCheck(Ljava/lang/String;)Z
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    const/4 v1, 0x0

    const-string v6, "OtaApp"

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithForceUpgradeManager()V

    const-string p0, "CusSM.forceUpgradeTimerSanityCheck failed: something gone wrong with force upgrade time cann\'t be zero, abort the process"

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v7, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-gez v0, :cond_1

    const-string p0, "CusSM.forceUpgradeTimerSanityCheck failed: force upgrade time is not set nothing to process"

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {p0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p0

    if-nez p0, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "CusSM.forceUpgradeTimerSanityCheck: version is not in db "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusSM.forceUpgradeTimerSanityCheck failed: version %s that is with repository %s (expected upgrade as repository)"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_3
    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v2, :cond_4

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusSM.forceUpgradeTimerSanityCheck failed: version %s that is in state %s (expected state other than Result)"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_4
    const/4 p0, 0x1

    return p0
.end method

.method private freeFromReserveSpace(J)Z
    .locals 6

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Total number of reserved space files : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getNumFilesInDir()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Number of files to be deleted: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/FileUtils;->calculateNumFilesNeeded(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getNumFilesInDir()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/FileUtils;->calculateNumFilesNeeded(J)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/FileUtils;->deleteReserveSpaceFiles(J)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "CusSM-freeFromReserveSpace: Freed "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " MB"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private getPayloadMetaDataDownload(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 4

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "CusSM.getPayloadMetaDataDownload: downloading is in progress"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_1
    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;-><init>(Landroid/content/Context;Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    return-void
.end method

.method private declared-synchronized getUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 23

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "CusSM-ExtraSpace: Not enough free space on /data. Package needs "

    const-string v3, "CusSM, Available: "

    const-string v4, "CusSM-ExtraSpace: Device does not have enough extra free space on /data.Update needs"

    const-string v5, "CusSM-getExtraSpace: "

    const-string v6, "CusSM.getUpgrade: ExtraSpace: "

    const-string v7, "CusSM.getUpgrade: ExtraSpace: "

    const-string v8, "CusSM.getUpgrade: no download, but file "

    const-string v9, "package size: "

    monitor-enter p0

    :try_start_0
    sget-object v10, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    const/4 v11, 0x0

    if-eqz v10, :cond_1

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->isBusy()Z

    move-result v10

    if-eqz v10, :cond_0

    const-string v0, "OtaApp"

    const-string v2, "CusSM.getUpgrade: copying or downloading is in progress"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    sget-object v10, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    sput-object v11, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_1
    iget-object v10, v1, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v12

    invoke-virtual {v10, v12}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v10

    invoke-virtual {v10, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->doYouDownloadDirectly(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-virtual {v10, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->downloadDirectly(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_2
    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v12

    const-string v13, "OtaApp"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v9, v3

    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v2

    invoke-virtual {v14, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v13, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getModemDownloadFilePath()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_3
    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    new-instance v3, Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v14

    invoke-direct {v3, v13, v2, v14, v15}, Lcom/motorola/ccc/ota/DownloadHelper;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->isDone()Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v0, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->fileName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " is already here"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->fileName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v10, v0, v2, v3}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->verifyFile(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VERIFY:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATUS_VERIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "PACKAGE_VERIFICATION_FAILED."

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    :try_start_3
    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v0

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2, v11}, Lcom/motorola/ccc/ota/CusSM;->onInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :cond_5
    :try_start_4
    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    const-string v2, "OtaApp"

    const-string v8, "CusSM.getUpgrade: finding space"

    invoke-static {v2, v8}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getExtraSpace()J

    move-result-wide v13

    const-wide/16 v15, 0x0

    cmp-long v2, v13, v15

    if-gtz v2, :cond_6

    const-wide/32 v13, 0x3200000

    goto :goto_1

    :cond_6
    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getExtraSpace()J

    move-result-wide v13

    :goto_1
    const-string v2, "OtaApp"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v2, v13, v14}, Lcom/motorola/ccc/ota/utils/FileUtils;->isSpaceAvailableData(Lcom/motorola/otalib/common/Environment/ApplicationEnv;J)Z

    move-result v2

    if-nez v2, :cond_8

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getAvailableDataPartitionSize()J

    move-result-wide v7

    const-string v2, "OtaApp"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v6, v9

    move-object/from16 v22, v10

    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getExtraSpace()J

    move-result-wide v9

    invoke-virtual {v11, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "availableSpace: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    cmp-long v2, v13, v7

    if-lez v2, :cond_9

    sub-long v2, v13, v7

    const-wide/32 v5, 0x100000

    div-long/2addr v2, v5

    invoke-direct {v1, v2, v3}, Lcom/motorola/ccc/ota/CusSM;->freeFromReserveSpace(J)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "OtaApp"

    const-string v2, "CusSM-ExtraSpace: deleting of some reserve files failed"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Bytes.Available space on /data is"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Bytes."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "DATA_OUT_OF_SPACE."

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_7
    monitor-exit p0

    return-void

    :cond_8
    move-object v6, v9

    move-object/from16 v22, v10

    :cond_9
    :try_start_5
    iget-object v15, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->left()J

    move-result-wide v16

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v21

    move-wide/from16 v18, v13

    move-object/from16 v20, v2

    invoke-static/range {v15 .. v21}, Lcom/motorola/ccc/ota/utils/FileUtils;->setPackageDownloadLocation(Lcom/motorola/otalib/common/Environment/ApplicationEnv;JJLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    move-result-object v2

    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getExtraSpace()J

    move-result-wide v7

    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v5}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v7

    invoke-direct {v3, v4, v5, v7, v8}, Lcom/motorola/ccc/ota/DownloadHelper;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    sget-object v4, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_DATA:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    if-ne v4, v2, :cond_b

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getAvailableDataPartitionSize()J

    move-result-wide v4

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->left()J

    move-result-wide v7

    add-long/2addr v7, v13

    cmp-long v2, v7, v4

    if-lez v2, :cond_e

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->left()J

    move-result-wide v7

    add-long/2addr v7, v13

    sub-long/2addr v7, v4

    const-wide/32 v9, 0x100000

    div-long/2addr v7, v9

    const-string v2, "OtaApp"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, ", Required Space: "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->left()J

    move-result-wide v9

    add-long/2addr v9, v13

    invoke-virtual {v6, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, " bytes"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v7, v8}, Lcom/motorola/ccc/ota/CusSM;->freeFromReserveSpace(J)Z

    move-result v2

    if-nez v2, :cond_a

    const-string v2, "OtaApp"

    const-string v6, "CusSM, deleting of some reserve files failed"

    invoke-static {v2, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->left()J

    move-result-wide v2

    add-long/2addr v13, v2

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " Bytes. Available space on /data is "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "Bytes."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "DATA_OUT_OF_SPACE."

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :cond_a
    monitor-exit p0

    return-void

    :cond_b
    :try_start_6
    sget-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_SDCARD:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    if-ne v0, v2, :cond_e

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->isSDCardMounted()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v0, :cond_c

    :try_start_7
    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SDCARD_RESOURCES_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {v12}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v3, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_8
    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    goto :goto_2

    :cond_c
    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->isSDCardPresent()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SDCARD_RESOURCES_NOTMOUNTED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-interface {v0, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    goto :goto_2

    :cond_d
    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SDCARD_RESOURCES_NOSDCARD:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-interface {v0, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :goto_2
    monitor-exit p0

    return-void

    :cond_e
    :try_start_9
    invoke-virtual/range {v22 .. v22}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->getDownloadHandler()Lcom/motorola/otalib/common/Environment/DownloadHandler;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    move-object/from16 v2, p1

    invoke-interface {v0, v2}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private handleModemStateResponse(Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;ILjava/lang/String;)V
    .locals 10

    const-string v0, "Inside handleModemStateResponse"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p3}, Lcom/motorola/ccc/ota/utils/TestUtils;->sendStateResponse(Landroid/content/Context;Ljava/lang/String;)V

    sget p3, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->IDLE:I

    sput p3, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    iget-object p3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextKey()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v3, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove_status(I)V

    if-eqz p3, :cond_3

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->proceed()Z

    move-result p2

    const/4 p3, 0x0

    const-string v0, "handleModemStateResponse server told to : "

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextTimeStamp()J

    move-result-wide v3

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v6, 0x0

    invoke-virtual {p2, v5, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v8

    cmp-long p2, v3, v8

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->isModemBusy()Z

    move-result p2

    if-eqz p2, :cond_1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v3, "mismatch in modem\'s ContentTimeStamp: currentContentTimeStamp: "

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    invoke-virtual {p2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v3, " responseContentTimeStamp: "

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextTimeStamp()J

    move-result-wide v3

    invoke-virtual {p2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v3, "; updating the new MetaData info"

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContent()Lorg/json/JSONObject;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p2

    if-nez v3, :cond_0

    const-string p1, "change in modem\'s contentTimeStamp but there is no new content,so not able to update new content"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->polling:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v5}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v8

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->from(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextTimeStamp()J

    move-result-wide v5

    invoke-virtual {v3, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getTrackingId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v4, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    if-eqz p2, :cond_1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getAbInstallType()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/MetaData;->getAbInstallType()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    const-string p1, "CusSm:Server changed abInstallType,canceling the modem update"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/String;

    const-string p2, "Server changed abInstallType for Modem update"

    aput-object p2, p1, p3

    const/4 p2, 0x1

    const-string p3, "OTHER."

    aput-object p3, p1, p2

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    invoke-direct {p0, v2}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p3, "continue"

    invoke-virtual {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_1

    :cond_2
    invoke-direct {p0, v2}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v2, "cancel"

    invoke-virtual {p1, p2, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-array p1, p3, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    const-string p1, "CusSM:handleModemStateResponse:state request and response trackingId mismatch, return"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    :goto_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus(Ljava/lang/String;)V

    return-void
.end method

.method private handleStateResponse(Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;ILjava/lang/String;)V
    .locals 15

    move-object v0, p0

    const-string v1, "Inside handleStateResponse"

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v3, p3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/TestUtils;->sendStateResponse(Landroid/content/Context;Ljava/lang/String;)V

    sget v3, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->IDLE:I

    sput v3, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    iget-object v3, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getSmartUpdateBitmap()I

    move-result v6

    if-ltz v6, :cond_0

    iget-object v7, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v7, v6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->storeBits(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;I)V

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->isUploadFailureLogsEnabled()Z

    move-result v6

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v6, :cond_1

    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPLOAD_UE_FAILURE_LOGS_ENABLED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v9, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    new-instance v6, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/FileUploadService;->canUploadLogFile(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-string v6, "CusSM: Uploading UE log file to sever"

    invoke-static {v2, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v6, Lcom/motorola/ccc/ota/ui/FileUploadService;

    invoke-direct {v6}, Lcom/motorola/ccc/ota/ui/FileUploadService;-><init>()V

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/ui/FileUploadService;->uploadUEFailureFiles()V

    goto :goto_0

    :cond_1
    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPLOAD_UE_FAILURE_LOGS_ENABLED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v9, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_2
    :goto_0
    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->decideToShowSmartUpdateSuggestion(Landroid/content/Context;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v6

    const-string v9, "SmartUpdateKey"

    if-eqz v6, :cond_3

    const-string v6, "true"

    invoke-static {v9, v6}, Lcom/motorola/ccc/ota/utils/OtaAppContentProvider;->updateOtaAppContentProvider(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    const-string v6, "false"

    invoke-static {v9, v6}, Lcom/motorola/ccc/ota/utils/OtaAppContentProvider;->updateOtaAppContentProvider(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    move/from16 v9, p2

    invoke-interface {v6, v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove_status(I)V

    if-eqz v3, :cond_12

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v6

    if-nez v6, :cond_12

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->proceed()Z

    move-result v3

    const-string v4, "handleStateResponse server told to : "

    if-eqz v3, :cond_11

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextTimeStamp()J

    move-result-wide v9

    iget-object v3, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v11, 0x0

    invoke-virtual {v3, v6, v11, v12}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v13

    cmp-long v3, v9, v13

    if-eqz v3, :cond_10

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->isBusy()Z

    move-result v3

    if-eqz v3, :cond_10

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "mismatch in ContentTimeStamp: currentContentTimeStamp: "

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v9, v11, v12}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v9

    invoke-virtual {v3, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " responseContentTimeStamp: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextTimeStamp()J

    move-result-wide v9

    invoke-virtual {v3, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "; updating the new MetaData info"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    iget-object v3, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    if-nez v9, :cond_4

    const-string v1, "change in contentTimeStamp but there is no new content,so not able to update new content"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6

    :cond_4
    iget-object v10, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v14

    const/4 v12, 0x0

    invoke-static/range {v9 .. v14}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->from(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getContextTimeStamp()J

    move-result-wide v10

    invoke-virtual {v6, v9, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v9, v0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v9

    invoke-interface {v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v6

    if-eqz v6, :cond_10

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    if-eqz v9, :cond_10

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v9

    sget-object v10, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v9, v10, :cond_10

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    invoke-virtual {v9}, Lcom/motorola/otalib/common/metaData/MetaData;->getMaxUpdateFailCount()I

    move-result v9

    invoke-static {v9}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMaxUpdateFailCountExpired(I)Z

    move-result v9

    const-wide/16 v10, 0x0

    if-eqz v9, :cond_7

    const-string v9, "handleStateResponse, overridePDLValues on FAIL"

    invoke-static {v2, v9}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    invoke-virtual {v9}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    invoke-virtual {v9}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v12

    cmpl-double v9, v12, v10

    if-lez v9, :cond_7

    :cond_5
    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    iget-object v12, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v12, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v12

    iget-object v13, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v13, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v9, v12, v13}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteMetaDataValuesOnOtaFailExpiry(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    if-eqz v9, :cond_6

    invoke-virtual {p0, v9}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    goto :goto_2

    :cond_6
    const-string v9, "CusSM.handleStateResponse, null metadata,unable to override showPreDownloadDialog"

    invoke-static {v2, v9}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    :goto_2
    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAscDevice(Landroid/content/Context;)Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteASCMetaDataValues(Lcom/motorola/otalib/common/metaData/MetaData;Landroid/content/Context;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    if-eqz v1, :cond_8

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    goto :goto_3

    :cond_8
    const-string v1, "CusSM.handleStateResponse, null metadata,unable to override Metadata for ASC"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    :goto_3
    if-eqz v3, :cond_a

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getAbInstallType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3}, Lcom/motorola/otalib/common/metaData/MetaData;->getAbInstallType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    const-string v1, "CusSm:Server changed abInstallType,canceling the OTA update"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "Server changed abInstallType"

    aput-object v2, v1, v8

    const-string v2, "OTHER."

    aput-object v2, v1, v7

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    return-void

    :cond_a
    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-wide/16 v8, -0x1

    if-eq v1, v3, :cond_d

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v1, v3, :cond_b

    goto :goto_4

    :cond_b
    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v1, v3, :cond_10

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceUpgradeTime()I

    move-result v1

    if-lez v1, :cond_c

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v12

    cmp-long v1, v12, v8

    if-nez v1, :cond_c

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceUpgradeTime()I

    move-result v1

    iget-object v3, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v6, v0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v1, v3, v6}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->startForceUpgradeTimer(ILcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    sput-boolean v7, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sDeviceIdleModeRequired:Z

    goto/16 :goto_6

    :cond_c
    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v12

    cmpl-double v1, v12, v10

    if-ltz v1, :cond_10

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v10

    cmp-long v1, v10, v8

    if-nez v1, :cond_10

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v6

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, v0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v6, v7, v1, v3}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->startForceDownloadTimer(DLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    goto :goto_6

    :cond_d
    :goto_4
    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSeverity()I

    move-result v1

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->ordinal()I

    move-result v3

    if-ne v1, v3, :cond_e

    const-string v1, "CusSm:Server changed critical update value"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v6, v1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->settingMaxDeferTimeForCriticalUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto :goto_5

    :cond_e
    const-string v1, "CusSm:Server changed from critical update value"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_EXTENDED_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :goto_5
    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->isForceInstallTimeSet()Z

    move-result v1

    if-eqz v1, :cond_f

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v10

    cmp-long v1, v10, v8

    if-nez v1, :cond_f

    const-string v1, "CusSm:Server changed force install value"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    long-to-double v7, v7

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceInstallTime()D

    move-result-wide v9

    const-wide/high16 v11, 0x4038000000000000L    # 24.0

    mul-double/2addr v9, v11

    const-wide/high16 v11, 0x404e000000000000L    # 60.0

    mul-double/2addr v9, v11

    mul-double/2addr v9, v11

    const-wide v11, 0x408f400000000000L    # 1000.0

    mul-double/2addr v9, v11

    add-double/2addr v7, v9

    double-to-long v6, v7

    invoke-virtual {v1, v3, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto :goto_6

    :cond_f
    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_10
    :goto_6
    invoke-direct {p0, v5}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v6, "continue"

    invoke-virtual {v1, v3, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_7

    :cond_11
    invoke-direct {p0, v5}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    iget-object v1, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v6, "cancel"

    invoke-virtual {v1, v3, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-array v1, v8, [Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    goto :goto_7

    :cond_12
    const-string v1, "CusSM:state request and response trackingId mismatch, return"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_13
    :goto_7
    invoke-direct {p0, v5}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus(Ljava/lang/String;)V

    return-void
.end method

.method private initializePlugins()V
    .locals 5

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v3, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v3

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "CusSM.initializePlugins: version "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in db but could not get description"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaApp"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->initializePlugins(Ljava/util/List;)V

    return-void
.end method

.method private intimateModem()V
    .locals 5

    const-string v0, "CusSM.intimateModem"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getModemDownloadFilePath()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CusSM.intimateModem, no modem file: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Modem Update is cancelled because no downloaded modem file, version: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "MODEM_CANCELED_BY_SERVER."

    aput-object v1, v0, v4

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance p0, Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.ota.MODEM_UPDATE"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.fileprovider"

    invoke-static {v0, v1, v2}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.motorola.bach.modemstats"

    invoke-virtual {v1, v2, v0, v4}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    const-string v1, "application/zip"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method private isServiceControlEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private isServiceControlEnabled(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTACANCEL_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "ota cancel feature not avaialble"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->getMetaData(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->isServiceControlEnabled()Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method private moveOtaToModemWaitingState()V
    .locals 5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    const-string v2, "OtaApp"

    if-nez v1, :cond_0

    const-string p0, "CusSM.onModemFileReadStatus: version is not in db"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IntimateModem:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v3, v4, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v3, "CusSM.onModemFileReadStatus failed: version "

    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " that is in state "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " (expected state IntimateModem)"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0xa4cb800

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_FILE_DL_NOTIFIED_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->WaitingForModemUpdateStatus:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    return-void
.end method

.method private onIntentMaxFotaExpiryTime()V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    const-string v2, "OtaApp"

    if-nez v1, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "CusSM.onIntentMaxFotaExpiryTime: notification for version is not in db "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "CusSM.onIntentMaxFotaExpiryTime: state = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v4

    invoke-virtual {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v5, "DATA_OUT_OF_SPACE."

    const-string v6, "Exceeded max update defer time"

    if-ne v3, v4, :cond_1

    const-string v1, "CusSM.onIntentMaxFotaExpiryTime:OTA is stuck in the ABApplying state due to low memory, canceling the update"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {p0, v0, v1, v6, v5}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v3, v4, :cond_2

    const-string v3, "CusSM.onIntentMaxFotaExpiryTime:OTA is stuck in the Upgrading state due to low memory, canceling the update"

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v6, v5}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->getUpgradeStatusConstants(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    goto :goto_0

    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v3, "CusSM.onIntentMaxFotaExpiryTime failed: notification for version"

    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " that is in state "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "(expected state ABApplyingState or Upgrading)"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private releasePlugins()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->releasePlugins()V

    return-void
.end method

.method private requestUserToAllocateSpace(J)V
    .locals 7

    const-string v0, "Requesting user to allocate space"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_FREESPACEREQ_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VAB_MAKE_SPACE_REQUEST_USER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v5

    sub-long v5, p1, v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v3, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "CusSM.requestUserToAllocateSpace, extra space needed is"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-wide/32 v2, 0x100000

    div-long v2, p1, v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " MB"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VAB_MAKE_SPACE_REQUEST_USER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-interface {p0, v0, p1, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->showAllocateFreeSpaceDialog(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;J)V

    return-void
.end method

.method private resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V
    .locals 6

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CusSM.runStateMachine, error while parsing metadata "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    const-string v5, "PARSE_ERROR."

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    return-void
.end method

.method private resetToUpgradeFailure(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementEvenUpgradefailureRetries()V

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Unsuccessfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-direct {p0, p2, v0}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v4, 0x0

    move-object v2, p1

    move-object v5, p3

    move-object v6, p4

    invoke-interface/range {v1 .. v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    iget-object p4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p4, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :try_start_0
    iget-object p4, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    iget-object p4, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object p4

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v2

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAILURE_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {p2, p4, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v5

    const/4 v4, 0x0

    move-object v3, p3

    invoke-interface/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->scheduleCreateReserveSpace()V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "CusSM:checkForUpgradeCompleted(): caught exception "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private resetToUpgradeSuccess(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 10

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "woohoo"

    goto :goto_0

    :cond_0
    const-string v1, "Device is already upgraded to target version but result file is missing"

    :goto_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INCREMENTAL_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAILURE_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->MR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const-string v8, "OtaApp"

    const/4 v9, 0x0

    if-nez v3, :cond_1

    sget-object v3, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_MODEM_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/32 v4, 0x240c8400

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    const-string v2, "MR/OS update is success re-scheduling modem polling"

    invoke-static {v8, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->scheduleModemWorkManager(Landroid/content/Context;)V

    :cond_2
    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Successfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-direct {p0, p2, v2}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v5, 0x1

    const-string v7, "SUCCESS."

    move-object v3, p1

    move-object v6, v1

    invoke-interface/range {v2 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getReleaseNotes()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getPostInstallNotes()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2, v3, v4, v5, v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->insertHistory(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    :try_start_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v5, v1

    invoke-interface/range {v2 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->checkForChainUpgrade(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Z

    move-result v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->triggerForceDeviceLogin()V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p2, v2}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->setReserveSpaceInMB(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->scheduleCreateReserveSpace()V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    invoke-direct {p0, v1, v0}, Lcom/motorola/ccc/ota/CusSM;->checkForChain(ZLcom/motorola/ccc/ota/sources/UpgradeSourceType;)V

    return-void

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "CusSM:resetToUpgradeSuccess(): caught exception "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v8, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized runStateMachine()V
    .locals 16

    move-object/from16 v1, p0

    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus()V

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    if-nez v2, :cond_1

    const-string v2, "OtaApp"

    const-string v3, "CusSM.runStateMachine: no versions found in database"

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->_sl:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/stats/StatsListener;->stopListener()V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupFiles()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v6, v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v12

    if-nez v12, :cond_3

    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: getVersions\'s version is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ",  but could not get its description"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: getVersions\'s version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; getDescription\'s version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: updateVerion:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " dbState:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    goto :goto_1

    :cond_4
    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    :goto_1
    const-string v8, "OtaApp"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "CusSM.runStateMachine: server told to :"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v10, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    sget-object v9, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v8, v9, :cond_6

    const-string v8, "wait"

    iget-object v9, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v9, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v8, :cond_5

    monitor-exit p0

    return-void

    :cond_5
    :try_start_2
    const-string v8, "cancel"

    iget-object v9, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v9, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    new-array v2, v7, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_6
    :try_start_3
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v8, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v9, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {v6, v8, v9, v12, v1}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver;->getInstallTypeHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    move-result-object v6

    sput-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    sget-object v6, Lcom/motorola/ccc/ota/CusSM$5;->$SwitchMap$com$motorola$otalib$common$Environment$ApplicationEnv$PackageState:[I

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    invoke-virtual {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ordinal()I

    move-result v8

    aget v6, v6, v8

    const-wide/16 v8, -0x1

    const-wide/16 v10, 0x0

    const/4 v15, 0x2

    const/4 v13, 0x0

    const/4 v14, 0x1

    packed-switch v6, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " in Result state, cleaning up"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->registerForHealthCheck()V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendStartMergeRestartActivityIntent(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_2
    sget-object v5, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v5}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->initializeUpdaterEngineHandlerMergeState()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object v5

    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine:MergePending: Updater engine status "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_3
    invoke-static {v3, v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOtaSystemBindServiceEnabledState(Landroid/content/Context;Z)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledByPolicyMngr()Z

    move-result v6

    if-eqz v6, :cond_9

    const-string v5, "Device is under system disable ota update policy, abort ongoing update"

    const-string v6, "KEY_UPDATE_DISABLED_BY_POLICY_MNGR."

    iget-object v8, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledPolicySet()Z

    move-result v8

    if-eqz v8, :cond_7

    const-string v5, "isOtaUpdateDisabled policy is set, abort ongoing update"

    const-string v6, "KEY_UPDATE_DISABLED_BY_MOTO_POLICY_MNGR."

    goto :goto_2

    :cond_7
    iget-object v8, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isDeviceUnderFreezePeriod()Z

    move-result v8

    if-eqz v8, :cond_8

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Device is under freeze period; policy type ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", abort ongoing update"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "KEY_UPDATE_BLOCKED_FREEZE_PERIOD."

    :cond_8
    :goto_2
    new-array v8, v15, [Ljava/lang/String;

    aput-object v5, v8, v7

    aput-object v6, v8, v14

    invoke-virtual {v1, v8}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_9
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_ATTEMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v13, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v6

    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_UPGRADE_ATTEMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v13, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v7

    if-lt v6, v7, :cond_a

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CusSM.runStateMachine version "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " upgrade attempt count beyond threshold "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :cond_a
    :try_start_4
    invoke-direct {v1, v12, v5}, Lcom/motorola/ccc/ota/CusSM;->checkSpace(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    move-result-object v6

    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE_AFTER_LOW_STORAGE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-ne v6, v7, :cond_b

    monitor-exit p0

    return-void

    :cond_b
    :try_start_5
    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_NOT_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    if-ne v6, v7, :cond_d

    const-string v2, "OtaApp"

    const-string v3, "CusSM.runStateMachine: Upgrading, space is low"

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v4

    if-eqz v4, :cond_c

    cmp-long v4, v2, v10

    if-lez v4, :cond_c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v2, v6, v2

    if-ltz v2, :cond_c

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->onIntentMaxFotaExpiryTime()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    :cond_c
    :try_start_6
    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-static {v4}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v5, v3, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v2, v0

    :try_start_7
    invoke-direct {v1, v5, v2}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :goto_3
    monitor-exit p0

    return-void

    :cond_d
    :try_start_8
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->getRebootRequired()Z

    move-result v6
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    if-eqz v6, :cond_f

    :try_start_9
    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v6}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->doesDownloadedFileClearedFromDisk()Z

    move-result v6

    if-eqz v6, :cond_e

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-direct {v1, v12, v6}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    invoke-direct {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    monitor-exit p0

    return-void

    :cond_e
    :try_start_a
    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: preparing the device to upgrade to version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v6

    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v7}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    invoke-static {v8}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v5, v7, v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpgradeExecute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object v6, v0

    :try_start_b
    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    sget-object v5, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {v5, v6, v7}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    goto :goto_4

    :cond_f
    invoke-static {v12}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isPolicyBundleUpdateEnabled(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-direct {v1, v12, v5}, Lcom/motorola/ccc/ota/CusSM;->doPolicyBundleUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;)V

    goto :goto_4

    :cond_10
    const-string v10, "reboot required is set to false in deployment plan"

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v11, "OTHER."

    const/4 v9, 0x0

    move-object v7, v5

    invoke-interface/range {v6 .. v11}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-direct {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    sget-object v5, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    sget-object v7, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {v5, v6, v7}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->unregisterFromHealthCheck()V

    goto/16 :goto_0

    :pswitch_4
    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v6}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->doesDownloadedFileClearedFromDisk()Z

    move-result v6

    if-eqz v6, :cond_11

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-direct {v1, v12, v6}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    invoke-direct {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_0

    :cond_11
    :try_start_c
    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v6, v12}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->promptUpgradeActivity(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->registerForHealthCheck()V
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_0

    :catch_2
    move-exception v0

    move-object v6, v0

    :try_start_d
    sget-object v7, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    sget-object v9, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {v7, v8, v9}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    goto/16 :goto_0

    :pswitch_5
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v6}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->startRestartExpiryTimer(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " download complete, now querying the user"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v6}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->doesDownloadedFileClearedFromDisk()Z

    move-result v6

    if-eqz v6, :cond_12

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-direct {v1, v12, v6}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    invoke-direct {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto/16 :goto_0

    :cond_12
    :try_start_e
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->registerForHealthCheck()V

    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v6, v12}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->shouldPromptUpgradeNotification(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z

    move-result v6

    if-eqz v6, :cond_13

    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v6, v12}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->promptUpgradeNotification(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    goto/16 :goto_0

    :cond_13
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto/16 :goto_0

    :catch_3
    move-exception v0

    move-object v6, v0

    :try_start_f
    sget-object v7, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v8

    sget-object v9, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {v7, v8, v9}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    goto/16 :goto_0

    :pswitch_6
    :try_start_10
    const-string v6, "OtaApp"

    const-string v7, "CusSM.runStateMachine: allocate space before applying patch for VAB updates."

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->registerForHealthCheck()V

    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v6, v12}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->allocateSpaceBeforeApplyPatch(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_4
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    goto/16 :goto_0

    :catch_4
    move-exception v0

    move-object v6, v0

    :try_start_11
    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    goto/16 :goto_0

    :pswitch_7
    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: preparing to get payload metadata package getting version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v12}, Lcom/motorola/ccc/ota/CusSM;->getPayloadMetaDataDownload(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    goto/16 :goto_0

    :pswitch_8
    const-string v6, "OtaApp"

    const-string v8, "Waiting for modem update status from Modem component"

    invoke-static {v6, v8}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_FILE_DL_NOTIFIED_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v13, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v10

    cmp-long v6, v8, v10

    if-gez v6, :cond_14

    goto/16 :goto_0

    :cond_14
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    sget-object v8, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v6, v8}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v6

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    sget-object v9, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->isUpdateSuccessful(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_15

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v10, "Device is already upgraded to target version but result status is not received from modem, status waiting time period is expired"

    const-string v11, "SUCCESS."

    const/4 v9, 0x1

    move-object v7, v5

    invoke-interface/range {v6 .. v11}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    invoke-direct {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->cleanupModemVersion(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_15
    new-array v6, v15, [Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Modem Update is cancelled due to expiry of modem update waiting time period , version: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v7

    const-string v5, "MODEM_CANCELED_BY_SERVER."

    aput-object v5, v6, v14

    invoke-virtual {v1, v6}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_9
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->intimateModem()V

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->moveOtaToModemWaitingState()V

    goto/16 :goto_0

    :pswitch_a
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v12, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_FILE_DL_EXPIRED_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v12, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_16

    cmp-long v6, v8, v10

    if-lez v6, :cond_16

    cmp-long v6, v12, v8

    if-ltz v6, :cond_16

    new-array v6, v15, [Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Modem Update is cancelled due to modem download timer expired, version: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v7

    const-string v5, "MODEM_DOWNLOAD_TIMER_EXPIRED."

    aput-object v5, v6, v14

    invoke-virtual {v1, v6}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_16
    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/CusSM;->shouldMoveToGettingPackage(Ljava/util/List;)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v7, v5, v8, v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const-wide/32 v5, 0xa4cb800

    add-long/2addr v12, v5

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_FILE_DL_EXPIRED_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6, v12, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_17
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto/16 :goto_0

    :pswitch_b
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v6

    if-eqz v6, :cond_19

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result v6

    if-nez v6, :cond_19

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_AUTO_DOWNLOAD_OPTION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "OtaApp"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "GettingDescriptor:USER_AUTO_DOWNLOAD_OPTION="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v7, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->WiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_18

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v8, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_5

    :cond_18
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v8, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI_AND_MOBILE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_19
    :goto_5
    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v6, v12, v7}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->isDataSpaceLowForUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)Z

    move-result v6

    if-eqz v6, :cond_1b

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    if-eqz v6, :cond_1a

    :try_start_12
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    invoke-static {v8}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v5, v7, v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_5
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto/16 :goto_0

    :catch_5
    move-exception v0

    move-object v6, v0

    :try_start_13
    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    goto/16 :goto_0

    :cond_1a
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "CusSM.runStateMachine: GettingDescriptor failed due tolow memory space"

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v8, "FAILED_FOTA."

    invoke-virtual {v1, v6, v7, v5, v8}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_1b
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->checkForDownloadDescriptor(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->unregisterFromHealthCheck()V

    goto/16 :goto_0

    :pswitch_c
    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: user is being notified for version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v6

    invoke-virtual {v6, v12}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->getDownloadOptStartStopTime(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "OtaApp"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "CusSM.runStateMachine: getDownloadOptStartStopTime text "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v7

    if-eqz v7, :cond_1d

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_1c

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_1c
    invoke-static {v14}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAutomaticDownloadForCellular(Z)V

    const-string v6, "autoDlBySysUpdatePolicyAfterNotified"

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    const-string v6, "OtaApp"

    const-string v7, "CusSM:Auto downloading update due to system update policy"

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto/16 :goto_0

    :cond_1d
    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v7

    if-nez v7, :cond_20

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog()Z

    move-result v7

    if-eqz v7, :cond_1e

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmpg-double v7, v7, v9

    if-ltz v7, :cond_1f

    :cond_1e
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/motorola/otalib/common/metaData/MetaData;->getMaxUpdateFailCount()I

    move-result v7

    invoke-static {v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMaxUpdateFailCountExpired(I)Z

    move-result v7
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    if-eqz v7, :cond_20

    :cond_1f
    :try_start_14
    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v7

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    invoke-static {v8}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v5, v8, v9, v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->registerForHealthCheck()V
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_6
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    goto/16 :goto_0

    :catch_6
    move-exception v0

    move-object v6, v0

    :try_start_15
    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    goto/16 :goto_0

    :cond_20
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v6

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelUpdateNotification()V

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_21

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_21
    const-string v6, "autoDownloadAfterNotified"

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto/16 :goto_0

    :pswitch_d
    invoke-static {v3, v14}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOtaSystemBindServiceEnabledState(Landroid/content/Context;Z)V

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_22

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v5

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->moveFotaToGettingDescriptorState()V

    goto/16 :goto_0

    :cond_22
    sget-object v6, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2e

    sget-object v6, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateReqTriggeredBy()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_23

    goto/16 :goto_8

    :cond_23
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v6

    if-nez v6, :cond_2b

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v6

    if-lez v6, :cond_24

    goto/16 :goto_7

    :cond_24
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v6

    if-nez v6, :cond_25

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_25

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog()Z

    move-result v6

    if-eqz v6, :cond_25

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpg-double v6, v6, v8

    if-gez v6, :cond_25

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldIForceSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v6
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    if-nez v6, :cond_25

    :try_start_16
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->registerForHealthCheck()V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v6

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendSystemUpdateAvailableNotification(Ljava/lang/String;)V
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_16} :catch_7
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    monitor-exit p0

    return-void

    :catch_7
    move-exception v0

    move-object v6, v0

    :try_start_17
    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    goto/16 :goto_0

    :cond_25
    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_26

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_26
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->shouldIBlockUpdateByTOD(Lcom/motorola/otalib/common/metaData/MetaData;)Z

    move-result v6

    if-eqz v6, :cond_27

    const-string v5, "OtaApp"

    const-string v6, "Update is blocked by TOD"

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_27
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldIForceSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_28

    const-string v6, "autoDownloadForSmartUpdate"

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    goto :goto_6

    :cond_28
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog()Z

    move-result v6

    if-eqz v6, :cond_29

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpl-double v6, v6, v8

    if-lez v6, :cond_2a

    :cond_29
    const-string v6, "autoDownloadAfterNotified"

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    :cond_2a
    :goto_6
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto/16 :goto_0

    :cond_2b
    :goto_7
    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_2c

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_2c
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v6

    if-eqz v6, :cond_2d

    invoke-static {v14}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAutomaticDownloadForCellular(Z)V

    :cond_2d
    const-string v6, "autoDlBySysUpdatePolicy"

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    const-string v6, "OtaApp"

    const-string v7, "CusSM:Auto downloading update due to system update policy"

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto/16 :goto_0

    :cond_2e
    :goto_8
    const-string v6, "OtaApp"

    const-string v7, "user triggered"

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v6

    if-nez v6, :cond_33

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v6

    if-lez v6, :cond_2f

    goto :goto_9

    :cond_2f
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v6

    if-nez v6, :cond_31

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog()Z

    move-result v6

    if-eqz v6, :cond_31

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpg-double v6, v6, v8

    if-gez v6, :cond_31

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_30

    const-string v5, "OtaApp"

    const-string v6, "CusSM.runStateMachine: database error; did not send a permission request to UI"

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_30
    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v6, "userDidCheckUpdate"

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto/16 :goto_0

    :cond_31
    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_32

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_32
    const-string v6, "autoDownloadAfterNotified"

    invoke-static {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    sget-object v5, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v5, v12}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->displayScreenForGettingDescriptor(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    goto/16 :goto_0

    :cond_33
    :goto_9
    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_34

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_34
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v6

    if-eqz v6, :cond_35

    invoke-static {v14}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAutomaticDownloadForCellular(Z)V

    :cond_35
    const-string v6, "OtaApp"

    const-string v7, "CusSM:Auto downloading update due to system update policy"

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_36

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "userInitiated"

    invoke-static {v3, v5, v14, v6, v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateNotificationResponse(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    :cond_36
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v6, v5, v7, v13}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    :goto_a
    sget-object v5, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v5, v12}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->displayScreenForGettingDescriptor(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    const-string v5, "autoDlBySysUpdatePolicy"

    invoke-static {v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_e
    sget-object v6, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    iget-object v8, v1, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-interface {v6, v12, v8}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->updaterEngineHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;)Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object v6

    sget-object v8, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SYSTEM_UPDATE_CANCEL_POLICY_SET:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne v6, v8, :cond_37

    const-string v5, "OtaApp"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "CusSM.runStateMachine: Updater engine status "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    new-array v5, v15, [Ljava/lang/String;

    const-string v6, "Device is under system disable ota update policy, abort the ongoing update"

    aput-object v6, v5, v7

    const-string v6, "DEVICE_UNDER_SYSTEM_UPDATE_POLICY."

    aput-object v6, v5, v14

    invoke-virtual {v1, v5}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_37
    sget-object v7, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_BUSY:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-eq v6, v7, :cond_3b

    sget-object v7, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-eq v6, v7, :cond_3b

    sget-object v7, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SYSTEM_UPDATE_POLICY_SET:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne v6, v7, :cond_38

    goto/16 :goto_b

    :cond_38
    sget-object v7, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_NO_FILE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne v6, v7, :cond_39

    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is in database as applying AB patch but not on disk... cleaning up"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v6, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v8}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " file not found in device"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "PACKAGE_NOT_IN_DEVICE."

    invoke-virtual {v1, v5, v6, v7, v8}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_39
    sget-object v7, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_LOW_SPACE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne v6, v7, :cond_3a

    const-string v6, "OtaApp"

    const-string v7, "CusSM.runStateMachine: applying patch, space is low"

    invoke-static {v6, v7}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    :try_start_18
    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    invoke-static {v8}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v5, v7, v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v6

    invoke-virtual {v6, v12}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->setMemoryLowInfo(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_8
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    goto/16 :goto_0

    :catch_8
    move-exception v0

    move-object v6, v0

    :try_start_19
    invoke-direct {v1, v5, v6}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    goto/16 :goto_0

    :cond_3a
    sget-object v5, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_FOTA_LOW_MEMORY:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne v6, v5, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->onIntentMaxFotaExpiryTime()V

    goto/16 :goto_0

    :cond_3b
    :goto_b
    const-string v5, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: Updater engine status "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_f
    const-string v6, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CusSM.runStateMachine: preparing to get or resume getting version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v12}, Lcom/motorola/ccc/ota/CusSM;->getUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    goto/16 :goto_0

    :cond_3c
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    move-object v2, v0

    monitor-exit p0

    throw v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private scheduleCreateReserveSpace()V
    .locals 6

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.app.CREATE_RESERVE_SPACE_POST_FIFTEEN_MINUTES"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    const/high16 v2, 0x14000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    invoke-virtual {v1, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const-wide/32 v2, 0xdbba0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    add-long/2addr v4, v2

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, v5, v0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "scheduleCreateReserveSpace, Current time: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {p0, v1, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Creating reserve space files will start at "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v4, v5}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V
    .locals 1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->handleUpdateStatus(Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    return-void

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->handleUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    return-void
.end method

.method private sendUpgradeStatus()V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus(Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized sendUpgradeStatus(Ljava/lang/String;)V
    .locals 58

    move-object/from16 v1, p0

    const-string v2, "Thinkshield props: ascVersion="

    const-string v3, "isAscDevice = "

    const-string v4, "Smart update enabled - "

    const-string v5, "Carrier name - "

    const-string v6, "OTA APK version - "

    const-string v7, "CusSM.sendUpgradeStatus: "

    const-string v8, "; "

    const-string v9, "; upgradeSource:"

    const-string v10, "Exception in CusSM.sendUpgradeStatus: "

    const-string v0, "stats size : "

    const-string v11, "cur: "

    const-string v12, "CusSM.sendUpgradeStatus: "

    monitor-enter p0

    :try_start_0
    sget v13, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    sget v14, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->IDLE:I

    if-eq v13, v14, :cond_0

    const-string v0, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v12, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v12

    if-nez v12, :cond_3

    const-string v0, "OtaApp"

    const-string v2, "CusSM.sendUpgradeStatus: no unlogged events."

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_OTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_1
    invoke-direct/range {p0 .. p1}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "wait"

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, "continue"

    invoke-virtual {v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    :cond_3
    :try_start_2
    sget v13, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->SENDING:I

    sput v13, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    sget-object v13, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v13}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v13

    iget-object v14, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v14, v15}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v14

    const/16 v16, 0x0

    if-eqz v14, :cond_5

    const-string v13, "OtaApp"

    const-string v15, "CusSM.sendUpgradeStatus: send status to MDPM"

    invoke-static {v13, v15}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v13

    invoke-virtual {v13}, Lcom/motorola/otalib/common/metaData/MetaData;->getReleaseNotes()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v13

    invoke-virtual {v13}, Lcom/motorola/otalib/common/metaData/MetaData;->getPreInstallNotes()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->getReleaseNotesFromPreInstallNotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    :cond_4
    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v15

    invoke-virtual {v15}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result v15

    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/motorola/otalib/common/metaData/MetaData;->getReportingTags()Ljava/lang/String;

    move-result-object v17

    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v18

    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result v19

    const/16 v20, 0x1

    xor-int/lit8 v19, v19, 0x1

    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v21

    invoke-interface {v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v28, v13

    move/from16 v32, v15

    move-object/from16 v33, v18

    move/from16 v34, v19

    move-object/from16 v35, v21

    move-object/from16 v13, v22

    goto :goto_0

    :cond_5
    const/16 v20, 0x1

    move-object/from16 v35, v13

    move/from16 v32, v16

    move/from16 v34, v32

    const/4 v13, 0x0

    const/16 v17, 0x0

    const/16 v28, 0x0

    const/16 v33, 0x0

    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v15

    move-object/from16 p1, v13

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    sget-object v13, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->polling:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v13}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v13

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v18, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    :goto_1
    move-object/from16 v37, v18

    move-object/from16 v18, v2

    goto :goto_2

    :cond_6
    iget-object v13, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v13, v15}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v13

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v18, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    goto :goto_1

    :goto_2
    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v23

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v24

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object v25

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getTargetSha1()Ljava/lang/String;

    move-result-object v26

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v3

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getInfo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; trigger: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v29

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v30

    invoke-interface/range {v23 .. v35}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ZLjava/lang/String;)V

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v2, "Result"

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    const-string v3, "wait"

    invoke-virtual {v2, v15, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/CusSM;->startTimer(Ljava/lang/String;)I

    :cond_7
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getTime()J

    move-result-wide v2

    const-wide/16 v21, 0x3e8

    div-long v2, v2, v21

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getStatus()Ljava/lang/String;

    move-result-object v13

    const-string v15, "RS_OK"

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    const-string v13, "DONE"

    goto :goto_3

    :cond_8
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getStatus()Ljava/lang/String;

    move-result-object v13

    const-string v15, "RS_FAIL"

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    const-string v13, "FAILED"

    goto :goto_3

    :cond_9
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getStatus()Ljava/lang/String;

    move-result-object v13

    const-string v15, "RS_TEMP_OK"

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    const-string v13, "PROCESSING"

    goto :goto_3

    :cond_a
    const-string v13, "IGNORED"

    :goto_3
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v28, v4

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v29, v5

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getTargetSha1()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v30, v6

    iget-object v6, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-wide/from16 v31, v2

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HEALTH_CHECK_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object v3, v7

    move-object/from16 v33, v8

    const-wide/16 v7, -0x1

    invoke-virtual {v6, v2, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    move-object v8, v3

    const-wide/16 v2, 0x0

    cmp-long v6, v6, v2

    if-nez v6, :cond_b

    move/from16 v6, v20

    goto :goto_4

    :cond_b
    move/from16 v6, v16

    :goto_4
    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v7

    if-eqz v6, :cond_11

    sget-object v16, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual/range {v16 .. v16}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    goto :goto_6

    :cond_c
    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    goto :goto_5

    :cond_d
    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    const-string v7, "VABLowMemoryHealthCheck"

    goto :goto_7

    :cond_e
    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    const-string v7, "MergeRestartHealthCheck"

    goto :goto_7

    :cond_f
    :goto_5
    const-string v7, "PreInstallHealthCheck"

    goto :goto_7

    :cond_10
    :goto_6
    const-string v7, "PreDownloadHealthCheck"

    :cond_11
    :goto_7
    move-object/from16 v43, v7

    const-string v2, "Result"

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    const-string v2, "FAILED"

    invoke-virtual {v2, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->clearStats()V

    goto/16 :goto_a

    :cond_12
    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_OTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_13

    const-string v3, "stateStats"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_13

    goto :goto_9

    :cond_13
    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getNetwork()Ljava/lang/String;

    move-result-object v22

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v24

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getInfo()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_14

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getInfo()Ljava/lang/String;

    move-result-object v3

    goto :goto_8

    :cond_14
    const-string v3, ""

    :goto_8
    invoke-static {v3}, Lcom/motorola/otalib/common/errorCodes/ErrorCodeMapper;->getStatus(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getTrackingID()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v21, v2

    move-object/from16 v23, v17

    invoke-static/range {v21 .. v27}, Lcom/motorola/ccc/ota/stats/StatsHelper;->buildStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_9
    if-eqz v2, :cond_15

    :try_start_3
    const-string v3, "OtaApp"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object/from16 v57, v0

    goto :goto_b

    :catch_0
    move-exception v0

    :try_start_4
    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_15
    :goto_a
    const/16 v57, 0x0

    :goto_b
    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {v0, v2, v3, v14, v1}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver;->getInstallTypeHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; src: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; dest: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_16

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_c

    :cond_16
    const-string v2, ""

    :goto_c
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getInfo()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_17

    new-instance v2, Ljava/lang/StringBuilder;

    move-object/from16 v3, v33

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getInfo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_d

    :cond_17
    const-string v2, ""

    :goto_d
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; triggeredBy: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_UPGRADE_SOURCE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; installerType: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    if-eqz v2, :cond_18

    invoke-interface {v2}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->getCurrentInstallerType()Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e

    :cond_18
    const-string v2, "N/A"

    :goto_e
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". time: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v4, v31

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v30

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getApkVersion()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v29

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getCarrier()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v28

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAscDevice(Landroid/content/Context;)Z

    move-result v3

    const-string v4, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    move-object/from16 v7, v19

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :cond_19

    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    move-object/from16 v5, v18

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getAscVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : Campaign type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getCampaignType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : policyType="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getPolicyType(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : isAutoDownloadOverAnyDataNetwork="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAutoDownloadOverAnyDataNetworkPolicySet(Landroid/content/Context;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : isOtaUpdateDisabled="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isOtaUpdateDisabledPolicySet(Landroid/content/Context;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_19
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "appId"

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->APPIID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setSoftBankProxyData(Landroid/content/Context;)V

    new-instance v3, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MASTER_CLOUD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v39

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v40

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_CONTEXT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v41

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getContextKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getTrackingID()Ljava/lang/String;

    move-result-object v44

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATE_HTTP_SECURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v45

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATE_TEST_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v38, v3

    invoke-direct/range {v38 .. v46}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;

    invoke-static {v2}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v45

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-object/from16 v7, v37

    const-wide/16 v8, 0x0

    invoke-virtual {v5, v7, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v46

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceInfoAsJsonObject()Lorg/json/JSONObject;

    move-result-object v48

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v5

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getNetwork()Ljava/lang/String;

    move-result-object v30

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getApkVersion()I

    move-result v31

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v32

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INCREMENTAL_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object v35

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-object/from16 v29, v2

    move-object/from16 v34, p1

    move-object/from16 v36, v5

    invoke-static/range {v29 .. v36}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v49

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getIdentityInfoAsJsonObject(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v50

    const-string v53, "serialNumber"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ":"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Lcom/motorola/otalib/common/errorCodes/ErrorCodeMapper;->getStatus(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getReportingTag()Ljava/lang/String;

    move-result-object v55

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface {v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v56

    const/16 v52, 0x0

    move-object/from16 v44, v4

    move-object/from16 v51, v0

    invoke-direct/range {v44 .. v57}, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    new-instance v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static {v3}, Lcom/motorola/otalib/cdsservice/UrlConstructor/StateUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v18

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATE_HTTP_RETRIES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v7, 0x9

    invoke-virtual {v3, v5, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v19

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATE_HTTP_METHOD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v20

    new-instance v3, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v5, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v4}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/StateRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v5, v4}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v23

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v7, -0x1

    invoke-virtual {v4, v5, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v24

    const/16 v21, 0x0

    move-object/from16 v17, v0

    move-object/from16 v22, v3

    invoke-direct/range {v17 .. v24}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    new-instance v3, Lcom/motorola/ccc/ota/CusSM$3;

    invoke-direct {v3, v1, v12, v6}, Lcom/motorola/ccc/ota/CusSM$3;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;Z)V

    new-instance v4, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v4}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    const/4 v5, 0x0

    invoke-static {v2, v0, v3, v4, v5}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private shouldMoveToGettingPackage(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private startTimer(Ljava/lang/String;)I
    .locals 7

    const-string v0, "startTimer, IllegalStateException, Maybe canceled. Ignore it"

    const-string v1, "startTimer, IllegalArgumentException, ignore it."

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->getMetaData(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    const/4 v2, 0x0

    if-nez p1, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "startTimer, not setting the timer as description is null"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    monitor-enter p0

    :try_start_0
    sget-object v3, Lcom/motorola/ccc/ota/CusSM;->_mTimer:Ljava/util/Timer;

    if-nez v3, :cond_1

    new-instance v3, Lcom/motorola/ccc/ota/CusSM$defaultAction;

    invoke-direct {v3, p0, p1}, Lcom/motorola/ccc/ota/CusSM$defaultAction;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/otalib/common/metaData/MetaData;)V

    new-instance v4, Ljava/util/Timer;

    invoke-direct {v4}, Ljava/util/Timer;-><init>()V

    sput-object v4, Lcom/motorola/ccc/ota/CusSM;->_mTimer:Ljava/util/Timer;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getServiceTimeoutSeconds()I

    move-result p1

    mul-int/lit16 p1, p1, 0x3e8

    int-to-long v5, p1

    invoke-virtual {v4, v3, v5, v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    :cond_1
    const-string p1, "OtaApp"

    const-string v3, "defaultAction have been scheduled, do nothing"

    invoke-static {p1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v1, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit p0

    return v2

    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private stopTimer()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "stopTimer, cancel()"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_mTimer:Ljava/util/Timer;

    goto :goto_0

    :cond_0
    const-string v0, "OtaApp"

    const-string v1, "stopTimer, have stoped, do nothing"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private wifiDiscoverySanityCheck(Ljava/lang/String;)Z
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    const/4 v1, 0x0

    const-string v6, "OtaApp"

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithWiFiDiscoveryManager()V

    const-string p0, "CusSM.wifiDiscoverySanityCheck failed: something gone wrong with wifi discover time cann\'t be zero, abort the process"

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v7, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-gez v0, :cond_1

    const-string p0, "CusSM.wifiDiscoverySanityCheck failed: wifi discover time is not set nothing to process"

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "CusSM.wifiDiscoverySanityCheck: version is not in db "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusSM.wifiDiscoverySanityCheck failed: version %s that is with repository %s (expected upgrade/fota as repository)"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget-object v2, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v2, :cond_4

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->isBusy()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string p0, "CusSM.wifiDiscoverySanityCheck failed: downloading is in progress"

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_4
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_5

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_5

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusSM.wifiDiscoverySanityCheck failed: version %s that is in state %s (expected state GettingPackage or ABApplyingPatch)"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_5
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v2

    if-nez v2, :cond_6

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    filled-new-array {p1, p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusSM.wifiDiscoverySanityCheck failed: version %s that is in state %s not a WiFiOnly package %s (expected true)"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_6
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result p0

    if-eqz p0, :cond_7

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusSM.wifiDiscoverySanityCheck failed: version %s that is in state %s allowFotaOverAnyDatanetwork policy is enabled"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_7
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public varargs cancelModemUpdate([Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_0

    array-length v1, p1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    const/4 v2, 0x1

    aget-object p1, p1, v2

    invoke-virtual {p0, v0, v1, p1}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Moving update version:"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " to Result state as Modem update cancelled by server!!"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "MODEM_CANCELED_BY_SERVER."

    invoke-virtual {p0, v0, p1, v1}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public varargs declared-synchronized cancelOTA([Ljava/lang/String;)V
    .locals 10

    const-string v0, "CusSM.cancelOTA: found version "

    const-string v1, "Moving update version:"

    const-string v2, "Moving update version:"

    const-string v3, "CusSM.cancelOTA: getVersions\'s version "

    const-string v4, "CusSM.cancelOTA: Ota is in state="

    const-string v5, "CusSM.cancelOTA: getVersions\'s version is "

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v7, v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v7

    const/4 v8, 0x0

    if-eqz v7, :cond_3

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v9, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v5, v9, :cond_2

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v9, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v5, v9, :cond_0

    goto/16 :goto_0

    :cond_0
    const-string v4, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "; getDescription\'s version"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " in database with state ("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    :cond_1
    sget-object v0, Lcom/motorola/ccc/ota/CusSM$5;->$SwitchMap$com$motorola$otalib$common$Environment$ApplicationEnv$PackageState:[I

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ordinal()I

    move-result v3

    aget v0, v0, v3

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    :pswitch_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelUpdateNotification()V

    goto :goto_1

    :pswitch_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NET:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-interface {v0, v3, v8, v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelUpdateNotification()V

    goto :goto_1

    :pswitch_3
    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    sget-object v4, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {v0, v3, v4}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    goto :goto_1

    :pswitch_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelDownloadNotification()V

    goto :goto_1

    :cond_2
    :goto_0
    const-string p1, "OtaApp"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " OTA update can not be canceled at MergePending or MergeRestart state"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_3
    :try_start_1
    const-string v0, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",  but could not get its description"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->cancelAlarm(Landroid/content/Context;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " to Result state as Modem update cancelled by server!!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MODEM_CANCELED_BY_SERVER."

    goto :goto_2

    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " to Result state as OTA cancelled by server!!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CANCELED_BY_SERVER."

    :goto_2
    if-eqz p1, :cond_6

    array-length v2, p1

    const/4 v3, 0x2

    if-lt v2, v3, :cond_6

    const/4 v0, 0x1

    aget-object v1, p1, v0

    const-string v2, "DEVICE_UNDER_SYSTEM_UPDATE_POLICY."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendOngoingFotaPolicySetCancelIntent(Landroid/content/Context;)V

    :cond_5
    aget-object v1, p1, v8

    aget-object p1, p1, v0

    invoke-virtual {p0, v6, v1, p1}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_6
    invoke-virtual {p0, v6, v0, v1}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public createReserveSpace()V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/CusSM$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/CusSM$4;-><init>(Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public declared-synchronized failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";  AddOnInfo: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/CusSM;->failProgress(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    const-string v0, "Something gone wrong, Server told to cancel the package with version: "

    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    sput-object v2, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p1, "OtaApp"

    const-string p2, "no version found for this version in db,drop the request to floor"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v7, 0x0

    move-object v5, p1

    move-object v8, p2

    move-object v9, p3

    invoke-interface/range {v4 .. v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->scheduleCreateReserveSpace()V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->getUpgradeStatusConstants(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    move-result-object p2

    invoke-direct {p0, v1, p2}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    :goto_0
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized forceDownload()V
    .locals 6

    const-string v0, "CusSM.forceDownload: found version "

    const-string v1, "CusSM.forceDownload: getVersions\'s version "

    const-string v2, "CusSM.forceDownload: getVersions\'s version is "

    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v4, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v4

    if-eqz v4, :cond_2

    const-string v2, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "; getDescription\'s version"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " in database with state ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMaxForceDownloadDeferTime()J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getForceDownloadDelay(J)I

    move-result v0

    if-gtz v0, :cond_1

    const-string v0, "autoCellularDownload"

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->AUTOMATIC_DOWNLOAD_FOR_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    int-to-long v2, v0

    invoke-interface {v1, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->registerWithForceUpgradeManager(J)V

    :goto_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_1

    :cond_2
    const-string v0, "OtaApp"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",  but could not get its description"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized forceUpgrade()V
    .locals 6

    const-string v0, "CusSM.forceUpgrade: found version "

    const-string v1, "CusSM.forceUpgrade: getVersions\'s version "

    const-string v2, "CusSM.forceUpgrade: getVersions\'s version is "

    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v4, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v4

    if-eqz v4, :cond_4

    const-string v2, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "; getDescription\'s version"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " in database with state ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/CusSM$5;->$SwitchMap$com$motorola$otalib$common$Environment$ApplicationEnv$PackageState:[I

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    const/4 v2, 0x4

    if-eq v0, v2, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_3

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.forceUpgrade, resend the intent used to show install screen"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v0, v4}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->promptUpgradeActivity(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-direct {p0, v3, v0}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    goto :goto_0

    :cond_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.forceUpgrade, no state transistion required"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelUpdateNotification()V

    const-string v0, "OtaApp"

    const-string v2, "CusSM.forceUpgrade, state transition to GettingDescriptor"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "forceUpgrade"

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v2, 0x0

    invoke-interface {v0, v3, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus()V

    goto :goto_0

    :cond_3
    :pswitch_1
    const-string v0, "OtaApp"

    const-string v1, "CusSM.forceUpgrade, no state transistion required"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelDownloadNotification()V

    goto :goto_0

    :cond_4
    const-string v0, "OtaApp"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",  but could not get its description"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public declared-synchronized getCurrentState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IDLE:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    if-nez p1, :cond_1

    sget-object p1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IDLE:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_1
    :try_start_2
    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getDeviceAdditionalInfo()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    return-object p0
.end method

.method public getMetaData(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {p0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "Description is null"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    return-object p0
.end method

.method public declared-synchronized handleStateWebResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;ILjava/lang/String;Ljava/lang/String;)Z
    .locals 4

    const-string v0, "CusSM.handleStateWebResponse: received http error "

    const-string v1, "duplicate state response with id "

    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status(I)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    const-string p1, "OtaApp"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v3

    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-eq v1, v2, :cond_4

    const-string p2, "OtaApp"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result p1

    if-eqz p1, :cond_1

    sget p1, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->IDLE:I

    sput p1, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    goto :goto_0

    :cond_1
    sget p1, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->WAITING_FOR_NETWORK:I

    sput p1, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    :goto_0
    invoke-direct {p0, p4}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p3, "continue"

    invoke-virtual {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p3, "continue"

    invoke-virtual {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    monitor-exit p0

    return v3

    :cond_4
    :try_start_2
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/StateResponseBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;

    move-result-object p1

    if-nez p1, :cond_6

    sget p1, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->IDLE:I

    sput p1, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->isServiceControlEnabled()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->stopTimer()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p3, "continue"

    invoke-virtual {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p3, "continue"

    invoke-virtual {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_5
    monitor-exit p0

    return v3

    :cond_6
    :try_start_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_7

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/CusSM;->handleModemStateResponse(Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;ILjava/lang/String;)V

    goto :goto_2

    :cond_7
    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/CusSM;->handleStateResponse(Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;ILjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_2
    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public initializeInstaller()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {v1, v2, v3, v0, p0}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver;->getInstallTypeHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    move-result-object p0

    sput-object p0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    :cond_1
    return-void
.end method

.method public declared-synchronized isBusy()Z
    .locals 3

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eq v0, v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isModemBusy()Z
    .locals 5

    const-string v0, "Modem update is at state = "

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x0

    if-nez v1, :cond_0

    monitor-exit p0

    return v2

    :cond_0
    :try_start_1
    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eq v0, v1, :cond_1

    const/4 v2, 0x1

    :cond_1
    monitor-exit p0

    return v2

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isRoaming()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/motorola/ccc/ota/CusSM;->_isRoaming:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized moveFotaToGettingDescriptorState()V
    .locals 5

    const-string v0, "CusSM.moveFotaToGettingDescriptorState failed: Either repository is not fota "

    const-string v1, "CusSMmoveFotaToGettingDescriptorState.: version is not in db "

    monitor-enter p0

    :try_start_0
    const-string v2, "OtaApp"

    const-string v3, "CusSm.moveFotaToGettingDescriptorState "

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v3, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v3

    if-nez v3, :cond_0

    const-string v0, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v1

    sget-object v4, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v1, v4, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "OtaApp"

    const-string v1, "CusSM.moveFotaToGettingDescriptorState"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    invoke-interface {v0, v2, v1, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :goto_0
    :try_start_2
    const-string v1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "or not in expected state Notified "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onActionBatteryChanged(Z)V
    .locals 5

    const-string v0, "CusSM.onActionBatteryChanged: notification for version is not in db "

    const-string v1, "CusSM:onActionBatteryChanged:batteryLow="

    monitor-enter p0

    :try_start_0
    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string p1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v0

    const/4 v3, 0x1

    if-eqz v0, :cond_3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v4, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendBatteryChangedIntentToFota(Landroid/content/Context;Z)V

    if-eqz p1, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result p1

    if-nez p1, :cond_2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    const-string v0, "showDownloadProgress"

    invoke-static {p1, v0, v3}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Z)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    :cond_3
    if-eqz p1, :cond_9

    :try_start_2
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, v0, :cond_4

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, v0, :cond_4

    const-string p1, "OtaApp"

    const-string v0, "CusSM.onActionBatteryChanged failed: notification for version %s that is in state %s (expected state GettingPackage)"

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    :try_start_3
    sget-object p1, Lcom/motorola/ccc/ota/CusSM$5;->$SwitchMap$com$motorola$otalib$common$Environment$ApplicationEnv$PackageState:[I

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ordinal()I

    move-result v0

    aget p1, p1, v0

    if-eq p1, v3, :cond_7

    const/4 v0, 0x2

    if-eq p1, v0, :cond_5

    goto :goto_1

    :cond_5
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionBatteryLow()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p1

    if-eqz p1, :cond_a

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result p1

    if-nez p1, :cond_a

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    const-string v0, "showDownloadProgress"

    invoke-static {p1, v0, v3}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Z)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    goto :goto_1

    :cond_6
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_1

    :cond_7
    sget-object p1, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz p1, :cond_8

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->radioGotDown()V

    goto :goto_1

    :cond_8
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_1

    :cond_9
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_a
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onActionGetDescriptor(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 3

    const-string v0, "CusSM.onActionGetDescriptor: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    if-nez v1, :cond_0

    const-string p2, "OtaApp"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_1

    const-string p2, "OtaApp"

    const-string p3, "CusSM.onActionGetDescriptor failed: notification for version %s that is in state %s (expected state GettingPackage)"

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    const-string v0, "OtaApp"

    const-string v2, "CusSM.onActionGetDescriptor: reset download status flag"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    sput-object v1, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_2
    const-string v0, "OtaApp"

    invoke-static {v0, p3}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object p3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p2, p1, p3, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto :goto_0

    :cond_3
    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p2, p1, v0, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto :goto_0

    :cond_4
    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p2, p1, v0, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    :goto_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onDestroy()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.onDestroy"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->close()V

    iput-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    sput-object v1, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->releasePlugins()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onDeviceShutdown()V
    .locals 2

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->onDeviceShutdown()V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->onIntentHandleRebootDuringABUpdate()V

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEVICE_REBOOTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ota_update_completed"

    invoke-static {p0, v1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->updateMotorolaSettingsProvider(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method public declared-synchronized onIntentABApplyingPatchCompleted(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 10

    const-string v0, "CusSM.onIntentABUpgradeCompleted : annoyString = "

    const-string v1, "CusSM.getInstallReminder : "

    const-string v2, "CusSM.onIntentABUpgradeCompleted failed: Not in ab applying patch state, version "

    const-string v3, "CusSM.onIntentABUpgradeCompleted: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v5, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v5

    if-nez v5, :cond_0

    const-string p1, "OtaApp"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v3, v6, :cond_1

    const-string p1, "OtaApp"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    invoke-static {v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isROREnabled(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->prepareForUnattendedUpdate()V

    :cond_2
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v6, -0x1

    invoke-virtual {v2, v3, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    const-wide/16 v8, 0x0

    cmp-long v2, v2, v8

    if-lez v2, :cond_3

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithForceUpgradeManager()V

    :cond_3
    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 p3, 0x0

    invoke-interface {p1, v4, p2, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->key()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_EXTENDED_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->key()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupFiles()V

    const-string p1, "OtaApp"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p3

    invoke-virtual {p3}, Lcom/motorola/otalib/common/metaData/MetaData;->getInstallReminder()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disableBatteryStatusReceiver()Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_4
    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSeverity()I

    move-result p1

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->ordinal()I

    move-result p2

    if-ne p1, p2, :cond_5

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v5, p1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->settingMaxDeferTimeForCriticalUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto :goto_0

    :cond_5
    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->isForceInstallTimeSet()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p3

    invoke-virtual {p3}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceInstallTime()D

    move-result-wide v2

    const-wide v4, 0x4194997000000000L    # 8.64E7

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    double-to-long v0, v0

    invoke-virtual {p1, p2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    const-string p1, "OtaApp"

    const-string p2, "CusSM.onIntentABUpgradeCompleted: Force install set"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_6
    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getInstallReminder()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_7

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getInstallReminder()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setMandatoryInstallDays(Ljava/lang/String;)V

    :cond_7
    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p2

    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->informPendingRebootInfo(Landroid/content/Context;J)V

    goto :goto_1

    :cond_8
    const-string p1, "/data/misc/update_engine_log/update_engine.log"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/FileUtils;->getFailureDetailsFromFileToUpload(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v4, v5, p1, p3}, Lcom/motorola/ccc/ota/CusSM;->resetToUpgradeFailure(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onIntentASCSessionDone(IJLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 5

    const-string v0, "Update is cancelled by ASC, version: "

    const-string v1, "ASC Session was completed; ascErrorCode="

    monitor-enter p0

    :try_start_0
    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ASC_TRANSACTION_ID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {p4, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    cmp-long p2, p2, v2

    if-eqz p2, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "Transaction id mismatch, ignore the session"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->cancelASCTimeoutAlarm(Landroid/content/Context;)V

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ASC_SESSION_TIMEOUT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p4, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ASC_TRANSACTION_ID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p4, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    const/4 p3, -0x2

    if-ne p1, p3, :cond_1

    const-string p3, "OtaApp"

    const-string p4, "Intimating ASC about the OTA request session timout"

    invoke-static {p3, p4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p3, Landroid/content/Intent;

    const-string p4, "com.motorola.ccc.ota.ACTION_ASC_OTA_TIMEOUT"

    invoke-direct {p3, p4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p4, "TRANSACTION_ID"

    invoke-virtual {p3, p4, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p4, "com.motorola.ccc.ota.permission.INTERACT_OTA_ASC_SERVICE"

    invoke-virtual {p2, p3, p4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    :cond_1
    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->ascRequestUpdateResponse(I)Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    move-result-object p2

    const-string p3, "OtaApp"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p4, " , otaASCErrorCode="

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    const/4 p3, 0x0

    const/4 p4, 0x2

    invoke-interface {p1, p2, p4, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_ASC_ALLOWED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne p2, p1, :cond_2

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_0

    :cond_2
    new-array p1, p4, [Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p4, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object p4

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    aput-object p2, p1, p3

    const-string p2, "KEY_UPDATE_FAILED_BY_ASC."

    const/4 p3, 0x1

    aput-object p2, p1, p3

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onIntentAllocateSpaceResult(J)V
    .locals 8

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    const-wide/16 v3, 0x0

    cmp-long v3, p1, v3

    const-wide/32 v4, 0x3200000

    if-ltz v3, :cond_0

    add-long/2addr p1, v4

    :cond_0
    invoke-static {p1, p2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    const-string v3, "OtaApp"

    if-nez v2, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "CusSM.onIntentAllocateSpaceResult: notification for version is not in db "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "CusSM.onIntentAllocateSpaceResult, freeSpaceReq = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " State = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v4, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v4}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->onAllocateSpaceResult()V

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v4

    sget-object v5, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v4, v5, :cond_8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v4

    cmp-long v4, p1, v4

    if-gtz v4, :cond_2

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_ALLOCATE_SPACE_SUCESS:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {p1, p2, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v0, 0x0

    invoke-interface {p1, v1, p2, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->unregisterFromHealthCheck()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->RESERVE_SPACE_CLEAR_VAB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "Clearing reserve space"

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v4

    sub-long v4, p1, v4

    const-wide/32 v6, 0x100000

    div-long/2addr v4, v6

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "onIntentAllocateSpaceResult:freeSpaceReq="

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ": avail space="

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " spaceToBeFreed="

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " MB"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v4, v5}, Lcom/motorola/ccc/ota/CusSM;->freeFromReserveSpace(J)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "CusSM-ExtraSpace: deleting of reserve files successful"

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_3
    const-string v0, "CusSM-ExtraSpace: deleting of reserve files not successful"

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->RESERVE_SPACE_CLEAR_VAB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v5, 0x1

    invoke-virtual {v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VAB_MAKE_SPACE_REQUEST_USER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result p2

    const-string v0, "FotaUpgradeSource.onIntentAllocateSpaceResult failed: "

    if-eqz p2, :cond_4

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "  5 "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getFotaServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;

    move-result-object p2

    const-wide/16 v3, 0x472

    const/4 v0, 0x5

    invoke-interface {p2, v3, v4, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    goto :goto_0

    :cond_4
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "  "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Object;

    const-string v0, "fota installation failed due to allocation of space for update"

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result v0

    const-string v2, "FAILED_FOTA."

    if-eqz v0, :cond_5

    invoke-virtual {p0, v1, p1, p2, v2}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    invoke-virtual {p0, v1, p2, v2}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_6
    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/CusSM;->requestUserToAllocateSpace(J)V

    goto :goto_2

    :cond_7
    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/CusSM;->requestUserToAllocateSpace(J)V

    :goto_2
    return-void

    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "CusSM.onIntentAllocateSpaceResult, failed: for version "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " that is in state "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " (expected state VerifyAllocateSpace))"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized onIntentBackgroundInstallCancelResponse()V
    .locals 5

    const-string v0, "CusSM.onIntentBackgroundInstallCancelResponse: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    const-string v0, "OtaApp"

    const-string v3, "CusSM.onIntentBackgroundInstallCancelResponse failed: notification for version %s that is in state %s (expected state ABApplyingPatch or Getting descriptor)"

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    const-string v0, "user declined to accept the download"

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VITAL_UPDATE_CANCEL_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {v4}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ";  AddOnInfo: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "USER_CANCELED_DOWNLOAD."

    invoke-direct {p0, v1, v2, v0, v3}, Lcom/motorola/ccc/ota/CusSM;->failProgress(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onIntentBackgroundInstallResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 4

    const-string v0, "CusSM.onIntentBackgroundInstallResponse: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string p1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    const-string p1, "OtaApp"

    const-string v0, "CusSM.onIntentBackgroundInstallResponse failed: notification for version %s that is in state %s (expected state GettingDescriptor or ABApplyingPatch)"

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    sget-object v0, Lcom/motorola/ccc/ota/CusSM$5;->$SwitchMap$com$motorola$otalib$common$utils$UpgradeUtils$DownloadStatus:[I

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    goto :goto_1

    :cond_2
    sget-object p1, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_USER_CANCEL:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {p1, v0, v1}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldIForceSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "userResumeCellularForSmartUpdate"

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double p1, v0, v2

    if-lez p1, :cond_5

    const-string p1, "userResumeCellular"

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "userResumeCellularATT"

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sendFotaDownloadModeChanged(Landroid/content/Context;)V

    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->AUTOMATIC_DOWNLOAD_FOR_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithForceUpgradeManager()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onIntentCheckForUpdate(ZIZ)V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isCtaVersion(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "OtaApp"

    if-eqz v0, :cond_0

    const-string p1, "Cta Version, showing permission dialog to allow or deny the updates"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_CTA_BG_DATA_DISABLED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    const/4 p3, 0x0

    invoke-interface {p0, p1, p2, p3, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    return-void

    :cond_0
    invoke-direct {p0, p2, p1}, Lcom/motorola/ccc/ota/CusSM;->checkIfAlreadyUpdating(IZ)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "sdcard intiated by user"

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->checkForUpdateInSDCard(Ljava/lang/String;)V

    invoke-direct {p0, p2, p1}, Lcom/motorola/ccc/ota/CusSM;->checkIfAlreadyUpdating(IZ)Z

    move-result v0

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATING_VALIDATION_FILE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object p3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p3

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_VALIDATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p3, v0, p2, p1, p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    return-void

    :cond_1
    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_REQUESTING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-interface {v0, v3, p2, p1, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    new-instance v0, Lcom/motorola/ccc/ota/CusPolicy;

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->cm:Landroid/net/ConnectivityManager;

    invoke-direct {v0, v1}, Lcom/motorola/ccc/ota/CusPolicy;-><init>(Landroid/net/ConnectivityManager;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->isRoaming()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/CusPolicy;->canICheckForUpdate(Z)Z

    move-result v0

    if-nez v0, :cond_3

    const-string p3, "[OTA] I can\'t check it, because of our policy - refer to CusPolicy!!"

    invoke-static {v2, p3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    sget-object p3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NET:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-interface {p0, p3, p2, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V

    return-void

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FOTA-BOTA check order is "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_ORDER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_ORDER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->resolveCheckForUpdateRepository()Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v0

    if-eqz p1, :cond_4

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->bootstrap:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    :cond_4
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object p0

    invoke-virtual {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->checkForUpdate(ZIZ)V

    return-void
.end method

.method public declared-synchronized onIntentDeviceDatasaverModeChanged()V
    .locals 4

    const-string v0, "CusSM.onIntentDeviceOnDataSaverModeChanged: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->isDeviceInDatasaverMode()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "OtaApp"

    const-string v1, "User enabled data saver, can not access background data"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->radioGotDown()V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionDataSaverDuringABStreaming()V

    goto :goto_0

    :cond_2
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v1, :cond_3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v1, :cond_3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v1, :cond_3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v1, :cond_3

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_4

    :cond_3
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onIntentDeviceIdleModeChanged()V
    .locals 7

    const-string v0, "CusSM.onIntentDeviceIdleModeChanged: version is not in db "

    const-string v1, "CusSM.onIntentDeviceIdleModeChanged, deviceIdle : "

    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->isDeviceInIdleMode()Z

    move-result v2

    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v1, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_4

    :cond_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->isForceInstallTimeSet()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, -0x1

    invoke-virtual {v3, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    cmp-long v0, v0, v3

    if-gtz v0, :cond_3

    :cond_2
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreInstallScreen()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_3
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    :cond_4
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_7

    const-string v0, "OtaApp"

    const-string v1, "Device is in MergeRestart state, so rebooting device in doze mode"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_RESTARTED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_5
    const-string v0, ""

    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",Doze Mode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_RESTARTED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendMergeRestartIntent(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_7
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onIntentDmCancelUpgrade(Ljava/lang/String;)V
    .locals 13

    const-string v0, "Modem Update is cancelled by DM, version: "

    const-string v1, "Update is cancelled by DM, version: "

    const-string v2, "onIntentDmCancelUpgrade:repository="

    monitor-enter p0

    :try_start_0
    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v3

    :goto_0
    const-string v4, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    const-string v1, "invalid"

    const-string v2, "invalid"

    const-string v3, "invalid"

    const-string v4, " cancelled by DM"

    const-string v5, "invalid"

    const-string v6, "invalid"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-string v10, "invalid"

    sget-object p1, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-interface/range {v0 .. v12}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ZLjava/lang/String;)V

    const-string p1, "OtaApp"

    const-string v0, "CusSM.onIntentDmCancelUpgrade, No ongoing OTA, SU cancel is denied."

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-eqz p1, :cond_2

    new-array p1, v5, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v4

    const-string v0, "MODEM_CANCELED_BY_SERVER."

    aput-object v0, p1, v2

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_2
    new-array p1, v5, [Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v4

    const-string v0, "OMADM_CANCELED_UPDATE."

    aput-object v0, p1, v2

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onIntentDownloadNotificationResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 5

    const-string v0, "CusSM.onIntentDownloadNotificationResponse: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string p1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    const-string p1, "OtaApp"

    const-string v0, "CusSM.onIntentDownloadNotificationResponse failed: notification for version %s that is in state %s (expected state GettingPackage/GettingDescriptor)"

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    sget-object v0, Lcom/motorola/ccc/ota/CusSM$5;->$SwitchMap$com$motorola$otalib$common$utils$UpgradeUtils$DownloadStatus:[I

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_5

    const/4 v1, 0x2

    if-eq p1, v1, :cond_2

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldIForceSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "userResumeCellularForSmartUpdate"

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmpl-double p1, v1, v3

    if-lez p1, :cond_4

    const-string p1, "userResumeCellular"

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->AUTOMATIC_DOWNLOAD_FOR_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithForceUpgradeManager()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_1

    :cond_5
    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v0, "user declined to accept the download"

    const-string v2, "USER_CANCELED_DOWNLOAD."

    invoke-virtual {p0, v1, p1, v0, v2}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onIntentForceUpgradeTimerExpiry()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceUpgradeTime()I

    move-result v1

    if-lez v1, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->forceUpgradeTimerExpired()V

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->forceDownloadTimerExpired()V

    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized onIntentFotaDownloadCompleted(JILjava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getCurrentState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    if-eq v0, v1, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "CusSM.downloadCompleted()state machine not in getting package state so return"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->downloadCompleted(JILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onIntentFotaDownloadModeChanged()V
    .locals 3

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getCurrentState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v2, v1, :cond_3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->startFotaWifiDiscoveryTimer()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cleanFotaWifiDiscoveryTimer()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onIntentFotaDownloadModeChanged(JZ)V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getCurrentState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->downloadModeChanged(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onIntentFotaRequestUpdateResponse(JI)V
    .locals 3

    const-string v0, "CusSM.requestUpdateResponse: fota is authoritative, post response "

    monitor-enter p0

    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->fotaRequestUpdateResponse(JI)Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    move-result-object p3

    const-string v1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    long-to-int p1, p1

    const/4 p2, 0x0

    invoke-interface {v0, p3, p1, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onIntentFotaUpdateAvailable(JJLjava/lang/String;ZLjava/lang/String;Z)V
    .locals 12

    move-object v1, p0

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IDLE:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getCurrentState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    if-eq v0, v2, :cond_0

    const-string v0, "OtaApp"

    const-string v2, "CusSm.onIntentFotaUpdateAvailable state machine not in Idle state"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v3

    move-wide v4, p1

    move-wide v6, p3

    move-object/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    move/from16 v11, p8

    invoke-virtual/range {v3 .. v11}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->updateAvailable(JJLjava/lang/String;ZLjava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onIntentHandleRebootDuringABUpdate()V
    .locals 14

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    const-string v2, "OtaApp"

    if-nez v1, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "CusSM.onIntentHandleRebootDuringABUpdate: notification for version is not in db "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getAvailableDataPartitionSize()J

    move-result-wide v3

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v7, "DATA_OUT_OF_SPACE."

    const-string v8, "Device on low memory, available space: "

    const-wide/32 v9, 0x3200000

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x2

    if-eq v5, v6, :cond_4

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v5, v6, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v5, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v5, :cond_2

    cmp-long v0, v3, v9

    if-gtz v0, :cond_7

    new-array v0, v13, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v12

    aput-object v7, v0, v11

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_2
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v3, :cond_3

    const-string v0, "CusSM.onIntentHandleRebootDuringABUpdate: device rebooted during abapplying patch set"

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setTotalInstallTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto/16 :goto_1

    :cond_3
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_7

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_REBOOT_FAILURE_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto/16 :goto_1

    :cond_4
    :goto_0
    const-string v5, "CusSM.onIntentHandleRebootDuringABUpdate: device rebooted during querying state"

    invoke-static {v2, v5}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    iget-object v5, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v2, v1, v5}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->shouldICancelOngoingOtaUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v1

    if-eqz v1, :cond_5

    new-array v0, v13, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Device is under system update policy, can not update the device : policy type="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : OtaUpdateDisabled policy set = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledPolicySet()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : freeze periods = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getFreezePeriods()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v12

    const-string v1, "DEVICE_UNDER_SYSTEM_UPDATE_POLICY."

    aput-object v1, v0, v11

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    return-void

    :cond_5
    cmp-long v1, v3, v9

    if-gtz v1, :cond_6

    new-array v0, v13, [Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v12

    aput-object v7, v0, v11

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    return-void

    :cond_6
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BOOT_START_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    invoke-interface {v1, v0, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_ATTEMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    const-string p0, "accidentalPowerOff"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    :cond_7
    :goto_1
    return-void
.end method

.method public declared-synchronized onIntentInstallSystemUpdateNotificationResponse(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    const-string v0, "CusSM.onIntentInstallSystemUpdateNotificationResponse: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string p1, "OtaApp"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    const-string p1, "OtaApp"

    const-string p2, "CusSM.onIntentInstallSystemUpdateNotificationResponse failed: notification for version %s that is in state %s (expected state Querying or querying install)"

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    :cond_2
    const-string v0, "Install"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v0, "Restart"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onIntentLaunchUpgrade(Ljava/lang/String;ZZLjava/lang/String;)V
    .locals 7

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.onIntentLaunchUpgrade: procceed with upgrade to version %s ? %s checkForLowBattery: %b"

    if-eqz p2, :cond_0

    const-string v2, "yes"

    goto :goto_0

    :cond_0
    const-string v2, "no"

    :goto_0
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    filled-new-array {p1, v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p2, "OtaApp"

    const-string p3, "CusSM.onIntentLaunchUpgrade failed: Launch of version %s is not in db, giving up"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v1, v2, :cond_2

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v1, v2, :cond_2

    const-string p2, "OtaApp"

    const-string p3, "CusSM.onIntentLaunchUpgrade failed: Launch of version %s in state %s (expected state Querying)"

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p4

    invoke-virtual {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p4

    filled-new-array {p1, p4}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    if-nez p2, :cond_3

    :try_start_2
    sget-object p2, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_Launching_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-direct {p0, v0, p2}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v5, "user declined to launch upgrade"

    const-string v6, "USER_CANCELED_UPDATE."

    const/4 v4, 0x0

    move-object v2, p1

    invoke-interface/range {v1 .. v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p2

    sget-object p3, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-interface {p1, p2, p3}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    goto :goto_2

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p2

    if-eqz p3, :cond_4

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isBatteryLow(Landroid/content/Context;)Z

    move-result p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p2, :cond_5

    :try_start_3
    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p2

    sget-object p3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->LOW_BATTERY_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p4

    invoke-static {p4}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object p4

    invoke-interface {p2, p1, p3, p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catch_0
    move-exception p2

    :try_start_4
    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/CusSM;->resetStateForJSONException(Ljava/lang/String;Lorg/json/JSONException;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :cond_4
    :try_start_5
    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isInActiveCall(Landroid/content/Context;)Z

    move-result p3

    if-nez p3, :cond_7

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMapsNavigationRunning(Landroid/content/Context;)Z

    move-result p3

    if-eqz p3, :cond_5

    goto :goto_3

    :cond_5
    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {p4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object p3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 p4, 0x0

    invoke-interface {p2, p1, p3, p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->key()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    const-wide/32 p2, 0x5265c00

    invoke-static {v0, p2, p3, p1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->settingMaxDeferTimeForFOTAUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;JLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_6
    :goto_2
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return-void

    :cond_7
    :goto_3
    :try_start_6
    new-instance p1, Landroid/content/Intent;

    const-string p3, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {p1, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isInActiveCall(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_8

    const-string p1, "OtaApp"

    const-string p3, "Device is in call, so it can not be rebooted "

    invoke-static {p1, p3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const p1, 0x7f0e0172

    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_4

    :cond_8
    const-string p1, "OtaApp"

    const-string p3, "Maps is running, so device can not be rebooted "

    invoke-static {p1, p3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const p1, 0x7f0e0173

    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_4
    new-instance p3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p4

    invoke-direct {p3, p4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p4, Lcom/motorola/ccc/ota/CusSM$1;

    invoke-direct {p4, p0, p2, p1}, Lcom/motorola/ccc/ota/CusSM$1;-><init>(Lcom/motorola/ccc/ota/CusSM;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onIntentOtaServiceStop()V
    .locals 4

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    const-string v2, "OtaApp"

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "CusSM:onIntentOtaServiceStop - setup update is not done don\'t stop OTA service"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string p0, "CusSM:onIntentOtaServiceStop - stopping ota service"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopOtaService(Landroid/content/Context;)V

    return-void

    :cond_1
    const-string p0, "CusSM:onIntentOtaServiceStop - Version or State tables are not empty, so OtaService can\'t be stopped"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onIntentSmartUpdateConfigChanged(Z)V
    .locals 1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "CusSM:onIntentSmartUpdateConfigChanged:isSmartUpdateEnabled="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const-string p0, "215"

    goto :goto_0

    :cond_0
    const-string p0, "216"

    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendDmAlertDeviceReqNotification(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized onIntentSystemUpdateNotificationResponse(Ljava/lang/String;)V
    .locals 4

    const-string v0, "CusSM.onIntentSystemUpdateAvailableNotificationResponse: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string p1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v3, :cond_1

    const-string p1, "OtaApp"

    const-string v0, "CusSM.onIntentSystemUpdateAvailableNotificationResponse failed: notification for version %s that is in state %s  (expected state Notified or RequestPermission)"

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    :cond_2
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onIntentUpdateNotificationResponse(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 8

    const-string v0, "CusSM.onIntentUpdateNotificationResponse: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    if-nez v1, :cond_0

    const-string p2, "OtaApp"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v0, v2, :cond_1

    const-string p2, "OtaApp"

    const-string p3, "CusSM.onIntentUpdateNotificationResponse failed: notification for version %s that is in state %s (expected state Notified or Request_Permission)"

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p4

    invoke-virtual {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p4

    filled-new-array {p1, p4}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    if-nez p2, :cond_3

    :try_start_2
    sget-object p2, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_The_Request_Notification:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-direct {p0, v1, p2}, Lcom/motorola/ccc/ota/CusSM;->sendPluginUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eqz p3, :cond_2

    goto :goto_0

    :cond_2
    const-string p3, "user declined to accept the upgrade"

    :goto_0
    move-object v6, p3

    const-string v7, "USER_CANCELED_UPDATE."

    const/4 v5, 0x0

    move-object v3, p1

    invoke-interface/range {v2 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATE_FAIL_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->enableReceiversForBatteryLow()V

    :cond_4
    invoke-static {p4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendDownloadModeStats(Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p2

    sget-object p4, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {p4}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_6

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p2

    sget-object p4, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {p4}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    goto :goto_1

    :cond_5
    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object p4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p2, p1, p4, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto :goto_2

    :cond_6
    :goto_1
    if-eqz p3, :cond_7

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p4, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_7
    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object p3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 p4, 0x0

    invoke-interface {p2, p1, p3, p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    :goto_2
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onIntentVABCleanupAppliedPayload(I)V
    .locals 10

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMetaSourceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    const-string v2, "OtaApp"

    if-nez v1, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "CusSM.onIntentVABCleanupAppliedPayload: version is not in db "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    sget-object v3, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    check-cast v3, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->clearUEInstallerBeforeExit()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Exception in onIntentVABCleanupAppliedPayload:msg="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_REBOOT_FAILURE_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    const-string v5, "null"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    const-string v3, ""

    :cond_2
    sget v5, Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;->APPLY_MERGE_CORRUPTED:I

    const-string v6, "MERGE_STATUS_DEVICE_CORRUPTED"

    const-string v7, ",Failure"

    const/4 v8, 0x1

    if-ne v5, p1, :cond_3

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_UPDATE_FAILED_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v9, "Device Corrupted"

    invoke-virtual {v2, v5, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v5, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "cleanupAppliedPayload failed due to device corrupted  : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, v1, p1, v6}, Lcom/motorola/ccc/ota/CusSM;->resetToUpgradeFailure(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_3
    sget v5, Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;->APPLY_PAYLOAD_FAILURE:I

    if-ne v5, p1, :cond_4

    if-lt v2, v8, :cond_4

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_UPDATE_FAILED_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v9, "Merge failure count exceeded"

    invoke-virtual {v2, v5, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v5, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "cleanupAppliedPayload failed due to merge failure count exceeded, so assuming device corrupted  : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, v1, p1, v6}, Lcom/motorola/ccc/ota/CusSM;->resetToUpgradeFailure(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    sget v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;->APPLY_PAYLOAD_SUCCESS:I

    if-ne v2, p1, :cond_5

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, ",Success"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-direct {p0, v0, v1}, Lcom/motorola/ccc/ota/CusSM;->resetToUpgradeSuccess(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v2, 0x0

    invoke-interface {p1, v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_PROCESS_RUNNING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    return-void
.end method

.method public onIntentVABVerifyPayloadStatus(Z)V
    .locals 6

    const-string v0, "/payload_metadata.bin"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onIntentVABVerifyPayloadStatus:isVABValidationSuccess="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_VALIDATION_SUCCESS:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v3, v1, v1, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_VALIDATION_FAILURE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v3, v1, v1, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    :goto_0
    :try_start_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATING_VALIDATION_FILE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    const-string v3, ".zip"

    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getDownloadDataDirectory()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->forceDelete(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Exception occurred while deleting extracted verified files:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPDATING_VALIDATION_FILE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public onIntentVerifyPayloadStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    const-string v0, "CusSM.onIntentVerifyPayloadStatus: "

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    sget-object v2, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    sput-object v3, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v4, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v4

    if-nez v4, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "CusSM.onIntentVerifyPayloadStatus: notification for version is not in db "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v5, v6, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "CusSM.onIntentVerifyPayloadStatus failed: notification for version "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " that is in state "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " (expected state VerifyPayloadMetadata))"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    :try_start_0
    invoke-static {p2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    sget-object v5, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Error in CusSM.onIntentVerifyPayloadStatus: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    move-object v4, v5

    :goto_0
    sget-object v5, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {v5}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    const-string p1, "CusSM.onIntentVerifyPayload : STATUS_OK"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {p1, p2, v0, p3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VERIFY_PAYLOAD_STATUS_CHECK:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    const-string p1, "CusSM.onIntentVerifyPayload : Move to cussm to VerifyAllocateSpace"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_ALLOCATE_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p3, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {p1, p2, v0, p3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p1, v2, p2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_1

    :cond_3
    const-string p2, "CusSM.onIntentVerifyPayload : STATUS_NOT_OK"

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v2, v4, p1, p3}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public onIntentWiFiDiscoverTimerExpiry()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->wifiDiscoverySanityCheck(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithWiFiDiscoveryManager()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "OtaApp"

    const-string v2, "canceling update: STATUS_RESOURCES_WIFI:KEY_FAILED_FOTA_WIFI_DISCOVERY_TIMER"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result v1

    const-string v2, "FAILED_FOTA_WIFI_DISCOVERY_TIMER."

    const-string v3, "Fota download is failed due to WiFi discovery timer expired"

    if-eqz v1, :cond_1

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RESOURCES_WIFI:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v0, v3, v2}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    const-string v1, "WiFi discover time expired, go and getch new metadata (is there a change?)"

    const/4 v2, 0x1

    invoke-interface {p0, v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendGetDescriptor(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public declared-synchronized onInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    const-string v0, "CusSM.onInternalNotification failed: copy from sdcard is hosed; Reason: "

    const-string v1, "CusSM.onInternalNotification failed: notification for version "

    const-string v2, "CusSM.onInternalNotification: from Repo "

    monitor-enter p0

    :try_start_0
    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v3, :cond_0

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 v3, 0x0

    sput-object v3, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_0
    if-nez v2, :cond_1

    const-string p1, "OtaApp"

    const-string p2, "CusSM.onInternalNotification: version is not in db"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v3, v4, :cond_2

    const-string p2, "OtaApp"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " that is in state "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " (expected state GettingPackage)"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_2
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {v1, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_3

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_DOWNLOAD_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->unRegisterWithForceUpgradeManager()V

    :cond_3
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {v1, v3, v4, v2, p0}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver;->getInstallTypeHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    move-result-object v1

    sput-object v1, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    if-eqz p3, :cond_4

    const-string p2, "OtaApp"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_COPYFAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v0, "OTHER."

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    if-eqz v2, :cond_5

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p2

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreInstallScreen()Z

    move-result p2

    if-nez p2, :cond_5

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p2

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/MetaData;->getRebootRequired()Z

    move-result p2

    if-nez p2, :cond_5

    const-string p2, "OtaApp"

    const-string v0, "package configured with showPreInstallScreen and rebootRequired to false proceed with upgrading"

    invoke-static {p2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "policyBundleUpdate"

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p2, p1, v0, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto :goto_0

    :cond_5
    sget-object p1, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {p1, p3, v2}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->onInternalNotification(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    :goto_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onModemPollingExpiryNotification(ZZ)V
    .locals 11

    const-string v0, "Modem Update is cancelled due to expiry of modem update waiting time period , version: "

    monitor-enter p0

    :try_start_0
    const-string v1, "OtaApp"

    const-string v2, "CusSM.onModemPollingExpiryNotification"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez p2, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p2

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v4, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v5

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->WaitingForModemUpdateStatus:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v5, v6, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object v7, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_FILE_DL_NOTIFIED_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v9, 0x0

    invoke-virtual {v7, v8, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-gez v5, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "Ota is waiting for modem update status, so no check request; return from here"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->isUpdateSuccessful(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v8, "Device is already upgraded to target version but result status is not received from modem, status waiting time period is expired"

    const-string v9, "SUCCESS."

    const/4 v7, 0x1

    move-object v5, p2

    invoke-interface/range {v4 .. v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    invoke-direct {p0, p2}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v4, v3

    const-string p2, "MODEM_CANCELED_BY_SERVER."

    aput-object p2, v4, v2

    invoke-virtual {p0, v4}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V

    :cond_2
    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getMCFGConfigVersionMap()Ljava/util/Map;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_CONFIG_VERSIONS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v4, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v5, 0x7

    invoke-virtual {v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lt p2, v0, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->shutdownModemPolling()V

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_5

    const-string p1, "OtaApp"

    const-string p2, "MCFG Config version is empty no check request, check if any further carrier is available"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->canISendSuccessiveModemPollRequest()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-virtual {p0, v3, v2}, Lcom/motorola/ccc/ota/CusSM;->onModemPollingExpiryNotification(ZZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    monitor-exit p0

    return-void

    :cond_5
    :try_start_2
    invoke-virtual {v1, p1}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->checkForUpdate(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onModemUpdateStatusResult(ILjava/lang/String;)V
    .locals 7

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v6

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    const-string v1, "OtaApp"

    if-nez v0, :cond_0

    const-string p0, "CusSM.onModemUpdateStatusResult: version is not in db"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->WaitingForModemUpdateStatus:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "CusSM.onModemUpdateStatusResult failed: version "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " that is in state "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " (expected state WaitingForModemUpdateStatus)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const/16 v0, 0xc8

    if-ne p1, v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v4, "woohoo"

    const-string v5, "SUCCESS."

    const/4 v3, 0x1

    move-object v1, v6

    invoke-interface/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->shutdownModemPolling()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Modem update is failed : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "MODEM_UPDATE_FAILED."

    invoke-direct {p0, v6, p1, p2, v0}, Lcom/motorola/ccc/ota/CusSM;->failProgress(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-direct {p0, v6}, Lcom/motorola/ccc/ota/CusSM;->cleanupVersion(Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized onNotRoaming()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/motorola/ccc/ota/CusSM;->_isRoaming:Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onPollingExpiryNotification(ZIZ)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.onPollingExpiryNotification"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isCtaVersion(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "Cta Version, should not allow polling request to avoid ota traffic"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_upgradePlugins:Lcom/motorola/ccc/ota/sources/UpgradeSources;

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->checkForUpdate(ZIZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onRadioDown()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.onRadioDown"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->radioGotDown()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRadioUp()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.onRadioUp"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget v0, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    sget v1, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->WAITING_FOR_NETWORK:I

    if-ne v0, v1, :cond_0

    sget v0, Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;->IDLE:I

    sput v0, Lcom/motorola/ccc/ota/CusSM;->_isSendingUpgradeStatus:I

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->checkWhetherUserDisabledCellularNetwork(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeStatusSuspended(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->isDeviceInDatasaverMode()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "OtaApp"

    const-string v1, "User enabled data saver, can not access background data"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->radioGotDown()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    :cond_3
    :try_start_2
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRoaming()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/motorola/ccc/ota/CusSM;->_isRoaming:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onSimStateChanged(Z)V
    .locals 5

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.ccc.ota.Actions.REFRESH_CHKUPDATE_UI_ON_SIMCHANGE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    if-eqz p1, :cond_5

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result p1

    const/4 v1, 0x3

    const/16 v2, 0xf0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-static {p1, v2, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteAttFirstNetUpdateReminderValues(Lcom/motorola/otalib/common/metaData/MetaData;II)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    if-eqz p1, :cond_5

    const-string v0, "OtaApp"

    const-string v1, "CusSM:FirstNet sim loaded, over write firstnet critical reminder values"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    goto :goto_1

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result p1

    const/4 v3, 0x0

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA_ORIGINAL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getCriticalUpdateReminder()I

    move-result v2

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getCriticalDeferCount()I

    move-result p1

    invoke-static {v1, v2, p1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteAttFirstNetUpdateReminderValues(Lcom/motorola/otalib/common/metaData/MetaData;II)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FOTA_ORIGINAL_FORCED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-static {p1, v3, v3}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteAttFirstNetUpdateReminderValues(Lcom/motorola/otalib/common/metaData/MetaData;II)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getMetaData()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-static {p1, v2, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteAttFirstNetUpdateReminderValues(Lcom/motorola/otalib/common/metaData/MetaData;II)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_4

    const-string v1, "OtaApp"

    const-string v2, "CusSM:Att/Cricket (non FirstNet) sim loaded, over write with respective critical reminder values"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    :cond_4
    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPDATE_PENDING_ON_REBOOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "OtaApp"

    const-string v1, "first net sim removed"

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->notifyRecoveryAboutPendingUpdate(Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPDATE_PENDING_ON_REBOOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_5
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onStart()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "CusSM.onStart"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_sl:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->startStatsListener()V

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->initializeInstaller()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->initializePlugins()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->checkForUpgradeCompleted()V

    const-string v0, "sdcard initiated on start"

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->checkForUpdateInSDCard(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->checkIfWifiDiscoveryTimerExpired()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->checkIfForceUpgradeTimerExpired()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->checkIfForceDownloadTimerExpired()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->checkAndSendRebootDuringDLNotification()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->checkAndCreateReserveSpace()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->checkAndSendRebootDuringABApplyingUpgradingState()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->decideToShowSmartUpdateSuggestion(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onStartDownloadNotification(Ljava/lang/String;)V
    .locals 4

    const-string v0, "CusSM.onStartDownloadNotification : version="

    const-string v1, "CusSM.onStartDownloadNotification: notification for version is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v0, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v1, v3, :cond_1

    const-string v0, "OtaApp"

    const-string v1, "CusSM.onStartDownloadNotification failed: notification for version %s that is in state %s (expected state GettingDescriptor)"

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {p1, v2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    const-string v1, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    const/4 p1, 0x0

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-static {v0, v1, v3, v2, p0}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver;->getInstallTypeHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnableBatteryStatusReceiver()Z

    sget-object v0, Lcom/motorola/ccc/ota/CusSM;->_installType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    invoke-interface {v0, p1}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;->onStartDownloadNotification(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Z)V

    return-void
.end method

.method public overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Z)V
    .locals 5

    const-string v0, "CusSm.overWriteMetaData"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    if-eqz p2, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    :cond_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    const-string v3, "Metadata"

    invoke-static {p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->update_column_vt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1, p0, p2}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->saveMetadata(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Error while converting metadata to json string "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public declared-synchronized pleaseRunStateMachine()V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->runStateMachine()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public registerForHealthCheck()V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HEALTH_CHECK_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x5265c00

    add-long/2addr v0, v2

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HEALTH_CHECK_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.motorola.com.ccc.ota.healthCheckIntent"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    const/high16 v4, 0x14000000

    invoke-static {p0, v3, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/AlarmManager;

    invoke-virtual {v3, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v0, v1, v2}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Health check will run on "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v1}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendAvailableReserveSpace()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->postAvailableReserveSpace()V

    return-void
.end method

.method public declared-synchronized timeForAHealthCheckUp()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HEALTH_CHECK_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v2, v3, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v2, v0, v1, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    const-string v0, "OtaApp"

    const-string v1, "Time for a health check up"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterFromHealthCheck()V
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HEALTH_CHECK_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.com.ccc.ota.healthCheckIntent"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    const/high16 v2, 0x14000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/AlarmManager;

    invoke-virtual {p0, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const-string p0, "OtaApp"

    const-string v0, "Health check alarm cleared"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
