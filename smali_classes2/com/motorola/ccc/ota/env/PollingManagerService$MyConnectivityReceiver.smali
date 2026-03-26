.class Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyConnectivityReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    const-string p1, "android.net.conn.RESTRICT_BACKGROUND_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$misDataSaverEnabled(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    const/4 p1, -0x1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mdecideWhoNeedsPolling(Lcom/motorola/ccc/ota/env/PollingManagerService;I)V

    :cond_0
    return-void
.end method
