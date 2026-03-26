.class public Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;
.super Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;
.source "ABUpdate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;,
        Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;
    }
.end annotation


# static fields
.field private static mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;


# instance fields
.field private abUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

.field private callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

.field private context:Landroid/content/Context;

.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mPendingIntent:Landroid/app/PendingIntent;


# direct methods
.method static bridge synthetic -$$Nest$fgetcallbackHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfgetmInstallerStatus()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputmInstallerStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V
    .locals 0

    sput-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-void
.end method

.method public constructor <init>(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;-><init>()V

    iput-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->context:Landroid/content/Context;

    sget-object p1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mVersion:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mVersion:Ljava/lang/String;

    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->getUpdaterEngineStateHandlerInstance()Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    move-result-object p1

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "alarm"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/AlarmManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mAlarmManager:Landroid/app/AlarmManager;

    return-void
.end method

.method private doSanityForABUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;)Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    .locals 2

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledByPolicyMngr()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SYSTEM_UPDATE_CANCEL_POLICY_SET:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {p2, p1, v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->shouldIBlockUpdateForSystemPolicy(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SYSTEM_UPDATE_POLICY_SET:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object p0

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p2

    if-eqz p2, :cond_2

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_BUSY:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object p0

    :cond_2
    new-instance p2, Ljava/io/File;

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_3

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_NO_FILE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object p0

    :cond_3
    iget-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p2, v0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->isMemoryLowForBackgroundInstallation(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p0

    const-wide/16 v0, 0x0

    cmp-long p2, p0, v0

    if-lez p2, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    cmp-long p0, v0, p0

    if-ltz p0, :cond_4

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_FOTA_LOW_MEMORY:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object p0

    :cond_4
    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_LOW_SPACE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object p0

    :cond_5
    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object p0
.end method

.method private registerABUpdateBroadcastReceiver()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->abUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->abUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.ccc.ota.ACTION_BATTERY_LOW"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->abUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

    invoke-static {v1, v2, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_1
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.ccc.ota.INTENT_MAX_ALARM_FOR_UE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->abUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

    const/4 v2, 0x4

    invoke-virtual {v1, p0, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public declared-synchronized allocateSpaceBeforeApplyPatch(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string p1, "Exception in getHeaderKeyValuePair: "

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->getAllocateSpaceStarted()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "ABUpdate.allocateSpaceBeforeApplyPatch inside allocateSpace thread."

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->setAllocateSpaceStarted(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getPayloadMetaDataBin()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPayloadMetaDataFileName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "644"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/FileUtils;->setPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getHeaderKeyValuePair()[Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPayloadMetaDataFileName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->allocateSpace(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string v1, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->context:Landroid/content/Context;

    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionAllocateSpaceResult(Landroid/content/Context;J)V

    goto :goto_0

    :cond_0
    const-string p1, "OtaApp"

    const-string v0, "ABUpdate.allocateSpaceBeforeApplyPatch allocateSpace thread locked."

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public cancelPendingExpiryAlarmSetForUE()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mPendingIntent:Landroid/app/PendingIntent;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-virtual {p0, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    :cond_0
    return-void
.end method

.method public checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V
    .locals 0

    sput-object p2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelBGInstallNotification()V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->clearUEInstallerBeforeExit()V

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, p2, :cond_1

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, p2, :cond_1

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p1, p2, :cond_2

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelRestartNotification()V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->resetUpdateEngine()V

    :cond_2
    :goto_0
    return-void
.end method

.method public clearRetryTasks()V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->cancelPendingExpiryAlarmSetForUE()V

    return-void
.end method

.method public clearUEInstallerBeforeExit()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "Clearing AB  updater installer"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->resetBinded()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->cancelPendingExpiryAlarmSetForUE()V

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->setApplyPayloadStarted(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->abUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->abUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->clearUEStateHandler()V

    return-void
.end method

.method public displayScreenForGettingDescriptor(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mVersion:Ljava/lang/String;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendStartDownloadProgressFragment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Exception in ABUpdate: displayScreenForGettingDescriptor: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public getCurrentInstallerType()Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
    .locals 0

    sget-object p0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    return-object p0
.end method

.method public declared-synchronized initializeUpdaterEngineHandlerMergeState()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_BUSY:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    invoke-virtual {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->initializeUpdaterEngineStateHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;)V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeToUE()V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onAllocateSpaceResult()V
    .locals 0

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->setAllocateSpaceStarted(Z)V

    return-void
.end method

.method public onInternalNotification(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPackageFilePathForA2B()Ljava/lang/String;

    move-result-object p1

    const-string v0, "644"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/FileUtils;->setPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_DOWNLOAD_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_FILE_DL_EXPIRED_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IntimateModem:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p0, p1, p2, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto :goto_0

    :cond_0
    const-wide/32 v2, 0x5265c00

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p2, v2, v3, p1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->settingMaxDeferTimeForFOTAUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;JLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_ALLOCATE_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {p1, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p0, p1, p2, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    :goto_0
    return-void
.end method

.method public onStartDownloadNotification(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mVersion:Ljava/lang/String;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, p0, v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    return-void
.end method

.method public setExpiryAlarmForUE(IF)V
    .locals 6

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.INTENT_MAX_ALARM_FOR_UE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "key_percentage"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    const-string p2, "key_status"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->context:Landroid/content/Context;

    const/high16 p2, 0x14000000

    const/4 v1, 0x0

    invoke-static {p1, v1, v0, p2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mPendingIntent:Landroid/app/PendingIntent;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0xdbba0

    add-long/2addr v2, v4

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {p1, v1, v2, v3, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void
.end method

.method public declared-synchronized updaterEngineHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;)Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->doSanityForABUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;)Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object p1

    sget-object p2, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne p1, p2, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->registerABUpdateBroadcastReceiver()V

    new-instance p2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler-IA;)V

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    sget-object p2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    invoke-virtual {p2, p0, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->initializeUpdaterEngineStateHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;)V

    sget-object p2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeToUE()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
