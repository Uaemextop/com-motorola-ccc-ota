.class Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;
.super Ljava/lang/Object;
.source "ForceUpgradeManager.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/ForceUpgradeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;->this$0:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "ForceUpgradeManager,successfully bound to 3C Polling Manger Service"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;->this$0:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    invoke-static {p2}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->-$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;->this$0:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->-$$Nest$mregisterApp(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "ForceUpgradeManager, disconnected from PollingManager service"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;->this$0:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->-$$Nest$fputmIsBound(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;->this$0:Lcom/motorola/ccc/ota/env/ForceUpgradeManager;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->-$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V

    return-void
.end method
