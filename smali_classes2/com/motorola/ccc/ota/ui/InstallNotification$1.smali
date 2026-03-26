.class Lcom/motorola/ccc/ota/ui/InstallNotification$1;
.super Landroid/content/BroadcastReceiver;
.source "InstallNotification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/InstallNotification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/InstallNotification;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/InstallNotification;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/InstallNotification$1;->this$0:Lcom/motorola/ccc/ota/ui/InstallNotification;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string p1, "com.motorola.ccc.ota.ACTION_NOTIFICATION_SWIPED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-string v0, "OtaApp"

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    const-string p1, "InstallNotification, ACTION_NOTIFICATION_SWIPED"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/InstallNotification;->-$$Nest$sfputsNotificationSwiped(Z)V

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/InstallNotification;->-$$Nest$sfputsNotificationSuspended(Z)V

    :cond_0
    const-string p1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_STATE_CLEAR"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "InstallNotification, UPGRADE_UPDATER_STATE_CLEAR"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/InstallNotification;->-$$Nest$sfputsNotificationSwiped(Z)V

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/InstallNotification;->-$$Nest$sfputsNotificationSuspended(Z)V

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/InstallNotification$1;->this$0:Lcom/motorola/ccc/ota/ui/InstallNotification;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/InstallNotification;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/InstallNotification;)Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification$1;->this$0:Lcom/motorola/ccc/ota/ui/InstallNotification;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mSwipedReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->unRegisterSwipeableNotificationReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method
