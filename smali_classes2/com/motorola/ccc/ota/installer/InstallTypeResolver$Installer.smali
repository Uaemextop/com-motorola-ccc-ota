.class public interface abstract Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;
.super Ljava/lang/Object;
.source "InstallTypeResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/InstallTypeResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Installer"
.end annotation


# virtual methods
.method public allocateSpaceBeforeApplyPatch(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    return-void
.end method

.method public abstract checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V
.end method

.method public clearRetryTasks()V
    .locals 0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->clearRetryTask()V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->clearRetryTask()V

    :cond_1
    return-void
.end method

.method public abstract displayScreenForGettingDescriptor(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
.end method

.method public abstract doesDownloadedFileClearedFromDisk()Z
.end method

.method public abstract getCurrentInstallerType()Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
.end method

.method public abstract initializeUpdaterEngineHandlerMergeState()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
.end method

.method public isDataSpaceLowForUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)Z
    .locals 2

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->getExtraSpace()J

    move-result-wide p0

    invoke-static {p2, v0, v1, p0, p1}, Lcom/motorola/ccc/ota/utils/FileUtils;->isDataMemoryLow(Lcom/motorola/otalib/common/Environment/ApplicationEnv;JJ)Z

    move-result p0

    return p0
.end method

.method public onAllocateSpaceResult()V
    .locals 0

    return-void
.end method

.method public abstract onInternalNotification(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
.end method

.method public abstract onStartDownloadNotification(Ljava/lang/String;)V
.end method

.method public abstract promptUpgradeActivity(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method public abstract promptUpgradeNotification(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method public abstract shouldPromptUpgradeNotification(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method public abstract updaterEngineHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;)Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
.end method
