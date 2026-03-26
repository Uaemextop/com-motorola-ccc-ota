.class Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "VitalUpdateFailedFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;Z)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "VitalUpdateFailedFragment, handleOnBackPressed"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->-$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->-$$Nest$mhandleOnCancelUpdateFragment(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)V

    return-void
.end method
