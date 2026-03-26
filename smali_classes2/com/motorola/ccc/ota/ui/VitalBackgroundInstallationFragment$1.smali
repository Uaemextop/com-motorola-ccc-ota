.class Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "VitalBackgroundInstallationFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;Z)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Landroid/content/Context;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->-$$Nest$maddCancelConfirmDialog(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;Landroid/content/Context;)V

    return-void
.end method
