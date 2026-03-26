.class Lcom/motorola/otalib/main/LibCussm$1;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "LibCussm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/main/LibCussm;->registerConnectivityNetwork(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/LibCussm;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/LibCussm;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/LibCussm$1;->this$0:Lcom/motorola/otalib/main/LibCussm;

    iput-object p2, p0, Lcom/motorola/otalib/main/LibCussm$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "Network is available"

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/LibCussm;->access$000()I

    move-result p1

    sget v0, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->WAITING_FOR_NETWORK:I

    if-ne p1, v0, :cond_0

    sget p1, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->IDLE:I

    invoke-static {p1}, Lcom/motorola/otalib/main/LibCussm;->access$002(I)I

    :cond_0
    iget-object p1, p0, Lcom/motorola/otalib/main/LibCussm$1;->this$0:Lcom/motorola/otalib/main/LibCussm;

    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm$1;->val$context:Landroid/content/Context;

    invoke-static {p1, p0}, Lcom/motorola/otalib/main/LibCussm;->access$100(Lcom/motorola/otalib/main/LibCussm;Landroid/content/Context;)V

    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/net/ConnectivityManager$NetworkCallback;->onLost(Landroid/net/Network;)V

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "OtaService.NetworkCallback:onLost no data connection"

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/LibCussm$1;->this$0:Lcom/motorola/otalib/main/LibCussm;

    invoke-static {p1}, Lcom/motorola/otalib/main/LibCussm;->access$200(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/common/Environment/DownloadHandler;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm$1;->this$0:Lcom/motorola/otalib/main/LibCussm;

    invoke-static {p0}, Lcom/motorola/otalib/main/LibCussm;->access$200(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/common/Environment/DownloadHandler;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->radioGotDown()V

    :cond_0
    return-void
.end method
