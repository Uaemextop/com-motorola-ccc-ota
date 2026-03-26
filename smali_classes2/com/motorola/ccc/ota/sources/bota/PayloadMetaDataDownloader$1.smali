.class Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;
.super Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;
.source "PayloadMetaDataDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-direct {p0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public dlResponse(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public errorCode(Ljava/lang/String;IZ)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "PayloadMetaDataDownloader.errorCode(). Download received errorCode :"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p3, :cond_0

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfputprogress(Z)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RETRIED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p3

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, p3, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    :goto_0
    return-void
.end method

.method public exception(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "PayloadMetaDataDownloader.exception(). Download received exception :"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfputprogress(Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgetcm()Landroid/net/ConnectivityManager;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "PayloadMetaDataDownloader.exception(). no network, return false"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DEFERRED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, v0, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    return-void

    :cond_0
    if-eqz p2, :cond_5

    const-string p1, "ENOSPC"

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    const-string v1, " "

    if-eqz p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "not enough free space on /data failing the payload meta data download for this exception"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v2, "PayloadMetaDataDownloader.exception:"

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_PAYLOAD_METADATA_CHECK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v0, "DATA_OUT_OF_SPACE."

    invoke-static {p2, p0, p1, v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    return-void

    :cond_1
    const-string p1, "IOException"

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    const-string v2, "DOWNLOAD_FAILED_PAYLOAD_METADATA_EXCEPTION."

    if-eqz p1, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgetioExceptionHandler()Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "PayloadMetaDataDownloader.exception(). retry pending, return"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RETRIED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, v0, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    return-void

    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " during payload meta data file download"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgetioExceptionHandler()Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, p2, p1, v3, v2}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->handleException(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z

    move-result p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "PayloadMetaDataDownloader.exception(). retry status "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_3

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RETRIED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, v0, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    :cond_3
    return-void

    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v3, "PayloadMetaDataDownloader.exception:Unhandled Exception found "

    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " failing the download for this exception"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p2, p0, p1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    :cond_5
    return-void
.end method

.method public failed(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "PayloadMetaDataDownloader.failed(). Download failed : "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfputprogress(Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgetcm()Landroid/net/ConnectivityManager;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "PayloadMetaDataDownloader.failed(). no network, return"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DEFERRED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p3

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, p3, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgeterrorCodeHandlers()Ljava/util/Map;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p1, "PayloadMetaDataDownloader.failed(). retry pending, return"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RETRIED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p3

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, p3, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    return-void

    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " during payload metadata file download "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    const-string p4, "DOWNLOAD_FAILED_PAYLOAD_METADATA_4XX."

    invoke-virtual {p1, p2, p3, p4}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->shouldRetry(Ljava/lang/String;ZLjava/lang/String;)Z

    move-result p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "PayloadMetaDataDownloader.failed(). retry status "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_3

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RETRIED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p3

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, p3, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    goto :goto_0

    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Aborting the OTA process as there is no error handler installed "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p0

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string p3, "DOWNLOAD_FAILED_PAYLOAD_METADATA_OTHER."

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public finished(Ljava/lang/String;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "PayloadMetaDataDownloader.finished: I appear to have read the entire file "

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPayloadMetaDataFileName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "644"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/FileUtils;->setPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPayloadMetaDataFileName()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->verifyPayloadMetadata(Ljava/lang/String;Z)V

    return-void
.end method

.method public initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " payload meta data file download"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "PayloadMetaDataDownloader.initFailed() "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "OtaApp"

    invoke-static {v0, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object p0

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    return-void
.end method

.method public progress(Ljava/lang/String;)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->clearRetryTask()V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->clearRetryTask()V

    :cond_1
    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, v0, v1, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    return-void
.end method

.method public suspended(Ljava/lang/String;Z)V
    .locals 1

    const-string p1, "OtaApp"

    const-string p2, "PayloadMetaDataDownloader.suspended()"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfputprogress(Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DEFERRED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-static {p1, p2, v0, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    return-void
.end method
