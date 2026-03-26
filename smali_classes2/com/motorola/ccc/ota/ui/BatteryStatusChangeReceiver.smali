.class public Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BatteryStatusChangeReceiver.java"


# instance fields
.field private botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private mBatteryLevel:I

.field private previousBatteryLevel:I


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method private processBatteryValues(Landroid/content/Context;)V
    .locals 6

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.ccc.ota.Actions.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    const-string v3, "BatteryLow"

    const-string v4, "OtaApp"

    if-nez v2, :cond_0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    const-string p0, "BatteryStatusChangeReceiver:sendBatteryLow = true"

    invoke-static {v4, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p1, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    const-string p0, "BatteryStatusChangeReceiver:sendBatteryLow = false"

    invoke-static {v4, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p1, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "level"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->mBatteryLevel:I

    iget v0, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->previousBatteryLevel:I

    if-eq p2, v0, :cond_1

    iput p2, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->previousBatteryLevel:I

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Battery strength : "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->mBatteryLevel:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "OtaApp"

    invoke-static {v0, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BatteryStatusChangeReceiver;->processBatteryValues(Landroid/content/Context;)V

    :cond_2
    return-void
.end method
