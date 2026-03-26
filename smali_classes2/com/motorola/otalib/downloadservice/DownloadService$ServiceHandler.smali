.class Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;
.super Landroid/os/Handler;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ServiceHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/DownloadService;


# direct methods
.method public constructor <init>(Lcom/motorola/otalib/downloadservice/DownloadService;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage :"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->values()[Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService$4;->$SwitchMap$com$motorola$otalib$downloadservice$DownloadService$WHAT:[I

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->values()[Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 p0, 0x2

    if-eq v0, p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$900()Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    move-result-object p0

    if-eqz p0, :cond_2

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadService.onDestroy(), shutting down HttpFileDownloader"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$900()Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;->shutdown()V

    goto :goto_0

    :cond_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "DownloadService : DOWNLOAD_SERVICE_REQUEST"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v0, p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1000(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1200(Lcom/motorola/otalib/downloadservice/DownloadService;)Landroid/util/SparseArray;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2
    :goto_0
    return-void
.end method
