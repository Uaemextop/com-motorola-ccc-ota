.class public Lcom/motorola/ccc/ota/ui/PowerdownReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PowerdownReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p0, ""

    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "PowerdownReceiver, Received intent "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "android.intent.action.REBOOT"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    new-instance p0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEVICE_REBOOTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disableBatteryStatusReceiver()Z

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disablePowerDownReceiver()Z

    :cond_2
    return-void
.end method
