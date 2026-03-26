.class Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;
.super Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;
.source "LibDownloadHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-direct {p0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public dlResponse(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public errorCode(Ljava/lang/String;IZ)V
    .locals 2

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler.errorCode(). Download received errorCode :"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p3, :cond_0

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$202(Z)Z

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_RETRY:I

    const-string p2, "Retry pending"

    invoke-static {p0, p1, p2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    :goto_0
    return-void
.end method

.method public exception(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler.exception(). Download received exception :"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$202(Z)Z

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$300(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$400()Landroid/net/ConnectivityManager;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "LibDownloadHandler.exception(). no network, return false"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->NO_NETWORK:I

    const-string p2, "No network"

    invoke-static {p0, p1, p2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    return-void

    :cond_0
    if-eqz p2, :cond_5

    const-string p1, "ENOSPC"

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "not enough free space on /data failing the meta data download for this exception"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "LibDownloadHandler.exception:"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$800(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$600(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$700()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "DATA_OUT_OF_SPACE."

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const-string p1, "IOException"

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$1000()Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result p1

    const-string v0, "Retry pending"

    if-eqz p1, :cond_2

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "LibDownloadHandler.exception(). retry pending, return"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_RETRY:I

    invoke-static {p0, p1, v0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    return-void

    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " during meta data file download"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$1000()Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    move-result-object v1

    const/4 v2, 0x1

    const-string v3, "DOWNLOAD_FAILED_PACKAGE_EXCEPTION."

    invoke-virtual {v1, p2, p1, v2, v3}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->handleException(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z

    move-result p1

    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "LibDownloadHandler.exception(). retry status "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_3

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_RETRY:I

    invoke-static {p0, p1, v0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    :cond_3
    return-void

    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "LibDownloadHandler.exception:Unhandled Exception found "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " failing the download for this exception"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    invoke-static {p1, v4}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$800(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$600(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$700()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "DOWNLOAD_FAILED_PACKAGE_EXCEPTION."

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    return-void
.end method

.method public failed(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 6

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler.failed(). Download failed : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$202(Z)Z

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$300(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$400()Landroid/net/ConnectivityManager;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "LibDownloadHandler.failed(). no network, return"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->NO_NETWORK:I

    const-string p2, "No network"

    invoke-static {p0, p1, p2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$500()Ljava/util/Map;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result p2

    const-string p3, "Error retrying"

    if-eqz p2, :cond_1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "LibDownloadHandler.failed(). retry pending, return"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_RETRY:I

    invoke-static {p0, p1, p3}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    return-void

    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p4, " during package file download "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p4, 0x1

    const-string v0, "DOWNLOAD_FAILED_PACKAGE_4XX."

    invoke-virtual {p1, p2, p4, v0}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->shouldRetry(Ljava/lang/String;ZLjava/lang/String;)Z

    move-result p1

    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "LibDownloadHandler.failed(). retry status "

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p2, p4}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_3

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_RETRY:I

    invoke-static {p0, p1, p3}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    goto :goto_0

    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Aborting the OTA process as there is no error handler installed "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

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

    move-result-object v4

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    invoke-static {p1, v4}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$800(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$600(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$700()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "DOWNLOAD_FAILED_PACKAGE_OTHER."

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public finished(Ljava/lang/String;)V
    .locals 1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "LibDownloadHandler.finished: I appear to have read the entire file "

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$900(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V

    return-void
.end method

.method public initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " meta data file download"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "LibDownloadHandler.initFailed() "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$300(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$800(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$600(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$700()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "OTHER."

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public progress(Ljava/lang/String;)V
    .locals 1

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$000(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$000(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->clearRetryTask()V

    :cond_0
    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->clearRetryTask()V

    :cond_1
    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->SUCCESS:I

    const-string v0, ""

    invoke-static {p0, p1, v0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    return-void
.end method

.method public suspended(Ljava/lang/String;Z)V
    .locals 0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "LibDownloadHandler.suspended()"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$202(Z)Z

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$300(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    sget p1, Lcom/motorola/otalib/main/PublicUtilityMethods;->SUSPENDED:I

    const-string p2, "Suspended"

    invoke-static {p0, p1, p2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V

    return-void
.end method
