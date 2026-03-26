.class Lcom/motorola/ccc/ota/ui/MenuFragment$7;
.super Landroid/content/BroadcastReceiver;
.source "MenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/MenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.Actions.REFRESH_CHKUPDATE_UI_ON_SIMCHANGE"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "OtaApp"

    const-string p2, "MenuFragment:mUIRefreshSimChangeReceiver:update menu fragment ui on liberty sim change"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/MenuFragment;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/MenuFragment;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isCheckUpdateDisabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->-$$Nest$fgetcheckForUpdates(Lcom/motorola/ccc/ota/ui/MenuFragment;)Landroid/widget/LinearLayout;

    move-result-object p0

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->-$$Nest$fgetcheckForUpdates(Lcom/motorola/ccc/ota/ui/MenuFragment;)Landroid/widget/LinearLayout;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method
