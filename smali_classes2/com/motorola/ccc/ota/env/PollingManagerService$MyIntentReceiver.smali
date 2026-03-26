.class Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyIntentReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.pm.alarmintent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "PollingManagerService, alarm fired!"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    const-string v0, "requestId"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p0, p2}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mdecideWhoNeedsPolling(Lcom/motorola/ccc/ota/env/PollingManagerService;I)V

    :cond_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
