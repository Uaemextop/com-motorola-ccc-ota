.class Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyPollingReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmWakeLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmWakeLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "PollingManagerService, wake lock released"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmWakeLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/os/PowerManager$WakeLock;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    return-void
.end method
