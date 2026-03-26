.class public Lcom/motorola/ccc/ota/ui/updateType/OS;
.super Ljava/lang/Object;
.source "OS.java"

# interfaces
.implements Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getABRestartWarning()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e0006

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getCriticalInstallMessagePopup()I
    .locals 0

    const p0, 0x7f0e00a5

    return p0
.end method

.method public getDefaultInstructionImage()I
    .locals 0

    const p0, 0x7f0800b3

    return p0
.end method

.method public getDialogTheme()I
    .locals 0

    const p0, 0x7f0f00cd

    return p0
.end method

.method public getDownloadInstructionImage()I
    .locals 0

    const p0, 0x7f0800b5

    return p0
.end method

.method public getDownloadNotificationImage()I
    .locals 0

    const p0, 0x7f0800c0

    return p0
.end method

.method public getDownloadNotificationTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e01b6

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getDownloadPauseAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "download_stop_blue.json"

    return-object p0
.end method

.method public getDownloadProgressAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "downloading_blue.json"

    return-object p0
.end method

.method public getDownloadProgressText()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e014a

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getInstallAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "just_one_more_step_blue.json"

    return-object p0
.end method

.method public getInstallNotificationImage()I
    .locals 0

    const p0, 0x7f0800bc

    return p0
.end method

.method public getInstallToastMessage()I
    .locals 0

    const p0, 0x7f0e0186

    return p0
.end method

.method public getInstallUpdateNotificationText()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e01b7

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getInstallationTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e01b8

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getLowStorageTitle()I
    .locals 0

    const p0, 0x7f0e01bf

    return p0
.end method

.method public getPDLNotificationTitle()Ljava/lang/String;
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e01bb

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getTargetOSVersion()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f0e01ba

    invoke-virtual {p0, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getPdlAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "pdlAnimation_blue.json"

    return-object p0
.end method

.method public getPersonalInfoInstructionImage()I
    .locals 0

    const p0, 0x7f0800d2

    return p0
.end method

.method public getRestartAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "restart_blue.json"

    return-object p0
.end method

.method public getRestartInstructionImage()I
    .locals 0

    const p0, 0x7f0800d9

    return p0
.end method

.method public getRestartNotificationImage()I
    .locals 0

    const p0, 0x7f0800be

    return p0
.end method

.method public getSecureInstructionImage()I
    .locals 0

    const p0, 0x7f0800db

    return p0
.end method

.method public getStatusBarColor()I
    .locals 0

    const p0, 0x7f06008b

    return p0
.end method

.method public getSystemUpdateAvailableNotificationText()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e01c0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSystemUpdateAvailablePendingNotificationText()I
    .locals 0

    const p0, 0x7f0e01c3

    return p0
.end method

.method public getSystemUpdatePausedNotificationTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e01c2

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getToolbarColor()I
    .locals 0

    const p0, 0x7f06008c

    return p0
.end method

.method public getToolbarTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/OS;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e01c7

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getUpdateCompleteNotificationImage()I
    .locals 0

    const p0, 0x7f0800ba

    return p0
.end method

.method public getUpdateFailedImage()I
    .locals 0

    const p0, 0x7f0800c4

    return p0
.end method

.method public getUpdateSpecificColor()I
    .locals 0

    const p0, 0x7f06008a

    return p0
.end method

.method public getUpdateStatusAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "blue_complete.json"

    return-object p0
.end method
