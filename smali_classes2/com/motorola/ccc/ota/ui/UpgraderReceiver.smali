.class public Lcom/motorola/ccc/ota/ui/UpgraderReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UpgraderReceiver.java"


# static fields
.field private static FILE_LOCATION:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.file_location"

.field private static FLAVOUR:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.result_flavour"

.field private static RESULT_INTENT:Ljava/lang/String; = "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_RESULT"

.field private static VERSION:Ljava/lang/String; = "com.motorola.blur.service.blur.upgrade.version"

.field private static inProgress:Z = false


# instance fields
.field botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private rebootDevice(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;

    invoke-direct {v1, p0, p1}, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;-><init>(Lcom/motorola/ccc/ota/ui/UpgraderReceiver;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    :goto_0
    sget-boolean v0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->inProgress:Z

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->inProgress:Z

    const-string v0, "com.motorola.blur.service.blur.Actions.MERGE_RESTART_UPGRADE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "OtaApp"

    if-eqz v0, :cond_3

    const-string p2, "Restarting device for merge process"

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_RESTARTED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    const-string v0, "null"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const-string p2, ""

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, ",User"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_VAB_MERGE_RESTARTED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->rebootDevice(Landroid/content/Context;)V

    return-void

    :cond_3
    sget-object v0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->FILE_LOCATION:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->VERSION:Ljava/lang/String;

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "!!! INSTALL UPDATE !!!: for version : "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HISTORY_SOURCE_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getBuildDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p2

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getOemConfigUpdateData()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    const-string v4, "oem_config_update"

    invoke-static {p1, v4, v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->updateMotorolaSettingsProvider(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "OEMConfigUpdate Flag = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getOemConfigUpdateData()Z

    move-result p2

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getInstallModeStats()Ljava/lang/String;

    move-result-object p2

    const-string v3, "userInitiated"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "userSelectedAutoInstall"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->addNewInstallationTime(J)V

    :cond_5
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BOOT_START_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result p2

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_ATTEMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    const-string p2, "Restarting the device"

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->rebootDevice(Landroid/content/Context;)V

    goto/16 :goto_4

    :cond_6
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPDATE_PENDING_ON_REBOOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    const/4 v3, 0x0

    if-eqz p2, :cond_7

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->notifyRecoveryAboutPendingUpdate(Z)V

    :cond_7
    if-eqz v0, :cond_8

    if-eqz v2, :cond_8

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_8

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_ATTEMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {p1, p2}, Landroid/os/RecoverySystem;->installPackage(Landroid/content/Context;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "!!Ooops...Unable to invoke RecoverySystem.installPackage!!"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_8
    :goto_1
    const-string p2, "Unknown reason"

    :goto_2
    sput-boolean v3, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->inProgress:Z

    new-instance p0, Landroid/content/Intent;

    sget-object v1, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->RESULT_INTENT:Ljava/lang/String;

    invoke-direct {p0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    if-nez v2, :cond_9

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Version is not supplied! "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_3

    :cond_9
    sget-object v1, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->VERSION:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_3
    if-nez v0, :cond_a

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Update filename is not supplied! "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_a
    const-string v0, "InstallUpdate"

    invoke-static {v0, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->FLAVOUR:Ljava/lang/String;

    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    :goto_4
    return-void
.end method
