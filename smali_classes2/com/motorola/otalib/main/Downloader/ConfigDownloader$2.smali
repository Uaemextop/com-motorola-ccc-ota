.class Lcom/motorola/otalib/main/Downloader/ConfigDownloader$2;
.super Ljava/lang/Object;
.source "ConfigDownloader.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$2;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler : onServiceConnected() "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/motorola/otalib/aidl/IDownloadService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$502(Lcom/motorola/otalib/aidl/IDownloadService;)Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$500()Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$2;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$600(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    :try_start_0
    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$500()Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$500()Lcom/motorola/otalib/aidl/IDownloadService;

    move-result-object p0

    const-string p1, "com.motorola.ccc.otalib.OtaDownloadRequest"

    invoke-interface {p0, p1}, Lcom/motorola/otalib/aidl/IDownloadService;->unregisterCallback(Ljava/lang/String;)V

    :cond_0
    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "LibDownloadHandler  : onServiceDisconnected(): Unregistered for remote service callbacks"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler : onServiceDisconnected(): Error un-registering our callback with dl service: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$202(Z)Z

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$502(Lcom/motorola/otalib/aidl/IDownloadService;)Lcom/motorola/otalib/aidl/IDownloadService;

    return-void
.end method
