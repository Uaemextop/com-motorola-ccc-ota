.class Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$6;
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$6;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    const-string p1, "OtaApp"

    const-string p2, "BackgroundInstallationFragment:mFinishReceiver, finish BackgroundInstallationFragment"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$6;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void
.end method
