.class public Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;
.super Ljava/lang/Object;
.source "SDCardDownloadHandler.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/DownloadHandler;


# instance fields
.field private _env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field private volatile _isCopying:Z

.field private manager:Landroid/os/PowerManager;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fget_env(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmanager(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;)Landroid/os/PowerManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->manager:Landroid/os/PowerManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fput_isCopying(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/PowerManager;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->manager:Landroid/os/PowerManager;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method private copyFromSdCard(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 10

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getInfo()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v7

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "location: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " version: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " dest: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " repo: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " size: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    const-string p1, "SDCardUpgradeSource.copyFromSdCard.Runnable.run: internal programming defect"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v7, v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-wide/16 v8, 0x0

    cmp-long p1, v5, v8

    if-gtz p1, :cond_1

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " is empty or could not be opened"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v7, v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance p1, Ljava/lang/Thread;

    new-instance v8, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;

    move-object v0, v8

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;-><init>(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    invoke-direct {p1, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    return-void
.end method

.method public isBusy()Z
    .locals 2

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    if-eqz v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "SDCardUpgradeSource.isBusy is busy"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-boolean p0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    return p0
.end method

.method public radioGotDown()V
    .locals 0

    return-void
.end method

.method public transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 1

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    if-eqz v0, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "SDCardUpgradeSource.transferUpgrade: already one copy is in progress; cannot start a new one"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->_isCopying:Z

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->copyFromSdCard(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    return-void
.end method
