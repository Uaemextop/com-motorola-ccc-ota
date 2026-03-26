.class Lcom/motorola/otalib/downloadservice/DownloadService$1;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/downloadservice/DownloadService;->addProcessor(Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

.field final synthetic val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    iput-object p2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public errorCode(IZ)V
    .locals 6

    const-string v0, "DownloadService.errorCode, retries for errorcode "

    const-string v1, "clientCallBack.errorCode : "

    const/4 v2, 0x0

    :try_start_0
    sget-object v3, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getAdminApnUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$500(Lcom/motorola/otalib/downloadservice/DownloadService;)V

    :cond_0
    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getBackOffValues()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v3, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;

    invoke-direct {v3, v1}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    if-eqz p2, :cond_4

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$004()I

    move-result v1

    iget-object v4, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v4}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getMaxRetryCount()I

    move-result v4

    if-le v1, v4, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " maxed out retry count (attempted) "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$000()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " so giving up"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v1

    iget-object v3, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v3}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "DOWNLOAD_FAILED_5XX."

    invoke-interface {v1, v3, v0, v4}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    const-wide/16 v0, 0x0

    move v4, v2

    :goto_1
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$000()I

    move-result v5

    if-ge v4, v5, :cond_3

    invoke-interface {v3}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getNextTimeoutValue()J

    move-result-wide v0

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    sget-object v3, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DownloadService.errorCode, retryCount "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$000()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " backoffValue : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v3}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$700(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

    move-result-object v3

    new-instance v4, Lcom/motorola/otalib/downloadservice/DownloadService$1$1;

    invoke-direct {v4, p0}, Lcom/motorola/otalib/downloadservice/DownloadService$1$1;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService$1;)V

    invoke-virtual {v3, v4, v0, v1}, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p2

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "clientCallBack.errorCode : exception"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    move p2, v2

    :cond_4
    :goto_2
    :try_start_1
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1, p2}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->errorCode(Ljava/lang/String;IZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "clientCallBack.errorCode : exception at callback "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    return-void
.end method

.method public exception(Ljava/lang/Exception;)V
    .locals 2

    const-string v0, "IOException : "

    :try_start_0
    instance-of v1, p1, Ljava/io/IOException;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "exception"

    invoke-static {p1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    :goto_0
    :try_start_1
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->exception(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "exception : exception at callback "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public failed(Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;)V
    .locals 5

    const-string v0, "failed in service : "

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    iget-object v2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$300(Lcom/motorola/otalib/downloadservice/DownloadService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    :try_start_0
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v2}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Aborting the OTA process as downloarUrl is null"

    const-string v4, "DOWNLOAD_URL_NULL."

    invoke-interface {v1, v2, v3, v4}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v2, "no_network"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v2}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->suspended(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "failed : exception"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$002(I)I

    :try_start_1
    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getAdminApnUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$500(Lcom/motorola/otalib/downloadservice/DownloadService;)V

    :cond_2
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->getDownloaderStatus()Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->getStatus()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "failed : exception "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    :try_start_2
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->getStatus()I

    move-result v1

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->getSpErrorCode()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, v1, v2, p1}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->failed(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    :catch_2
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "failed : exception at callback "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public finished()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getAdminApnUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$500(Lcom/motorola/otalib/downloadservice/DownloadService;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "finished : exception : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->finished(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "finished : exception at callback "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public progress([B)V
    .locals 2

    const/4 p1, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$002(I)I

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->progress(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "progress : exception "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
