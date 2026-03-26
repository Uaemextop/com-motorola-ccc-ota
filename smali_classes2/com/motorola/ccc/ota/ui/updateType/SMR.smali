.class public Lcom/motorola/ccc/ota/ui/updateType/SMR;
.super Ljava/lang/Object;
.source "SMR.java"

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

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getABRestartWarning()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e0007

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getCriticalInstallMessagePopup()I
    .locals 0

    const p0, 0x7f0e00a6

    return p0
.end method

.method public getDefaultInstructionImage()I
    .locals 0

    const p0, 0x7f0800b4

    return p0
.end method

.method public getDialogTheme()I
    .locals 0

    const p0, 0x7f0f00ce

    return p0
.end method

.method public getDownloadInstructionImage()I
    .locals 0

    const p0, 0x7f0800b6

    return p0
.end method

.method public getDownloadNotificationImage()I
    .locals 0

    const p0, 0x7f0800c1

    return p0
.end method

.method public getDownloadNotificationTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e017c

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getDownloadPauseAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "download_stop_purple.json"

    return-object p0
.end method

.method public getDownloadProgressAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "downloading_purple.json"

    return-object p0
.end method

.method public getDownloadProgressText()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e014b

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getInstallAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "just_one_more_step_purple.json"

    return-object p0
.end method

.method public getInstallNotificationImage()I
    .locals 0

    const p0, 0x7f0800bd

    return p0
.end method

.method public getInstallToastMessage()I
    .locals 0

    const p0, 0x7f0e0187

    return p0
.end method

.method public getInstallUpdateNotificationText()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e017d

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getInstallationTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e017e

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getLowStorageTitle()I
    .locals 0

    const p0, 0x7f0e0180

    return p0
.end method

.method public getPDLNotificationTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e017c

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getPdlAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "pdlAnimation_purple.json"

    return-object p0
.end method

.method public getPersonalInfoInstructionImage()I
    .locals 0

    const p0, 0x7f0800d3

    return p0
.end method

.method public getRestartAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "restart_purple.json"

    return-object p0
.end method

.method public getRestartInstructionImage()I
    .locals 0

    const p0, 0x7f0800da

    return p0
.end method

.method public getRestartNotificationImage()I
    .locals 0

    const p0, 0x7f0800bf

    return p0
.end method

.method public getSecureInstructionImage()I
    .locals 0

    const p0, 0x7f0800dc

    return p0
.end method

.method public getStatusBarColor()I
    .locals 0

    const p0, 0x7f0600a6

    return p0
.end method

.method public getSystemUpdateAvailableNotificationText()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e0181

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSystemUpdateAvailablePendingNotificationText()I
    .locals 0

    const p0, 0x7f0e0183

    return p0
.end method

.method public getSystemUpdatePausedNotificationTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e0182

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getToolbarColor()I
    .locals 0

    const p0, 0x7f0600a7

    return p0
.end method

.method public getToolbarTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0e0184

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getUpdateCompleteNotificationImage()I
    .locals 0

    const p0, 0x7f0800bb

    return p0
.end method

.method public getUpdateFailedImage()I
    .locals 0

    const p0, 0x7f0800c5

    return p0
.end method

.method public getUpdateSpecificColor()I
    .locals 0

    const p0, 0x7f0600a5

    return p0
.end method

.method public getUpdateStatusAnimation()Ljava/lang/String;
    .locals 0

    const-string p0, "purple_complete.json"

    return-object p0
.end method
