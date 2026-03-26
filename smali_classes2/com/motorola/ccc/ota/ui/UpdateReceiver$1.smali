.class Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;
.super Ljava/lang/Object;
.source "UpdateReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForForceInstall(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$i:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->val$i:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->val$context:Landroid/content/Context;

    const-string v2, "alarm"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/AlarmManager;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->val$i:Landroid/content/Intent;

    const/high16 v3, 0x14000000

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/32 v5, 0x927c0

    add-long/2addr v1, v5

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v0, v4, v1, v2, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void
.end method
