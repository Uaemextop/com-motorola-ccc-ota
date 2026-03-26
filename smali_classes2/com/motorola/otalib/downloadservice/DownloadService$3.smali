.class Lcom/motorola/otalib/downloadservice/DownloadService$3;
.super Lcom/motorola/otalib/aidl/IDownloadService$Stub;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/DownloadService;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/downloadservice/DownloadService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$3;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-direct {p0}, Lcom/motorola/otalib/aidl/IDownloadService$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public downloadRequest(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DownloadService : downloadRequest - "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$3;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v0, p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$102(Lcom/motorola/otalib/downloadservice/DownloadService;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$3;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$3;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object p1

    const-string v0, "downloadRequest"

    invoke-virtual {p1, v0, p2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$3;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "doNotBindOtaProcess"

    invoke-virtual {p1, v1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$3;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->postDownloadRequest(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V

    const/4 p0, 0x1

    return p0
.end method

.method public registerCallback(Ljava/lang/String;Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Z
    .locals 0

    invoke-static {p2}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$202(Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "registerCallback : "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method public unregisterCallback(Ljava/lang/String;)V
    .locals 1

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "unregisterCallback : "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$202(Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    return-void
.end method
