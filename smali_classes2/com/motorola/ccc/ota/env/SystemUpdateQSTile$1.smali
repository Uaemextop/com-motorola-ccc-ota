.class Lcom/motorola/ccc/ota/env/SystemUpdateQSTile$1;
.super Landroid/content/BroadcastReceiver;
.source "SystemUpdateQSTile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile$1;->this$0:Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;

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

    if-eqz p1, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "SystemUpdateQSTile:mUIRefreshSimChangeReceiver:update system tile ui on liberty sim change"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile$1;->this$0:Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->-$$Nest$mupdateTileUi(Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;)V

    :cond_0
    return-void
.end method
