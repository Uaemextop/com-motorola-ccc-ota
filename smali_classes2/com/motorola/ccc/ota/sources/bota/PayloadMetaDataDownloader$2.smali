.class Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$2;
.super Ljava/lang/Object;
.source "PayloadMetaDataDownloader.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$2;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "PayloadMetaDataDownloader : onServiceConnected() "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/motorola/otalib/aidl/IDownloadService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfputmService(Lcom/motorola/otalib/aidl/IDownloadService;)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgetmService()Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$2;->this$0:Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$mcallDownloadRequest(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V

    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    const-string p0, "OtaApp"

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgetmService()Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfgetmService()Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p1

    const-string v0, "com.motorola.ccc.ota.sources.bota.OtaDownloadRequest"

    invoke-interface {p1, v0}, Lcom/motorola/otalib/aidl/IDownloadService;->unregisterCallback(Ljava/lang/String;)V

    :cond_0
    const-string p1, "PayloadMetaDataDownloader  : onServiceDisconnected(): Unregistered for remote service callbacks"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PayloadMetaDataDownloader : onServiceDisconnected(): Error un-registering our callback with dl service: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfputprogress(Z)V

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->-$$Nest$sfputmService(Lcom/motorola/otalib/aidl/IDownloadService;)V

    return-void
.end method
