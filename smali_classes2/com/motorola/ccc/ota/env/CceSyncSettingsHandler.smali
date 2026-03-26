.class public Lcom/motorola/ccc/ota/env/CceSyncSettingsHandler;
.super Ljava/lang/Object;
.source "CceSyncSettingsHandler.java"


# static fields
.field public static final CCE_SEND_SETTINGS:Ljava/lang/String; = "com.motorola.cce.Actions.CCE_SEND_SETTINGS"

.field public static final CCE_SEND_SETTINGS_RESPONSE:Ljava/lang/String; = "com.motorola.cce.Actions.CCE_SEND_SETTINGS_RESPONSE"

.field public static final CCE_SETTINGS_UPDATED:Ljava/lang/String; = "com.motorola.cce.Actions.CCE_SETTINGS_UPDATED"

.field public static final DEVICE_MANAGEMENT_PACAKAGE_NAME:Ljava/lang/String; = "com.motorola.ccc.devicemanagement"

.field public static final KEY_SETTINGS_APP_NAME:Ljava/lang/String; = "com.motorola.cce.sharedsettings.appName"

.field public static final KEY_SETTINGS_DEFAULTS_OK:Ljava/lang/String; = "com.motorola.cce.sharedsettings.defaultsOk"

.field public static final KEY_SETTINGS_ERROR:Ljava/lang/String; = "com.motorola.cce.sharedsettings.error"

.field public static final KEY_SETTINGS_LIST:Ljava/lang/String; = "com.motorola.cce.sharedsettings.settingsList"

.field public static final KEY_SETTINGS_PATTERN:Ljava/lang/String; = "com.motorola.cce.sharedsettings.settingsPattern"

.field public static final KEY_SETTINGS_VALUES:Ljava/lang/String; = "com.motorola.cce.sharedsettings.settingsValues"

.field public static final OTA_CATEGORY:Ljava/lang/String; = "OTA"

.field public static final POLLING_FEATURE:Ljava/lang/String; = "ota.service.update.settings.pollingFeature"

.field public static final SETTINGS_ERROR_DEVICE_NOT_PROVISIONED:Ljava/lang/String; = "com.motorola.cce.sharedsettings.errorDeviceNotProvisioned"

.field public static final SETTINGS_ERROR_INVALID_PARAM:Ljava/lang/String; = "com.motorola.cce.sharedsettings.errorInvalidParam"

.field public static final SETTINGS_ERROR_OK:Ljava/lang/String; = "com.motorola.cce.sharedsettings.errorOk"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fetchSettingsList(Landroid/content/Context;)V
    .locals 4

    const-string v0, "OtaApp"

    const-string v1, "CceSyncSettingsHandler.fetchSettingsList:"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "ota.service.update.settings.pollingFeature"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.cce.Actions.CCE_SEND_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.motorola.cce.sharedsettings.appName"

    const-string v3, "OTA"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-object v2, v0

    check-cast v2, Ljava/util/ArrayList;

    const-string v2, "com.motorola.cce.sharedsettings.settingsList"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string v0, "com.motorola.cce.sharedsettings.settingsPattern"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string v0, "com.motorola.cce.sharedsettings.defaultsOk"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.devicemanagement"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.Permissions.INTERACT_BLUR_SERVICE"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public static declared-synchronized onReceiveSettingsList(Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V
    .locals 7

    const-string v0, "CceSyncSettingsHandler.onReceiveSettings: received: "

    const-class v1, Lcom/motorola/ccc/ota/env/CceSyncSettingsHandler;

    monitor-enter v1

    :try_start_0
    const-string v2, "com.motorola.cce.sharedsettings.error"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.cce.sharedsettings.errorOk"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v0, "com.motorola.cce.sharedsettings.settingsValues"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    if-nez p0, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "CceSyncSettingsHandler.onReceiveSettings: received null settings"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :cond_0
    :try_start_1
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "ota.service.update.settings.pollingFeature"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CCeSyncSettingsHandler.onReceiveSettings: Current value : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Received value: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v2, "OtaApp"

    const-string v3, "CceSyncSettingsHandler.onReceiveSettings: No change in settings"

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v3, "on"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NO_POLLING_VALUE_FROM_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/32 v4, 0x15180

    invoke-virtual {p1, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    mul-long/2addr v3, v5

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v5, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v3, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendPollIntent()V

    goto/16 :goto_0

    :cond_3
    const-string v3, "off"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto/16 :goto_0

    :cond_4
    const-string p1, "OtaApp"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "com.motorola.cce.sharedsettings.error"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_5
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public static final registerCceIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 12

    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.cce.Actions.CCE_SETTINGS_UPDATED"

    invoke-virtual {v2, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const/4 v4, 0x0

    const/4 v5, 0x2

    const-string v3, "com.motorola.blur.service.blur.Permissions.INTERACT_BLUR_SERVICE"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    new-instance v8, Landroid/content/IntentFilter;

    invoke-direct {v8}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.cce.Actions.CCE_SEND_SETTINGS_RESPONSE"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "OTA"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    const/4 v10, 0x0

    const/4 v11, 0x2

    const-string v9, "com.motorola.blur.service.blur.Permissions.INTERACT_BLUR_SERVICE"

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    return-void
.end method
