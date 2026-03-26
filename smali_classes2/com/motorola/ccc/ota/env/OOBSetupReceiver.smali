.class public Lcom/motorola/ccc/ota/env/OOBSetupReceiver;
.super Landroid/content/BroadcastReceiver;
.source "OOBSetupReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    const-string p0, "OtaApp"

    const-string p1, "OOBSetupReceiver, smartupdateOptin: "

    :try_start_0
    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.motorola.ccc.ota.smart.update.USER_OPTIN"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "smartupdateOptin"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "true"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string p2, "OOB"

    if-eqz p1, :cond_0

    :try_start_1
    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->turnSmartUpdateOn(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_LAUNCH_MODE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_ENABLED_VIA_OOB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->turnSmartUpdateOff(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_ENABLED_VIA_OOB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 p2, 0x0

    invoke-virtual {v0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "OOBSetupReceiver, Error receiving smart update intent from OOB:"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method
