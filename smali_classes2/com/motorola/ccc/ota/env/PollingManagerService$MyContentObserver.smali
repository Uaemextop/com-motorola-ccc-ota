.class Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;
.super Landroid/database/ContentObserver;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyContentObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onChange(Z)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmParent(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/Service;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Service;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "data_roaming"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    move v1, v0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmDataRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z

    move-result p1

    if-eq v1, p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fputmDataRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$msendRoamingIntent(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    :cond_1
    return-void
.end method
