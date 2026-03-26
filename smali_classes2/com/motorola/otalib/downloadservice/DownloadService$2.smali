.class Lcom/motorola/otalib/downloadservice/DownloadService$2;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/downloadservice/DownloadService;->handleDownloadServiceRequest(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

.field final synthetic val$downloadFile:Ljava/io/File;

.field final synthetic val$downloadUrl:Ljava/lang/String;

.field final synthetic val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    iput-object p2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    iput-object p3, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$downloadUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$downloadFile:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    const-string v0, "Caught exception"

    :try_start_0
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$900()Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getHostName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v3}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getPort()I

    move-result v3

    iget-object v4, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$downloadUrl:Ljava/lang/String;

    iget-object v5, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$downloadFile:Ljava/io/File;

    iget-object v6, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v6}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getSize()J

    move-result-wide v6

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$800()Landroid/os/PowerManager$WakeLock;

    move-result-object v8

    iget-object v9, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v9}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getUpgradeSourceType()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v10}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getStartingOffset()J

    move-result-wide v10

    invoke-interface/range {v1 .. v11}, Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;->downloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JLandroid/os/PowerManager$WakeLock;Ljava/lang/String;J)V
    :try_end_0
    .catch Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Caught exception while downloading file"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v2

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$2;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PARSE_ERROR."

    invoke-interface {v2, p0, v0, v1}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Caught exception while callback"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_2
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "HttpFileDownloadException - nothing to be done"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method
