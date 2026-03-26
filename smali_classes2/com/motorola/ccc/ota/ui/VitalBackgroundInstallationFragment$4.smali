.class Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$4;
.super Landroid/content/BroadcastReceiver;
.source "VitalBackgroundInstallationFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    const-string p1, "OtaApp"

    const-string p2, "Vital Update, BackgroundInstallationFragment:mFinishReceiver, finish BackgroundInstallationFragment"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void
.end method
