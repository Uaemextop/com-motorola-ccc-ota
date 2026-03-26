.class Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;
.super Ljava/lang/Object;
.source "AndroidENV.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/AndroidENV;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FotaServices"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/AndroidENV;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/AndroidENV;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFotaDownloadCompleted(JI)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;
    .locals 1

    sget-object p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VERIFY:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p3}, Lcom/motorola/ccc/ota/env/CusFrameworkDeps;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "CusAndroidENV.FotaServices.getFotaDownloadCompleted (failed) "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p3}, Lcom/motorola/ccc/ota/env/CusFrameworkDeps;->isStatusServerError(I)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SERVER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    goto :goto_0

    :cond_0
    invoke-static {p3}, Lcom/motorola/ccc/ota/env/CusFrameworkDeps;->isStatusClientError(I)Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RESOURCES:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    :cond_2
    :goto_0
    return-object p0
.end method

.method public sendFotaInitializationIntent()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendFotaInitializationIntent(Landroid/content/Context;)V

    return-void
.end method

.method public sendRequestUpdate(J)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendRequestUpdate(Landroid/content/Context;J)V

    return-void
.end method

.method public sendUpdateAvailableResponse(JI)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendUpdateAvailableResponse(Landroid/content/Context;JI)V

    return-void
.end method

.method public sendUpdateAvailableResponse(JIZ)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendUpdateAvailableResponse(Landroid/content/Context;JIZ)V

    return-void
.end method

.method public sendUpgradeResult(JI)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendUpgradeResult(Landroid/content/Context;JI)V

    return-void
.end method

.method public sendWifiDiscoverTimerExpiry(JI)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendWifiDiscoverTimerExpiry(Landroid/content/Context;JI)V

    return-void
.end method
