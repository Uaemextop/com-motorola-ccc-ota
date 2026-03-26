.class Lcom/motorola/otalib/downloadservice/DownloadService$1$1;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/downloadservice/DownloadService$1;->errorCode(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/motorola/otalib/downloadservice/DownloadService$1;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/downloadservice/DownloadService$1;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1$1;->this$1:Lcom/motorola/otalib/downloadservice/DownloadService$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1$1;->this$1:Lcom/motorola/otalib/downloadservice/DownloadService$1;

    iget-object v0, v0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$600(Lcom/motorola/otalib/downloadservice/DownloadService;)Landroid/net/ConnectivityManager;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1$1;->this$1:Lcom/motorola/otalib/downloadservice/DownloadService$1;

    iget-object v0, v0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1$1;->this$1:Lcom/motorola/otalib/downloadservice/DownloadService$1;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$1;->val$request:Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    invoke-virtual {v0, p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->postDownloadRequest(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "DownloadService.errorCode, no need to retry as there is no network"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
