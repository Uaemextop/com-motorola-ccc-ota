.class public abstract Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;
.super Ljava/lang/Object;
.source "UpdaterEngineInstaller.java"

# interfaces
.implements Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;


# static fields
.field private static ALLOCATE_SPACE_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static APPLY_PAYLOAD_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected static updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;


# instance fields
.field protected _db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

.field protected _env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field protected _settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field protected mVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->APPLY_PAYLOAD_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->ALLOCATE_SPACE_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static builder(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;
    .locals 0

    sget-object p5, Lcom/motorola/otalib/common/utils/UpgradeUtils$AB_INSTALL_TYPE;->defaultAb:Lcom/motorola/otalib/common/utils/UpgradeUtils$AB_INSTALL_TYPE;

    invoke-virtual {p5}, Lcom/motorola/otalib/common/utils/UpgradeUtils$AB_INSTALL_TYPE;->name()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p5, p0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;-><init>(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    return-object p0

    :cond_0
    new-instance p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;-><init>(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;)V

    return-object p0
.end method

.method public static getAllocateSpaceStarted()Z
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->ALLOCATE_SPACE_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public static getApplyPayloadStarted()Z
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->APPLY_PAYLOAD_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method protected static setAllocateSpaceStarted(Z)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->ALLOCATE_SPACE_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method protected static setApplyPayloadStarted(Z)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->APPLY_PAYLOAD_STARTED:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method


# virtual methods
.method public clearUEInstallerBeforeExit()V
    .locals 0

    return-void
.end method

.method public doesDownloadedFileClearedFromDisk()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public promptUpgradeActivity(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->mVersion:Ljava/lang/String;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendStartRestartActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public promptUpgradeNotification(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->mVersion:Ljava/lang/String;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendSystemRestartNotificationForABUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public shouldPromptUpgradeNotification(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z
    .locals 5

    sget-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    sget-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateReqTriggeredBy()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ACTIVITY_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-virtual {p1, v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return v1

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result p0

    if-eqz p0, :cond_2

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p1, "fullScreenForVZW"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    return v1

    :cond_2
    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->getSeverity()I

    move-result p0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->ordinal()I

    move-result p1

    if-ne p0, p1, :cond_3

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p1, "fullScreenForCriticalUpdate"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    return v1

    :cond_3
    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_0
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p1, "userDidCheckUpdate"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    return v1
.end method
