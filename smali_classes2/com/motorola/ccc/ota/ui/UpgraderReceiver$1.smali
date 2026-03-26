.class Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;
.super Ljava/lang/Object;
.source "UpgraderReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->rebootDevice(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/UpgraderReceiver;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;->val$context:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result v0

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPreparedForUnattendedUpdate()Z

    move-result v1

    const-string v2, "OtaApp"

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const-string v0, "Resume on reboot"

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_REBOOT_MODE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "resumeOnReboot"

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->rebootAndApply()V

    goto :goto_1

    :cond_0
    const-string v0, "Device not prepared for ROR, proceed with normal reboot"

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v1, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_REBOOT_MODE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "notPreparedForROR"

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver$1;->this$0:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_REBOOT_MODE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "preparedForRORNoNetwork"

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/PowerManager;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    :goto_1
    return-void
.end method
