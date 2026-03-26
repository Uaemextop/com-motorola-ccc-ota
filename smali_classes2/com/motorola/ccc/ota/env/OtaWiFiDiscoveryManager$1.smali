.class Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager$1;
.super Ljava/lang/Object;
.source "OtaWiFiDiscoveryManager.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager$1;->this$0:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "OtaWiFiDiscoveryManager,successfully bound to 3C Polling Manger Service"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager$1;->this$0:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    invoke-static {p2}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;->-$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager$1;->this$0:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;->-$$Nest$mregisterApp(Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "disconnected from PollingManager service"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager$1;->this$0:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;->-$$Nest$fputmIsBound(Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager$1;->this$0:Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;->-$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/env/OtaWiFiDiscoveryManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V

    return-void
.end method
