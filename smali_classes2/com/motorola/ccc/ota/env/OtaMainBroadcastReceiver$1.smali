.class Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;
.super Ljava/lang/Object;
.source "OtaMainBroadcastReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

.field final synthetic val$c:Landroid/content/Context;

.field final synthetic val$i:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->this$0:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    iput-object p2, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    iput-object p3, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$c:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->-$$Nest$sfgetsm()Lcom/motorola/ccc/ota/CusSM;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isBootstrap(Landroid/content/Intent;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isInteractive(Landroid/content/Intent;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getRequestId(Landroid/content/Intent;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v1, v0, v2, v3}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "AndroidClientUpgradeService.handleIntent: %s : bootstrap %s interactive %s id (%s)"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->-$$Nest$sfgetsm()Lcom/motorola/ccc/ota/CusSM;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isBootstrap(Landroid/content/Intent;)Z

    move-result v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getRequestId(Landroid/content/Intent;)I

    move-result v2

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isInteractive(Landroid/content/Intent;)Z

    move-result p0

    invoke-virtual {v0, v1, v2, p0}, Lcom/motorola/ccc/ota/CusSM;->onIntentCheckForUpdate(ZIZ)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->this$0:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$c:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver$1;->val$i:Landroid/content/Intent;

    invoke-virtual {v0, v1, p0}, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;->handleIntent(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
