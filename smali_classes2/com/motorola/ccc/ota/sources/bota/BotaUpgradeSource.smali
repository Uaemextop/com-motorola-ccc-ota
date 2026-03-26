.class public Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;
.super Lcom/motorola/ccc/ota/sources/UpgradeSource;
.source "BotaUpgradeSource.java"


# instance fields
.field final _sm:Lcom/motorola/ccc/ota/CusSM;

.field private _versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

.field private final cm:Landroid/net/ConnectivityManager;

.field private final env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field private progress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final tm:Landroid/telephony/TelephonyManager;


# direct methods
.method static bridge synthetic -$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mhandleCheckWSResponse(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->handleCheckWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;IZ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleResouresWSResponse(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->handleResouresWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 2

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSource;-><init>(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->cm:Landroid/net/ConnectivityManager;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->tm:Landroid/telephony/TelephonyManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iput-object p4, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private buildExtraInfoForCheckRequest(I)Lorg/json/JSONObject;
    .locals 9

    new-instance v0, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getNetwork()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getApkVersion()I

    move-result v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INCREMENTAL_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static/range {v1 .. v8}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v1

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "autoDownloadPolicySet"

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledPolicySet()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "disableOtaUpdatePolicySet"

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isDeviceUnderFreezePeriod()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v3, "isDeviceUnderFreezePeriod"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/CusSM;->getCurrentState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "clientState"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "pollingFeature"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {v0, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v3, "pollingIntervalInMilliSeconds"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PREVIOUS_TRACKING_ID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "prevSessionTrackingId"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_TRIGGER_LAUNCH_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "userTriggerLaunchPoint"

    invoke-interface {v2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_TRIGGER_LAUNCH_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_INSTALL_PREFS_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, "0"

    invoke-virtual {p1, v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "updatePreferenceVisitedCount"

    invoke-interface {v2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_UPDATE_PREFS_SELECTED_FROM_UPDATE_COMPLETE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "updatePreferenceVisitedFromUpdateCompleteCount"

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getSmartUpdateJSON()Lorg/json/JSONObject;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getUpdatePreferenceStats(Lorg/json/JSONObject;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "smartUpdateStats"

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getEOLStatsJSON()Lorg/json/JSONObject;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_EOL_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getUpdatePreferenceStats(Lorg/json/JSONObject;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "eolStats"

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getHistoryStatsJSON()Lorg/json/JSONObject;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_HISTORY_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getUpdatePreferenceStats(Lorg/json/JSONObject;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "historyStats"

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getWhyUpdateMattersStatsJSON()Lorg/json/JSONObject;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_WHY_UPDATE_MATTERS_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getUpdatePreferenceStats(Lorg/json/JSONObject;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "whyUpdateMattersStats"

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const-string p1, "vabMergeCheckUpdateAfterDeviceCorrupted"

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "buildExtraInfoForCheckRequest"

    invoke-static {v2, p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_0
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "buildExtraInfoForCheckRequest caught exception while getting key: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " :"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "OtaApp"

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method private clearSomePrefs()V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "clearing triggered by setting: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public static convertJsonArraytoJsonObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 12

    const-string v0, "contentResources"

    const-string v1, "trackingId"

    const-string v2, "proceed"

    const-string v3, "OtaApp"

    const/4 v4, 0x0

    if-nez p0, :cond_0

    return-object v4

    :cond_0
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    invoke-virtual {v5, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p0, "convertJsonArraytoJsonObject, contentResources is null"

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-object v5

    :cond_1
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    const-class v0, [Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;

    invoke-virtual {v1, p0, v0}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;

    if-eqz p0, :cond_a

    array-length v0, p0

    if-gtz v0, :cond_2

    goto/16 :goto_3

    :cond_2
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_9

    aget-object v6, p0, v2

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->getTags()[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    move v9, v1

    :goto_1
    if-ge v9, v8, :cond_8

    aget-object v10, v7, v9

    if-eqz v10, :cond_7

    invoke-static {v10}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetworkTagValid(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_3

    goto :goto_2

    :cond_3
    sget-object v11, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$3;->$SwitchMap$com$motorola$otalib$cdsservice$utils$NetworkTags:[I

    invoke-static {v10}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    move-result-object v10

    invoke-virtual {v10}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->ordinal()I

    move-result v10

    aget v10, v11, v10

    const/4 v11, 0x1

    if-eq v10, v11, :cond_6

    const/4 v11, 0x2

    if-eq v10, v11, :cond_5

    const/4 v11, 0x3

    if-eq v10, v11, :cond_4

    goto :goto_2

    :cond_4
    const-string v10, "adminApnUrl"

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->getDownloadURL()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v10, "adminApnHeaders"

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->getHeaders()Lorg/json/JSONObject;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_5
    const-string v10, "wifiUrl"

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->getDownloadURL()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v10, "wifiHeaders"

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->getHeaders()Lorg/json/JSONObject;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_6
    const-string v10, "cellUrl"

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->getDownloadURL()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v10, "cellHeaders"

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->getHeaders()Lorg/json/JSONObject;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_7
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_9
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "downloadContent: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    return-object v5

    :cond_a
    :goto_3
    return-object v4

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error in parsing contentResources response "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object v4
.end method

.method private getTriggeredBy(I)Ljava/lang/String;
    .locals 3

    const/4 p0, 0x5

    new-array v0, p0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "user"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "setup"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "polling"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "notification"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "other"

    aput-object v2, v0, v1

    if-ltz p1, :cond_0

    if-ge p1, p0, :cond_0

    aget-object v2, v0, p1

    :cond_0
    return-object v2
.end method

.method private handleCheckWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;IZ)V
    .locals 17

    move-object/from16 v1, p0

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "OtaApp"

    if-nez p1, :cond_0

    const-string v0, "handleCheckWSResponse: received null response, exit from here"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INTERNAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    iget-object v5, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v5

    invoke-interface {v5, v0, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->scheduleDefaultPolling(I)V

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendOtaServiceStopIntent(Landroid/content/Context;)V

    return-void

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v0

    const/16 v6, 0xc8

    if-ne v6, v0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->storeExtraInfoStats()V

    :cond_1
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/CusSM;->isBusy()Z

    move-result v0

    const/4 v7, 0x2

    if-eqz v0, :cond_3

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_ALREADY:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v4

    invoke-interface {v4, v0, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V

    if-ne v2, v7, :cond_2

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v5, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/32 v7, 0x5265c00

    invoke-virtual {v5, v6, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-virtual {v0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendPollIntent()V

    :cond_2
    return-void

    :cond_3
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getHeaders()Ljava/util/Map;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v8, v9}, [Ljava/lang/Object;

    move-result-object v8

    const-string v9, "OTAUpgradeSource.handleCheckWSResponse:check_for_update : %s, id : %d"

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    const-string v9, "OTAUpgradeSource.handleCheckWSResponse: Payload :%s"

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v8

    if-eq v6, v8, :cond_5

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: received http error from server"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v0

    if-nez v0, :cond_4

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NET:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INTERNAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_5
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v6

    const/4 v8, 0x0

    if-eqz v6, :cond_6

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v9, "contentResponse"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v10, "success response from previous auth, parse it"

    invoke-direct {v6, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/CheckResponseBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;

    move-result-object v6
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v6, :cond_7

    :try_start_1
    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v9

    if-nez v9, :cond_7

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    move-object v6, v8

    :goto_1
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "handleCheckWSResponse. error parsing contentResponse payload:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_2

    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/CheckResponseBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;

    move-result-object v6

    :cond_7
    :goto_2
    sget-object v9, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v0, v9, :cond_8

    if-nez v6, :cond_8

    const-string v0, "handleCheckWSResponse. error parsing payload"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_8
    if-eqz v6, :cond_b

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getSmartUpdateBitmap()I

    move-result v9

    if-ltz v9, :cond_9

    iget-object v10, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v10, v9}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->storeBits(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;I)V

    :cond_9
    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->isUploadFailureLogsEnabled()Z

    move-result v9

    if-eqz v9, :cond_a

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPLOAD_UE_FAILURE_LOGS_ENABLED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v11, 0x1

    invoke-virtual {v9, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    new-instance v9, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {v9}, Lcom/motorola/ccc/ota/ui/FileUploadService;->canUploadLogFile(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v9

    if-eqz v9, :cond_b

    const-string v9, "BotaUpgradeSource: Uploading UE log file to sever"

    invoke-static {v5, v9}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v9, Lcom/motorola/ccc/ota/ui/FileUploadService;

    invoke-direct {v9}, Lcom/motorola/ccc/ota/ui/FileUploadService;-><init>()V

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/ui/FileUploadService;->uploadUEFailureFiles()V

    goto :goto_3

    :cond_a
    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPLOAD_UE_FAILURE_LOGS_ENABLED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_b
    :goto_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v9

    const-string v10, "SmartUpdateKey"

    if-eqz v9, :cond_c

    const-string v9, "true"

    invoke-static {v10, v9}, Lcom/motorola/ccc/ota/utils/OtaAppContentProvider;->updateOtaAppContentProvider(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_c
    const-string v9, "false"

    invoke-static {v10, v9}, Lcom/motorola/ccc/ota/utils/OtaAppContentProvider;->updateOtaAppContentProvider(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    sget-object v9, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v0, v9, :cond_10

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getSettings()Lorg/json/JSONObject;

    move-result-object v9

    invoke-direct {v1, v9}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->saveSettings(Lorg/json/JSONObject;)V

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_d

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "on"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_f

    :cond_d
    if-ne v2, v7, :cond_f

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getPollAfterSeconds()J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v7, v9, v11

    if-gtz v7, :cond_e

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v9, v11, v12}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v9, v11, v12}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_5

    :cond_e
    invoke-static {v9, v10}, Lcom/motorola/ccc/ota/env/AndroidPollingManager;->returnValidPollingValue(J)J

    move-result-wide v9

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v11, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const-wide/16 v14, 0x3e8

    mul-long/2addr v9, v14

    add-long/2addr v12, v9

    invoke-virtual {v7, v11, v12, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v11, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v11, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :goto_5
    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v7

    invoke-interface {v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendPollIntent()V

    :cond_f
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v9, "CurrentPollStatusCode:"

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " CurrentCheckResponse:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " NextPollTime in millisecs:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v11, -0x1

    invoke-virtual {v9, v10, v11, v12}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v9

    invoke-virtual {v7, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    :cond_10
    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->scheduleDefaultPolling(I)V

    :goto_6
    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v0, v7, :cond_11

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v7

    if-nez v7, :cond_11

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device at this time"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_11
    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v0, v7, :cond_12

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v7

    if-eqz v7, :cond_12

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v7

    if-nez v7, :cond_12

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: server gone nuts , proceed = true and no content ?"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_12
    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v0, v7, :cond_13

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->getTriggeredBy(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    if-nez v8, :cond_13

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse failed: check_for_update metadata parse exception"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INTERNAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_13
    move-object v15, v8

    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v0, v7, :cond_1c

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA_FILE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_SOFTBANK_APN_ALLOWED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v15}, Lcom/motorola/otalib/common/metaData/MetaData;->getBitmap()I

    move-result v9

    sget-object v10, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->softBankProxy:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->ordinal()I

    move-result v10

    invoke-static {v9, v10}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v9

    invoke-virtual {v7, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

    sget-object v10, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->whoInitiated(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContextTimeStamp()J

    move-result-wide v12

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v16

    const/4 v9, 0x0

    move-object v8, v15

    move-object/from16 p1, v15

    move-object/from16 v15, v16

    invoke-interface/range {v7 .. v15}, Lcom/motorola/ccc/ota/NewVersionHandler;->handleNewVersion(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    move-result-object v7

    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_14

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as update is disabled by policy manager"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_14
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_MOTO_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_15

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as update is disabled by motorola policy manager"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_15
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_BLOCKED_FREEZE_PERIOD:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_16

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as device is under freeze period"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_16
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_BOOTLOADER_UNLOCKED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_17

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as bootloader is unlocked"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_BOOT_UNLOCK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_17
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_18

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as WIFI is not available, vital update, wifi only package "

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VU_WIFI_ONLY_WIFI_NOT_AVAILABLE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_18
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_ROOTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_19

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as it is rooted"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_ROOTED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_19
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_1a

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as merge process is corrupted"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_DEVICE_CORRUPTED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_1a
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_VERITY_DISABLED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v7, v8, :cond_1b

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device as verity is disabled"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VERITY_DISABLED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_1b
    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-eq v7, v8, :cond_1d

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: check_for_update handle new version returned false"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_7

    :cond_1c
    move-object/from16 p1, v15

    :cond_1d
    :goto_7
    move-object v7, v0

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v7, v0, :cond_26

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendDownloadNotifiedToSettings(Landroid/content/Context;)V

    :cond_1e
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_NOTICE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->key()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeEndOfLifeInfo()V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removePreviousCancelledOptionalUpdateSettings()V

    :try_start_2
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA_ORIGINAL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContextTimeStamp()J

    move-result-wide v9

    invoke-virtual {v0, v8, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_8

    :catch_2
    move-exception v0

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "OTAUpgradeSource.handleCheckWSResponse: exception while setting original metadata"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_8
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getMaxUpdateFailCount()I

    move-result v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMaxUpdateFailCountExpired(I)Z

    move-result v0

    const-wide/16 v8, 0x0

    if-eqz v0, :cond_21

    const-string v0, "OTAUpgradeSource, overridePDLValues on FAIL"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v10

    cmpl-double v0, v10, v8

    if-lez v0, :cond_21

    :cond_1f
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    iget-object v10, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v11, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v11, p1

    invoke-static {v11, v0, v10}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteMetaDataValuesOnOtaFailExpiry(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v15

    if-eqz v15, :cond_20

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0, v15}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    goto :goto_a

    :cond_20
    const-string v0, "BotaUpgradeSource, unable to override Metadata on OtaFail"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    :cond_21
    move-object/from16 v11, p1

    :goto_9
    move-object v15, v11

    :goto_a
    invoke-static {v4}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAscDevice(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-static {v15, v4}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteASCMetaDataValues(Lcom/motorola/otalib/common/metaData/MetaData;Landroid/content/Context;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-eqz v0, :cond_22

    iget-object v10, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v10, v0}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;)V

    move-object v15, v0

    goto :goto_b

    :cond_22
    const-string v0, "BotaUpgradeSource, unable to override Metadata for ASC"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_23
    :goto_b
    invoke-virtual {v15}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceUpgradeTime()I

    move-result v0

    if-lez v0, :cond_24

    invoke-virtual {v15}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceUpgradeTime()I

    move-result v0

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v0, v8, v9}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->startForceUpgradeTimer(ILcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    const-string v0, "BOTAUpgradeSource.handleCheckWSResponse, starting force upgrade timer"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    :cond_24
    invoke-virtual {v15}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v10

    cmpl-double v0, v10, v8

    if-ltz v0, :cond_25

    invoke-virtual {v15}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v8

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v10, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v8, v9, v0, v10}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->startForceDownloadTimer(DLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    const-string v0, "BOTAUpgradeSource.handleCheckWSResponse, starting force download timer"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_25
    :goto_c
    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPolicyBundleDirPath()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/FileUtils;->cleanupPolicyBundleDir(Ljava/io/File;)V

    goto :goto_d

    :cond_26
    move-object/from16 v11, p1

    move-object v15, v11

    :goto_d
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-eq v7, v0, :cond_27

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/CusSM;->isBusy()Z

    move-result v0

    if-nez v0, :cond_27

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->clearSomePrefs()V

    :cond_27
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-eq v7, v0, :cond_28

    new-instance v0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_ORDER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "FOTA-BOTA check order is "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_ORDER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->isFotaEnabled()Z

    move-result v8

    if-eqz v8, :cond_28

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->isBotaFirst()Z

    move-result v0

    if-eqz v0, :cond_28

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "OTAUpgradeSource.handleCheckWSResponse: error from BOTA: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", now trying FOTA"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getFotaServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;

    move-result-object v0

    int-to-long v2, v2

    invoke-interface {v0, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;->sendRequestUpdate(J)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/CusSM;->pleaseRunStateMachine()V

    return-void

    :cond_28
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v7, v0, :cond_2c

    if-eqz v6, :cond_2c

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_2b

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v0

    const-string v8, "advancedNotice"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_29

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_NOTICE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v7, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_ADV_NOTICE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto/16 :goto_e

    :cond_29
    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v0

    const-string v8, "eolImageLink"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_MAIN_IMAGE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_PROMO_IMAGE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "eolPromoImageLink"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_PROMO_LINK_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "eolPromoLink"

    const-string v10, "https://www.motorola.com"

    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_ADDITIONAL_INFO:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v6

    const-string v8, "eolAdditionalInfo"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "null"

    const-string v9, ""

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v7, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_EOL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_e

    :cond_2a
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_NOTICE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->key()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeEndOfLifeInfo()V

    goto :goto_e

    :cond_2b
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_NOTICE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->key()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeEndOfLifeInfo()V

    :cond_2c
    :goto_e
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v7, v0, :cond_2d

    invoke-static {v4}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->isAscDevice(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2d

    const-string v0, "OTAUpgradeSource.handleCheckWSResponse: ASC device - start ASC request session"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4, v15}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->startASCUpdateRequestSession(Landroid/content/Context;Lcom/motorola/otalib/common/metaData/MetaData;)V

    return-void

    :cond_2d
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0, v7, v2, v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/CusSM;->pleaseRunStateMachine()V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v7, v0, :cond_2e

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendOtaServiceStopIntent(Landroid/content/Context;)V

    :cond_2e
    return-void
.end method

.method private handleResouresWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v0, "ERROR_DD_RESPONSE."

    const-string v2, "OtaApp"

    if-nez p1, :cond_0

    const-string p1, "got null response for dd request from cds lib"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v1, "DD response error : got null response for dd request"

    invoke-virtual {p0, p2, p1, v1, v0}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v3

    if-nez v3, :cond_1

    const-string p0, "no connection response for dd request from cds lib"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const/16 v3, 0xc8

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v4

    if-eq v3, v4, :cond_2

    const-string p1, "got error response for download descriptor request from cds lib"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "DD response error : giving the descriptor request after retry count "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v4, 0x9

    invoke-virtual {p0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p2, v1, p0, v0}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->convertJsonArraytoJsonObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    :try_start_0
    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->getTrackingId()Ljava/lang/String;

    move-result-object v3

    if-eqz v0, :cond_3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string p0, "BotaUpgradeSource:resource request and response trackingId mismatch, return"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->getProceed()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendStartDownloadNotification(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    new-array p1, v1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    :goto_0
    return-void

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "error parsing download descriptor response: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "error while parsing download descriptor response "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, v1, p1, v0}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private saveSettings(Lorg/json/JSONObject;)V
    .locals 8

    const-string v0, "OtaApp"

    if-eqz p1, :cond_0

    :try_start_0
    const-string v1, "settingsVersion"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SETTINGS_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Change in settingsVersion, update the new appSettings"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "appSettings"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BotaUpgradeSource.saveSettings():saving :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " value :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v6, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setConfig(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Failed reading settings :"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private scheduleDefaultPolling(I)V
    .locals 7

    const/4 v0, 0x2

    if-ne v0, p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NO_POLLING_VALUE_FROM_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/32 v1, 0x15180

    invoke-virtual {p1, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "BotaUpgradeSource.scheduleDefaultPolling, Ota client configured next polling to (in secs) "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "OtaApp"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    mul-long/2addr v0, v5

    add-long/2addr v3, v0

    invoke-virtual {p1, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendPollIntent()V

    :cond_0
    return-void
.end method

.method private whoInitiated(I)Ljava/lang/String;
    .locals 0

    if-nez p1, :cond_0

    const-string p0, "user initiated upgrade"

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    if-ne p0, p1, :cond_1

    const-string p0, "client initiated upgrade"

    goto :goto_0

    :cond_1
    const/4 p0, 0x2

    if-ne p0, p1, :cond_2

    const-string p0, "polling initiated upgrade"

    goto :goto_0

    :cond_2
    const/4 p0, 0x3

    if-ne p0, p1, :cond_3

    const-string p0, "server initiated upgrade"

    goto :goto_0

    :cond_3
    const/16 p0, 0x472

    if-ne p0, p1, :cond_4

    const-string p0, "chained upgrade"

    goto :goto_0

    :cond_4
    const-string p0, "An Upgrade"

    :goto_0
    return-object p0
.end method


# virtual methods
.method public checkForChainUpgrade(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public checkForDownloadDescriptor(Ljava/lang/String;)V
    .locals 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    const-string v2, "OtaApp"

    if-nez v1, :cond_0

    const-string v1, "OTAUpgradeSource.checkForDownloadDescriptor: failed parsing metadata"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v2, "BotaUpgradeSource.checkForDownloadDescriptor: error while parsing metadata"

    const-string v3, "PARSE_ERROR."

    move-object/from16 v4, p1

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, "OTAUpgradeSource.checkForDownloadDescriptor: already sent request and waiting for response .. so return from here"

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setSoftBankProxyData(Landroid/content/Context;)V

    new-instance v1, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MASTER_CLOUD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_CONTEXT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getContextKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_HTTP_SECURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v8

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_TEST_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, 0x0

    invoke-virtual {v3, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v12

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceInfoAsJsonObject()Lorg/json/JSONObject;

    move-result-object v14

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getNetwork()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getApkVersion()I

    move-result v5

    iget-object v6, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INCREMENTAL_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static/range {v3 .. v10}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v15

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getIdentityInfoAsJsonObject(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v16

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v18

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v19

    const-string v17, "serialNumber"

    move-object v10, v2

    invoke-direct/range {v10 .. v19}, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v11, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static {v1}, Lcom/motorola/otalib/cdsservice/UrlConstructor/ResourcesUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v4

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v5, 0x9

    invoke-virtual {v1, v3, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v5

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_HTTP_METHOD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    new-instance v8, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v1, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v2}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/ResourcesRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v8, v1, v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v10

    const/4 v7, 0x0

    move-object v3, v11

    invoke-direct/range {v3 .. v10}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$2;

    invoke-direct {v1, v0}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$2;-><init>(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v3}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    const/4 v4, 0x0

    invoke-static {v2, v11, v1, v3, v4}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public checkForUpdate(ZIZ)V
    .locals 23

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "OTA APK version - "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getApkVersion()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OtaApp"

    invoke-static {v4, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isRoaming(Landroid/net/ConnectivityManager;)Z

    move-result v3

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "BotaUpgradeSource.checkForUpdate, device is in roaming"

    invoke-static {v4, v3}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v3

    sget-object v4, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_ROAMING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-interface {v3, v4, v1, v2, v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->scheduleDefaultPolling(I)V

    return-void

    :cond_0
    invoke-direct {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->getTriggeredBy(I)Ljava/lang/String;

    move-result-object v13

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_1
    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v3, v4, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setSoftBankProxyData(Landroid/content/Context;)V

    new-instance v3, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MASTER_CLOUD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v8

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_CONTEXT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    sget-object v4, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getContextKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_HTTP_SECURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v11

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_TEST_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v12

    move-object v6, v3

    invoke-direct/range {v6 .. v12}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->buildExtraInfoForCheckRequest(I)Lorg/json/JSONObject;

    move-result-object v11

    new-instance v4, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceInfoAsJsonObject()Lorg/json/JSONObject;

    move-result-object v10

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getIdentityInfoAsJsonObject(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v12

    const-string v14, "serialNumber"

    const-wide/16 v8, 0x0

    move-object v6, v4

    invoke-direct/range {v6 .. v14}, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v6, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static {v3}, Lcom/motorola/otalib/cdsservice/UrlConstructor/CheckUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v16

    const/4 v3, 0x1

    if-nez v2, :cond_3

    iget-object v7, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_HTTP_RETRIES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v8, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v3

    :cond_3
    move/from16 v17, v3

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_HTTP_METHOD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v18

    new-instance v3, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v7, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v4}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/CheckRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v7, v4}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v21

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v8, -0x1

    invoke-virtual {v4, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v22

    const/16 v19, 0x0

    move-object v15, v6

    move-object/from16 v20, v3

    invoke-direct/range {v15 .. v22}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    new-instance v3, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;

    invoke-direct {v3, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;-><init>(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;IZ)V

    if-nez v1, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v6, v3, v5}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Ljava/lang/Class;)V

    goto :goto_0

    :cond_4
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v1}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    invoke-static {v0, v6, v3, v1, v5}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V

    :goto_0
    return-void
.end method

.method public getDownloadHandler()Lcom/motorola/otalib/common/Environment/DownloadHandler;
    .locals 7

    new-instance v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v4, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    const/4 v5, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;-><init>(Landroid/content/Context;Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    return-object v6
.end method

.method public sendChainUpgradeRequest(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->bootstrap:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/16 v0, 0x472

    invoke-interface {p0, p1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendCheckForUpdate(ZI)V

    return-void
.end method

.method public setMemoryLowInfo(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 0

    return-void
.end method
