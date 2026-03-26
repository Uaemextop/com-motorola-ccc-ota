.class Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyPhoneStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    return-void
.end method


# virtual methods
.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 4

    const-string v0, "PollingMangerService, phone state: roaming: "

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRoaming()Z

    move-result p1

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fputmRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmParent(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/Service;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Service;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "data_roaming"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v3, v2

    :cond_0
    invoke-static {p1, v3}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fputmDataRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$msendRoamingIntent(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmDataRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    const/4 p1, -0x1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mdecideWhoNeedsPolling(Lcom/motorola/ccc/ota/env/PollingManagerService;I)V

    :cond_2
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
