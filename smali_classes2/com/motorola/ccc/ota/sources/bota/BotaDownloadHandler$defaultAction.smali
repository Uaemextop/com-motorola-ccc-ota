.class Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$defaultAction;
.super Ljava/util/TimerTask;
.source "BotaDownloadHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "defaultAction"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$defaultAction;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$defaultAction;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$mstopTimer(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$defaultAction;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetcm()Landroid/net/ConnectivityManager;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance p0, Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
