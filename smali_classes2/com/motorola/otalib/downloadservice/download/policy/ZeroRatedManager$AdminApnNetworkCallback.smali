.class Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "ZeroRatedManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdminApnNetworkCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;


# direct methods
.method public constructor <init>(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 3

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "AdminApnNetworkCallback.onAvailable() for network: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$100(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$002(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;Landroid/net/ConnectivityManager;)Landroid/net/ConnectivityManager;

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$200(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object v0

    const-string v1, "doNotBindOtaProcess"

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfigValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "AdminApnNetworkCallback.onAvailable() binding with adminapn network"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$000(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Landroid/net/ConnectivityManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/ConnectivityManager;->bindProcessToNetwork(Landroid/net/Network;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Failed adding network "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " to bindProcessToNetwork API"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->sendCleanUpNotification(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$302(Landroid/net/Network;)Landroid/net/Network;

    invoke-static {}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$300()Landroid/net/Network;

    move-result-object p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Current adminapn nethandler is "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$300()Landroid/net/Network;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Network;->getNetworkHandle()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$402(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;Z)Z

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-static {p1, v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$502(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;Z)Z

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$200(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object p1

    const-string v0, "adminapnstatus"

    const-string v1, "connected"

    invoke-virtual {p1, v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->setConfigValue(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->informZeroRatedChannelActive()V

    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 3

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "AdminApnNetworkCallback.onLost() for network: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$200(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    move-result-object p1

    const-string v0, "adminapnstatus"

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfigValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "connected"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$302(Landroid/net/Network;)Landroid/net/Network;

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    const-string v0, "onLost"

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->informZeroRatedChannelInActive(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->stopZeroRatedChannel()V

    :cond_0
    return-void
.end method

.method public onUnavailable()V
    .locals 2

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "AdminApnNetworkCallback.onUnavailable()"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->access$502(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;Z)Z

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;->this$0:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    const-string v0, "onUnavailable"

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->informZeroRatedChannelInActive(Ljava/lang/String;)V

    return-void
.end method
