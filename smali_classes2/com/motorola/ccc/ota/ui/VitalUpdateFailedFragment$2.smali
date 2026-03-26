.class Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$2;
.super Ljava/lang/Object;
.source "VitalUpdateFailedFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->initUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "OTA Update Fail Status accepted by user!"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->-$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->-$$Nest$mhandleOnCancelUpdateFragment(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)V

    return-void
.end method
