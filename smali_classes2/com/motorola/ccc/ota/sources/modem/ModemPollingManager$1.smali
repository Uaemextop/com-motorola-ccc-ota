.class Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$1;
.super Ljava/lang/Object;
.source "ModemPollingManager.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$1;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "ModemPollingManager, successfully bound to Polling Manger Service..."

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$1;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;

    invoke-static {p2}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->-$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$1;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->scheduleModemPolling()V

    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "ModemPollingManager:onServiceDisconnected"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$1;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->-$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V

    return-void
.end method
