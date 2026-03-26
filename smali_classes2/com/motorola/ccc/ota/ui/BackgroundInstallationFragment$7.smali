.class Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$7;
.super Landroid/content/BroadcastReceiver;
.source "BackgroundInstallationFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string v0, "com.motorola.ccc.ota.ACTION_AB_UPDATE_PROGRESS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-static {p0, p2}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->-$$Nest$minitializeCustomView(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_VERIFY_PAYLOAD_METADATA_DOWNLOAD_STATUS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-static {p0, p2}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->-$$Nest$mupdateUIDuringCompatibilityCheck(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    const-string v0, "com.motorola.ccc.ota.START_RESTART_ACTIVITY_INTENT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_2
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_START_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "resumeAfterBGScreen"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setFullScreenStartPoint(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPriorityAppRunning(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Restart"

    const/4 v1, 0x0

    invoke-static {p1, v0, p2, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->priorityAppRunningPostponeActivity(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->-$$Nest$fgetmProgressReceiver(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)Landroid/content/BroadcastReceiver;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void

    :cond_3
    const-class p0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p2, p1, p0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const/high16 p0, 0x30000000

    invoke-virtual {p2, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "fragment_type"

    invoke-virtual {p2, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_4
    :goto_0
    return-void
.end method
