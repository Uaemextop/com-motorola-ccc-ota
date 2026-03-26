.class Lcom/motorola/ccc/ota/env/OtaService$2;
.super Ljava/lang/Object;
.source "OtaService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/env/OtaService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OtaService;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/OtaService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetmMainReceiver(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    move-result-object v1

    new-instance v2, Landroid/content/IntentFilter;

    const-string v6, "com.motorola.ccc.ota.START_ACTION"

    invoke-direct {v2, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    const/4 v5, 0x2

    const-string v3, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/ccc/ota/env/OtaService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$mregisterOtaMainBroadcastReceiver(Lcom/motorola/ccc/ota/env/OtaService;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$mregisterUpdateReceiver(Lcom/motorola/ccc/ota/env/OtaService;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetmUpgraderReceiver(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$mregisterUpgraderReceiver(Lcom/motorola/ccc/ota/env/OtaService;Lcom/motorola/ccc/ota/ui/UpgraderReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/env/OtaService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetisServiceStartedOnChkUpdate(Lcom/motorola/ccc/ota/env/OtaService;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "Ota service is started on check for update if it is not running, so sending check for update again once OTA is up"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.Actions.MANUAL_CHECK_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendCheckUpdateIntent(Landroid/content/Context;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService$2;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fputisServiceStartedOnChkUpdate(Lcom/motorola/ccc/ota/env/OtaService;Z)V

    :cond_0
    return-void
.end method
