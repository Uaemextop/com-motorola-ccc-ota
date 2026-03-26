.class Lcom/motorola/ccc/ota/env/OtaService$1;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "OtaService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/env/OtaService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OtaService;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/OtaService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 3

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isCtaVersion(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    const-string v0, "OtaApp"

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHANNEL_ID_UPDATED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "OtaService:NetworkCallback:onAvailable:TOS Check passed and initial setup is triggered"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetmOobReceiver(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->disableSelf(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetmOobReceiver(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->broadcastCheckforUpdateIntent(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetmConnMgr(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/net/ConnectivityManager;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetnetworkCallback(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/net/ConnectivityManager$NetworkCallback;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "OtaService.NetworkCallback:onAvailable; data connection available, INITIAL_SETUP_COMPLETED = "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " : INITIAL_SETUP_TRIGGERED"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " : CHANNEL_ID_UPDATED = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService$1;->this$0:Lcom/motorola/ccc/ota/env/OtaService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/OtaService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHANNEL_ID_UPDATED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/net/ConnectivityManager$NetworkCallback;->onLost(Landroid/net/Network;)V

    const-string p0, "OtaApp"

    const-string p1, "OtaService.NetworkCallback:onLost no data connection"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
