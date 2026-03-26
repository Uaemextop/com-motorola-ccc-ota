.class public Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NetworkStateChangeListener"
.end annotation


# instance fields
.field private hasLoggedCapabilities:Z

.field final synthetic this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->hasLoggedCapabilities:Z

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "PollingManagerService:NetworkCallback:Network onAvailable"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmDeviceConnected(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->hasLoggedCapabilities:Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mbroadcastPollingManagerConnectivity(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    const/4 p1, -0x1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mdecideWhoNeedsPolling(Lcom/motorola/ccc/ota/env/PollingManagerService;I)V

    return-void
.end method

.method public onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/net/ConnectivityManager$NetworkCallback;->onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmDeviceConnected(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->hasLoggedCapabilities:Z

    if-nez p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "PollingManagerService:NetworkCallback:networkCapabilities="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/net/NetworkCapabilities;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->hasLoggedCapabilities:Z

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmConnectionType(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p0

    invoke-static {p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/NetworkCapabilities;)I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/net/ConnectivityManager$NetworkCallback;->onLost(Landroid/net/Network;)V

    const-string p1, "OtaApp"

    const-string v0, "PollingManagerService:NetworkCallback:Network onLost"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->hasLoggedCapabilities:Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmDeviceConnected(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmConnectionType(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mbroadcastPollingManagerConnectivity(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    return-void
.end method

.method public register()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "PollingManagerService:register NetworkCallback"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmConnMgr(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/net/ConnectivityManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    return-void
.end method

.method public unRegister()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "PollingManagerService:unregister NetworkCallback"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmConnMgr(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/net/ConnectivityManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    return-void
.end method
