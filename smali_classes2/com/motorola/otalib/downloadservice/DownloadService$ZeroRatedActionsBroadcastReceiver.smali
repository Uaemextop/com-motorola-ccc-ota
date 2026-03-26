.class Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ZeroRatedActionsBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/DownloadService;


# direct methods
.method private constructor <init>(Lcom/motorola/otalib/downloadservice/DownloadService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/DownloadService$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_ACTIVE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "downloadRequest"

    if-eqz v1, :cond_0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v3, "Received zero rated channel active intent, start/resume the download"

    invoke-static {v1, v3}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfigValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/motorola/otalib/downloadservice/DownloadService;->postDownloadRequest(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V

    :cond_0
    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CLEANUP"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CLEANUP_MESSAGE"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_0
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v4}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "OTHER."

    invoke-interface {v3, v4, v1, v5}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    sget-object v3, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Caught exception while callback"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_INACTIVE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "Received zero rated channel inactive intent, bringup again if needed"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$900()Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    move-result-object v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "DownloadService.ZeroRatedActionsBroadcastReceiver(), shutting down HttpFileDownloader"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$900()Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;->shutdown()V

    :cond_2
    const-string v0, "onUnavailable"

    const-string v1, "key_inactive_reason"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_3

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p2}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2, v0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->suspended(Ljava/lang/String;Z)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->stopSelf()V

    return-void

    :cond_3
    iget-object p2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p2}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$1400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object p2

    invoke-virtual {p2, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfigValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    move-result-object p2

    invoke-virtual {p2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getAdminApnUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object v2

    invoke-virtual {p2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getWifiOnly()Z

    move-result v4

    invoke-virtual {p2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getDisallowedNetworks()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v7

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->canIUseZeroRatedNetwork(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p2, "ZeroRatedActionsBroadcastReceiver: zero rated channel not active, start zero rated process"

    invoke-static {p1, p2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->startZeroRatedProcess()V

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->registerForZeroRatedActions()V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-interface {p1, p0, p2}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->suspended(Ljava/lang/String;Z)V

    goto :goto_1

    :cond_4
    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-static {p2}, Lcom/motorola/otalib/downloadservice/DownloadService;->access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2, v0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->suspended(Ljava/lang/String;Z)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;->this$0:Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->stopSelf()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "ZeroRatedActionsBroadcastReceiver : exception "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_1
    return-void
.end method
