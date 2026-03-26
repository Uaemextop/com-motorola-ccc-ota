.class public abstract Lcom/motorola/ccc/ota/sources/UpgradeSource;
.super Ljava/lang/Object;
.source "UpgradeSource.java"


# instance fields
.field private upgradeType:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/UpgradeSource;->upgradeType:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    return-void
.end method


# virtual methods
.method public checkCallECBLowBattery(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public checkForChainUpgrade(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public checkForDownloadDescriptor(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public checkForUpdate(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public checkForUpdate(Z)V
    .locals 0

    return-void
.end method

.method public checkForUpdate(ZIZ)V
    .locals 0

    return-void
.end method

.method public doYouDownloadDirectly(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public downloadCompleted(JI)V
    .locals 0

    return-void
.end method

.method public downloadCompleted(JILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public downloadDirectly(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 0

    return-void
.end method

.method public downloadModeChanged(JZ)V
    .locals 0

    return-void
.end method

.method public abstract getDownloadHandler()Lcom/motorola/otalib/common/Environment/DownloadHandler;
.end method

.method public getDownloadOptStartStopTime(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getUpgradeType()Lcom/motorola/ccc/ota/sources/UpgradeSourceType;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/UpgradeSource;->upgradeType:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    return-object p0
.end method

.method public handleUpdateStatus(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V
    .locals 0

    return-void
.end method

.method public isChangeInSrc(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;)Z
    .locals 0

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isUpdateSuccessful(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getTargetSha1()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemSourceSha1()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getmActualTargetVersion()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "isUpdateSuccessful: targetSha1="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " : devSha1="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "actualDestVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public isUpgradeAcceptable(JJ)Ljava/lang/String;
    .locals 2

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "SourceBuildTimestamp - UpgradeSource"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    cmp-long p0, p3, v0

    if-lez p0, :cond_0

    cmp-long p0, p1, p3

    if-eqz p0, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Current and source UTCs does not match"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " sourceUtc"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public isUpgradeAcceptable(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)[Ljava/lang/String;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "full"

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getPackageType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getTargetSha1()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p2, v1}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->isUpgradeAcceptable(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "Invalid version from server : sourceSha1 %s targetSha1 %s"

    filled-new-array {v1, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    aput-object p0, v0, p1

    const/4 p0, 0x1

    const-string p1, "SRC_VALIDATION_FAILED."

    aput-object p1, v0, p0

    :goto_1
    return-object v0
.end method

.method public isUpgradeAcceptable(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 1

    const/4 p0, 0x2

    new-array p0, p0, [Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Invalid version from server : DeviceSha1 %s andCurrentSha1 %s do not match"

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, p0, p2

    const/4 p1, 0x1

    const-string p2, "SRC_VALIDATION_FAILED."

    aput-object p2, p0, p1

    :cond_0
    return-object p0
.end method

.method public plugin_exit()V
    .locals 0

    return-void
.end method

.method public plugin_init(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public requestUpdateResponse(JI)V
    .locals 0

    return-void
.end method

.method public sendChainUpgradeRequest(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V
    .locals 0

    return-void
.end method

.method public setMemoryLowInfo(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 0

    return-void
.end method

.method public updateAvailable(JJLjava/lang/String;ZLjava/lang/String;Z)V
    .locals 0

    return-void
.end method

.method public updateAvailable([BLjava/lang/Long;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public verifyFile(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 0

    :try_start_0
    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->verifyPackage(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATUS_VERIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getStatusVerifyResult(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "UpgradeSource.verifyFile failed: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
