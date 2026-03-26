.class Lcom/motorola/ccc/ota/ui/WarningAlertDialog$1;
.super Landroid/content/BroadcastReceiver;
.source "WarningAlertDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/WarningAlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/WarningAlertDialog;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/WarningAlertDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$1;->this$0:Lcom/motorola/ccc/ota/ui/WarningAlertDialog;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "Finished warning alert dialog"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.ui.finish_wad"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$1;->this$0:Lcom/motorola/ccc/ota/ui/WarningAlertDialog;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->dismissAllowingStateLoss()V

    :cond_0
    return-void
.end method
