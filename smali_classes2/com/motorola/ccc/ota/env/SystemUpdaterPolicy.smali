.class public Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;
.super Ljava/lang/Object;
.source "SystemUpdaterPolicy.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getCurrentTimeInMins()I
    .locals 5

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p0

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    int-to-long v0, v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const/16 v3, 0xb

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result p0

    int-to-long v3, p0

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    long-to-int p0, v0

    return p0
.end method

.method private getInstallWindowEndTime()I
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getAscVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "STANDALONE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getInstallWindowStartTime(Landroid/content/Context;)I

    move-result v0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getInstallWindowEndTime(Landroid/content/Context;)I

    move-result p0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v0, "device_policy"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {p0}, Landroid/app/admin/DevicePolicyManager;->getSystemUpdatePolicy()Landroid/app/admin/SystemUpdatePolicy;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/admin/SystemUpdatePolicy;->getInstallWindowStart()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {p0}, Landroid/app/admin/SystemUpdatePolicy;->getInstallWindowEnd()I

    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :cond_1
    move p0, v1

    move v0, p0

    goto :goto_0

    :catch_0
    move v0, v1

    :catch_1
    move p0, v1

    :goto_0
    if-eq v0, v1, :cond_2

    if-eq p0, v1, :cond_2

    if-lt v0, p0, :cond_2

    add-int/lit16 p0, p0, 0x5a0

    :cond_2
    return p0
.end method

