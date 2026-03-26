.class Lcom/motorola/ccc/ota/ui/ErrorFragment$1;
.super Ljava/lang/Object;
.source "ErrorFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/ErrorFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/ErrorFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/ErrorFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/ErrorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/ErrorFragment;

    const v1, 0x7f0e01cc

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.Actions.MANUAL_CHECK_UPDATE"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/ErrorFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/ErrorFragment;)Landroid/app/Activity;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {v0, p1, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/ErrorFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/ErrorFragment;)Landroid/app/Activity;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendCheckUpdateIntent(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/ErrorFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/ErrorFragment;)Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/ErrorFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/ErrorFragment;)Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_1
    :goto_0
    return-void
.end method