.method private getInstallWindowStartTime()I
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getAscVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "STANDALONE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getInstallWindowStartTime(Landroid/content/Context;)I

    move-result p0

    return p0

    :cond_0
    :try_start_0
    const-string v0, "device_policy"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {p0}, Landroid/app/admin/DevicePolicyManager;->getSystemUpdatePolicy()Landroid/app/admin/SystemUpdatePolicy;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/admin/SystemUpdatePolicy;->getInstallWindowStart()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private scheduleWindowUpdate()V
    .locals 11

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getCurrentTimeInMins()I

    move-result v0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowStartTime()I

    move-result v1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowEndTime()I

    move-result p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/4 v4, -0x1

    if-eq v1, v4, :cond_2

    if-ne p0, v4, :cond_0

    goto :goto_0

    :cond_0
    new-instance v4, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    const-string v5, " mins from now"

    const-string v6, "UpdaterUtils.handleSystemUpdatePolicy, next maintenance window will be "

    const-string v7, "OtaApp"

    const v8, 0xea60

    if-ge v0, v1, :cond_1

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-int/2addr v1, v0

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    mul-int/2addr v1, v8

    int-to-long v5, v1

    add-long/2addr v5, v2

    sub-int/2addr p0, v0

    mul-int/2addr p0, v8

    int-to-long v0, p0

    add-long/2addr v2, v0

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_START_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, p0, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_END_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, p0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAlarm(J)V

    goto :goto_0

    :cond_1
    if-le v0, v1, :cond_2

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    rsub-int v0, v0, 0x5a0

    add-int/2addr v1, v0

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    mul-int/2addr v1, v8

    int-to-long v9, v1

    add-long/2addr v5, v9

    add-int/2addr v0, p0

    mul-int/2addr v0, v8

    int-to-long v0, v0

    add-long/2addr v2, v0

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_START_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, p0, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_END_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, p0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAlarm(J)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public cancelAlarm(Landroid/content/Context;)V
    .locals 3

    const-string p0, "alarm"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/AlarmManager;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x14000000

    const/4 v2, 0x1

    invoke-static {p1, v2, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    return-void
.end method

.method public getFreezePeriods()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/app/admin/FreezePeriod;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAscDevice(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "device_policy"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {p0}, Landroid/app/admin/DevicePolicyManager;->getSystemUpdatePolicy()Landroid/app/admin/SystemUpdatePolicy;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/admin/SystemUpdatePolicy;->getFreezePeriods()Ljava/util/List;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public getPolicyType()I
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getAscVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "STANDALONE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getPolicyType(Landroid/content/Context;)I

    move-result p0

    return p0

    :cond_0
    :try_start_0
    const-string v0, "device_policy"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {p0}, Landroid/app/admin/DevicePolicyManager;->getSystemUpdatePolicy()Landroid/app/admin/SystemUpdatePolicy;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/admin/SystemUpdatePolicy;->getPolicyType()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "UpdaterUtils.handleSystemUpdatePolicy, exception: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public getSystemUpdateInfo()Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowStartTime()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowEndTime()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public handleSystemUpdatePolicy(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 19

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-string v4, "com.motorola.blur.service.blur.upgrade.version"

    move-object/from16 v5, p2

    invoke-virtual {v5, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v6

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v5

    const/4 v7, -0x1

    const/4 v8, 0x0

    if-eq v6, v7, :cond_9

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getEnterpriseOta()Z

    move-result v5

    if-nez v5, :cond_0

    goto/16 :goto_2

    :cond_0
    const-string v5, "OtaApp"

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    const-string v1, "UpdaterUtils.handleSystemUpdatePolicy, automatic install policy is set, proceeding with install"

    invoke-static {v5, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "automaticInstall"

    invoke-static {v0, v4, v7, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    :cond_1
    :goto_0
    move v2, v7

    goto :goto_1

    :cond_2
    const/4 v9, 0x3

    const-wide/16 v10, -0x1

    if-ne v6, v9, :cond_4

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v0, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "UpdaterUtils.handleSystemUpdatePolicy, postPoneTime = "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    cmp-long v4, v2, v0

    if-ltz v4, :cond_3

    return v8

    :cond_3
    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAlarm(J)V

    goto :goto_0

    :cond_4
    const/4 v9, 0x2

    if-ne v6, v9, :cond_1

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowStartTime()I

    move-result v6

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowEndTime()I

    move-result v9

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getCurrentTimeInMins()I

    move-result v12

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_START_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v13, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v13

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_END_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v15, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v15

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_WINDOWED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v7, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v17

    cmp-long v1, v2, v17

    if-ltz v1, :cond_5

    return v8

    :cond_5
    if-lt v12, v6, :cond_6

    if-le v12, v9, :cond_7

    :cond_6
    cmp-long v1, v13, v10

    if-eqz v1, :cond_8

    cmp-long v1, v2, v13

    if-ltz v1, :cond_8

    cmp-long v1, v2, v15

    if-gtz v1, :cond_8

    :cond_7
    const-string v1, "UpdaterUtils.handleSystemUpdatePolicy, currentTime falls in windowed maintainence timings, proceeding with install"

    invoke-static {v5, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "windowedInstall"

    const/4 v2, 0x1

    invoke-static {v0, v4, v2, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_1

    :cond_8
    const/4 v2, 0x1

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->scheduleWindowUpdate()V

    :goto_1
    return v2

    :cond_9
    :goto_2
    return v8
.end method

.method public isAutoDownloadOverAnyDataNetworkPolicySet()Z
    .locals 5

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getAscVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "STANDALONE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAutoDownloadOverAnyDataNetworkPolicySet(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "com.motorola.android.enterprise.MotoExtEnterpriseManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    aput-object v3, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    const-string v3, "isFotaAutoUpdateOverAnyDataNetworkEnabled"

    new-array v4, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception while fetching auto download policy: exce msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "ThinkShieldOta"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public isDeviceUnderFreezePeriod()Z
    .locals 8

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getFreezePeriods()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/FreezePeriod;

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v2

    invoke-virtual {v1}, Landroid/app/admin/FreezePeriod;->getStart()Ljava/time/MonthDay;

    move-result-object v3

    invoke-virtual {v1}, Landroid/app/admin/FreezePeriod;->getEnd()Ljava/time/MonthDay;

    move-result-object v1

    invoke-virtual {v3}, Ljava/time/MonthDay;->getMonthValue()I

    move-result v4

    invoke-virtual {v1}, Ljava/time/MonthDay;->getMonthValue()I

    move-result v5

    invoke-virtual {v3}, Ljava/time/MonthDay;->getDayOfMonth()I

    move-result v3

    invoke-virtual {v1}, Ljava/time/MonthDay;->getDayOfMonth()I

    move-result v1

    const/16 v6, 0x1d

    const/4 v7, 0x2

    if-ne v4, v7, :cond_2

    if-ne v3, v6, :cond_2

    add-int/lit8 v3, v3, -0x1

    :cond_2
    if-ne v5, v7, :cond_3

    if-ne v1, v6, :cond_3

    add-int/lit8 v1, v1, -0x1

    :cond_3
    invoke-virtual {v2}, Ljava/time/LocalDate;->getYear()I

    move-result v6

    invoke-static {v6, v4, v3}, Ljava/time/LocalDate;->of(III)Ljava/time/LocalDate;

    move-result-object v3

    invoke-virtual {v2}, Ljava/time/LocalDate;->getYear()I

    move-result v4

    invoke-static {v4, v5, v1}, Ljava/time/LocalDate;->of(III)Ljava/time/LocalDate;

    move-result-object v1

    invoke-virtual {v3}, Ljava/time/LocalDate;->getDayOfYear()I

    move-result v4

    invoke-virtual {v1}, Ljava/time/LocalDate;->getDayOfYear()I

    move-result v5

    if-gt v4, v5, :cond_1

    invoke-virtual {v2}, Ljava/time/LocalDate;->getDayOfYear()I

    move-result v4

    invoke-virtual {v3}, Ljava/time/LocalDate;->getDayOfYear()I

    move-result v3

    if-lt v4, v3, :cond_1

    invoke-virtual {v2}, Ljava/time/LocalDate;->getDayOfYear()I

    move-result v2

    invoke-virtual {v1}, Ljava/time/LocalDate;->getDayOfYear()I

    move-result v1

    if-gt v2, v1, :cond_1

    const-string p0, "OtaApp"

    const-string v0, "Device is under freeze period, so update is blocked"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_0
    return v0
.end method

.method public isOtaUpdateDisabledByPolicyMngr()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledPolicySet()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isDeviceUnderFreezePeriod()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isOtaUpdateDisabledPolicySet()Z
    .locals 7

    const-string p0, "ThinkShieldOta"

    const-string v0, "isOtaUpdateDisabledPolicySet = "

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAscDevice(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string p0, "BLOCK_LIST"

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getCampaignType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 v2, 0x0

    :try_start_0
    const-string v3, "com.motorola.android.enterprise.MotoExtEnterpriseManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    const-string v5, "isOtaUpdateDisabled"

    new-array v6, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Exception while fetching ota update disabled by policy manager: exce msg="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2
.end method

.method public isSystemUpdatePolicyEnabled(Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 5

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 p1, 0x2

    const/4 v2, 0x0

    if-eq p0, p1, :cond_0

    const/4 p1, 0x3

    if-ne p0, p1, :cond_1

    :cond_0
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_WINDOWED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {p2, p1, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p1

    cmp-long p1, v0, p1

    if-ltz p1, :cond_1

    return v2

    :cond_1
    if-lez p0, :cond_2

    const/4 v2, 0x1

    :cond_2
    return v2
.end method

.method public onSystemUpdatePolicyChanged(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V
    .locals 5

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CusSM.onSystemUpdatePolicyChanged, policyType : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x3

    const-wide v1, 0x9a7ec800L

    if-ne p0, v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    add-long/2addr v3, v1

    invoke-virtual {p1, v0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    if-eqz p2, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "Device is under system update policy : Postpone policy is set and end Time is"

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v0, -0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "DEVICE_UNDER_SYSTEM_UPDATE_POLICY."

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->cancelOta(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_1
    const/4 v0, 0x2

    if-ne p0, v0, :cond_2

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_WINDOWED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    add-long/2addr v3, v1

    invoke-virtual {p1, p0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto :goto_0

    :cond_2
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_WINDOWED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    :goto_0
    if-eqz p2, :cond_3

    new-instance p0, Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p1, p0, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    :cond_3
    return-void
.end method

.method public shouldIBlockUpdateForSystemPolicy(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 12

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result p1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getCurrentTimeInMins()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    if-ne p1, v1, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_WINDOWED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v1, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v8

    cmp-long v1, v6, v8

    if-ltz v1, :cond_0

    return v3

    :cond_0
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_START_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v1, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v8

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WINDOW_POLICY_END_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v1, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v10

    cmp-long v1, v10, v4

    if-eqz v1, :cond_1

    cmp-long v1, v6, v8

    if-ltz v1, :cond_1

    cmp-long v1, v6, v10

    if-gtz v1, :cond_1

    return v3

    :cond_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowStartTime()I

    move-result v1

    if-lt v0, v1, :cond_2

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getInstallWindowEndTime()I

    move-result v1

    if-le v0, v1, :cond_3

    :cond_2
    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->scheduleWindowUpdate()V

    return v2

    :cond_3
    const/4 p0, 0x3

    if-ne p1, p0, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    cmp-long p0, p0, v0

    if-gez p0, :cond_4

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr p0, v0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAlarm(J)V

    return v2

    :cond_4
    return v3
.end method

.method public shouldICancelOngoingOtaUpdate(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->shouldIBlockUpdateForSystemPolicy(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledByPolicyMngr()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method
