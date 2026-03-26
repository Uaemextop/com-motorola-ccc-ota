.class public Lcom/motorola/ccc/ota/stats/StatsHelper;
.super Ljava/lang/Object;
.source "StatsHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final buildStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    :cond_0
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_4

    :cond_1
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_3

    :cond_2
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto/16 :goto_2

    :cond_3
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsBuilder;->buildInstallStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "downloadStats"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "downloadStartTime"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_4
    const-string v2, "installStats"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v6, "InstallNotifiedTime"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v3, v6, v4

    if-nez v3, :cond_5

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_5
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "forceUpgradeTimeExpired"

    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "upgradeSource"

    invoke-interface {v3, v4, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_6

    goto :goto_0

    :cond_6
    const-string p2, "NOT_AVAILABLE"

    :goto_0
    const-string p4, "reportingTags"

    invoke-interface {v3, p4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "network"

    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "currentState"

    invoke-interface {v3, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "trackingId"

    invoke-interface {v3, p1, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "preDownloadStats"

    invoke-virtual {v0, p3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-static {p5, p1, p2, p3}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStats(Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "stateStats"

    invoke-interface {v3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "mergeStats"

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsBuilder;->getMergeStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "StatsHelper.buildStats"

    invoke-static {v3, p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    :try_start_0
    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    invoke-virtual {v0, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p4

    new-instance p5, Ljava/lang/StringBuilder;

    const-string p6, "StatsHelper.buildStats caught exception while getting key: "

    invoke-direct {p5, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p5, " :"

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string p4, "OtaApp"

    invoke-static {p4, p3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->clearStats()V

    goto :goto_6

    :cond_8
    const/4 p0, 0x0

    return-object p0

    :cond_9
    :goto_2
    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsBuilder;->buildMergeStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_6

    :cond_a
    :goto_3
    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsBuilder;->buildInstallStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_6

    :cond_b
    :goto_4
    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsBuilder;->buildDownloadStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_6

    :cond_c
    :goto_5
    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsBuilder;->buildPreDownloadStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v0

    :goto_6
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_OTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final getActualDownloadTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)J
    .locals 4

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ACTUAL_DOWNLOAD_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getDownloadPercentage(JJ)Ljava/lang/String;
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-wide/16 v0, 0x64

    mul-long/2addr p0, v0

    long-to-double p0, p0

    long-to-double p2, p2

    div-double/2addr p0, p2

    const-wide/high16 p2, 0x4059000000000000L    # 100.0

    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->min(DD)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%.1f"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getDownloadPercentageViaThisNetwork(Ljava/lang/String;)Ljava/lang/Double;
    .locals 3

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    if-eqz p0, :cond_0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_0
    return-object v0
.end method

.method public static getEOLStatsJSON()Lorg/json/JSONObject;
    .locals 6

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->EOL_VISIT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v4, "eolVisitCount"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROMOTIONAL_LINK_CLICK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v4, "promoLinkClickCount"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NON_PROMOTIONAL_LINK_CLICK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "nonPromoLinkClickCount"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_EOL_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v1, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "totalTimeSpendOnEOLScreenInSecs"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "getEOLStatsJSON"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public static getHistoryStatsJSON()Lorg/json/JSONObject;
    .locals 5

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HISTORY_VISIT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v4, "historyVisitCount"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HISTORY_TAB_CLICK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "historyTabClickCount"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "getHistoryStatsJSON"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public static getSmartUpdateJSON()Lorg/json/JSONObject;
    .locals 6

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "smartUpdateEnabled"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v2

    const-string v3, ""

    const-string v4, "false"

    if-eqz v2, :cond_0

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateTimeSlot"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_OS_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateOSEnabledByUser"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateMREnabledByUser"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getOverriddenSmartUpdateBitMap()I

    move-result v2

    const/16 v5, 0xa

    invoke-static {v2, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateOverriddenBitmap"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_LAUNCH_MODE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateLaunchMode"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_ENABLED_VIA_OOB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateEnabledViaOOB"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_ENABLED_VIA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateEnabledVia"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_DISABLED_VIA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "smartUpdateDisabledVia"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_POP_UP_DISABLE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "smartUpdateDNDSelected"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_VISITED_BUT_DISABLED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateVisitedButDisabled"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_POPUP_SHOWN_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdatePopupShowCount"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_POP_UP_GET_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdatePopupGetStartedCount"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_POP_UP_NOT_NOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdatePopupNotNowCount"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_BOTTOM_SHEET_NOT_NOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "smartUpdateBottomSheetNotNowCount"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_USER_VISITED_SUGGESTIONS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "smartUpdateUserVisitedSuggestions"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DISABLED_SMART_UPDATE_AFTER_INSTALL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "smartUpdateDisabledAfterInstall"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "getSmartUpdateJSON"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private static getStateStats(Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 7

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    if-eqz p3, :cond_0

    const-string v4, "packageNotifiedTime"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_0

    :cond_0
    move-wide v4, v2

    :goto_0
    const-string v6, "PROCESSING"

    invoke-static {v4, v5, v6}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    if-eqz p3, :cond_1

    const-string v4, "downloadNotifiedTime"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_1

    :cond_1
    move-wide v4, v2

    :goto_1
    invoke-static {v4, v5, v6}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    if-eqz p3, :cond_2

    const-string v4, "downloadAcceptedTime"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_2

    :cond_2
    move-wide v4, v2

    :goto_2
    invoke-static {v4, v5, v6}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object p3

    if-eqz p2, :cond_3

    const-string v1, "downloadStartTime"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_3

    :cond_3
    move-wide v4, v2

    :goto_3
    invoke-static {v4, v5, v6}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-interface {v0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object p2

    if-eqz p1, :cond_4

    const-string p3, "InstallNotifiedTime"

    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_4

    :cond_4
    move-wide v4, v2

    :goto_4
    invoke-static {v4, v5, v6}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object p2

    if-eqz p1, :cond_5

    const-string p3, "InstallAcceptedTime"

    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_5

    :cond_5
    move-wide v4, v2

    :goto_5
    invoke-static {v4, v5, v6}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object p2

    if-eqz p1, :cond_6

    const-string p3, "InstallEndTime"

    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    :cond_6
    invoke-static {v2, v3, p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-interface {v0, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "StatsHelper.getStateStats"

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private static getStateStatsObject(JLjava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v1, "time"

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "status"

    invoke-interface {v0, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "StatsHelper.getStateStatsObject"

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static final getTotalDownoadTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)I
    .locals 6

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    sub-long/2addr v4, v1

    invoke-virtual {v0, v4, v5}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public static final getTotalInstallTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)I
    .locals 4

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_TOTAL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public static final getTotalOtaTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)I
    .locals 8

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_PACKAGE_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-virtual {v0, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public static getUpdatePreferenceStats(Lorg/json/JSONObject;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-virtual {v1, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getJsonObject(Lcom/motorola/otalib/common/settings/ISetting;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    if-nez p1, :cond_1

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "saveAndSendStats Exception = "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-object v0
.end method

.method public static getWhyUpdateMattersStatsJSON()Lorg/json/JSONObject;
    .locals 4

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WHY_UPDATE_MATTERS_OS_LINK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "whyUpdateMattersOSLinkClickCount"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "getWhyUpdateMattersStatsJSON"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private static incrementDownloadPercentageViaThisNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;
    .locals 2

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getDownloadPercentageViaThisNetwork(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getDownloadPercentageViaThisNetwork(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    add-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public static final isCountPresent(I)Z
    .locals 0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static setAndBuildDownloadStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Landroid/net/ConnectivityManager;)V
    .locals 5

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOTAL_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_0

    invoke-static {p0, p1, p2, v3, v4}, Lcom/motorola/ccc/ota/stats/StatsDownload;->buildDownloadCompletedOrFailedStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Landroid/net/ConnectivityManager;J)V

    :cond_0
    return-void
.end method

.method public static final setDDObtainedCount(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_DD_OBTAINED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public static final setDownloadAcceptedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_ACCEPTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setDownloadDeferStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_USER_DEFER_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_USER_DEFER_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v2, "downloadDeferCount"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "deferredTime"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "DownloadDeferStats"

    invoke-static {v1, p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "downloadDeferStats"

    invoke-virtual {p2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_USER_DEFER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_USER_DEFER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static final setDownloadEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setDownloadErrorCodes(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 5

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_FORBIDDEN_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->isCountPresent(I)Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_FORBIDDEN_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "403"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_NOTFOUND_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->isCountPresent(I)Z

    move-result v4

    if-eqz v4, :cond_1

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_NOTFOUND_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "404"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v3

    :cond_1
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_GONE_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->isCountPresent(I)Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_GONE_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "410"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v3

    :cond_2
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_PRECONDITION_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->isCountPresent(I)Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_PRECONDITION_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "412"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v3

    :cond_3
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RANGE_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->isCountPresent(I)Z

    move-result v4

    if-eqz v4, :cond_4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RANGE_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "416"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v3

    :cond_4
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOOMANYREQUEST_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->isCountPresent(I)Z

    move-result v4

    if-eqz v4, :cond_5

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOOMANYREQUEST_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "429"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v3

    :cond_5
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_SU_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v4

    invoke-static {v4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->isCountPresent(I)Z

    move-result v4

    if-eqz v4, :cond_6

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_SU_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "503"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_6
    move v3, v1

    :goto_1
    const-string v1, "DownloadErrorCodes"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v3, :cond_7

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ERROR_CODES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_2

    :cond_7
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ERROR_CODES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method public static final setDownloadNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 5

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static setDownloadPercentageViaAdminApn(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object v3, p0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method public static setDownloadPercentageViaAdminApnBeforeRestart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_ADMINAPN_BEFORE_RESTART:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object v3, p0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method public static final setDownloadPercentageViaCellular(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object v3, p0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method public static final setDownloadPercentageViaCellularBeforeRestart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_CELLULAR_BEFORE_RESTART:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object v3, p0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method private static setDownloadPercentageViaNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 5

    const-wide/16 v0, 0x0

    invoke-virtual {p3, p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_REBOOT_DURING_DL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v4, 0x0

    invoke-virtual {p3, p0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p0

    if-nez p0, :cond_0

    invoke-static {v2, v3, p4, p5}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getDownloadPercentage(JJ)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p3, p2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    cmp-long p0, v2, v0

    if-gtz p0, :cond_1

    const/4 p0, 0x0

    invoke-virtual {p3, p1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void

    :cond_1
    const-wide/16 v0, 0x64

    mul-long/2addr v2, v0

    long-to-double v0, v2

    long-to-double p4, p4

    div-double/2addr v0, p4

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    const-string p4, "%.1f"

    invoke-static {p0, p4, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static final setDownloadPercentageViaWifi(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object v3, p0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method public static final setDownloadPercentageViaWifiBeforeRestart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_WIFI_BEFORE_RESTART:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object v3, p0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/Configs;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method public static final setDownloadSuspendedCount(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_SUSPENDED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public static final setDownloadTotalSize(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 5

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOTAL_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOTAL_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setDownloadedSizeViaAdminApn(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RECEIVED_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    sub-long/2addr p1, v1

    add-long/2addr v4, p1

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setDownloadedSizeViaCellular(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RECEIVED_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    sub-long/2addr p1, v1

    add-long/2addr v4, p1

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setDownloadedSizeViaWifi(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RECEIVED_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    sub-long/2addr p1, v1

    add-long/2addr v4, p1

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setInstallAcceptedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_ACCEPTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setInstallDeferStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;ZJ)V
    .locals 4

    const-string v0, "InstallDeferStats"

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_AUTOMATICALLY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_USER_DEFER_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_USER_DEFER_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v3, "InstallDeferCount"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "installAutomatically"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {v2, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "deferredTime"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v2, v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_DEFER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_DEFER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static final setInstallEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setInstallNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setInstallStartTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setNetworkUsedByDownload(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getDownloadPercentageViaThisNetwork(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    const-string v0, "WIFI/"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getDownloadPercentageViaThisNetwork(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    cmpl-double v1, v4, v2

    if-lez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Cellular/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getDownloadPercentageViaThisNetwork(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    cmpl-double v1, v4, v2

    if-lez v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "AdminApn/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_PROXY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getDownloadPercentageViaThisNetwork(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    cmpl-double v1, v4, v2

    if-lez v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Proxy/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_4
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_NETWORK_USED_BY_DOWNLOAD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void
.end method

.method public static final setPackageNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_PACKAGE_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_PACKAGE_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SOURCE_SHA1:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DESTINATION_SHA1:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void
.end method

.method public static final setRebootDurindDownloadCount(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_REBOOT_DURING_DL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public static final setReceivedSize(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RECEIVED_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static setStreamingStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V
    .locals 9

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "processingRequired"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "processingNotRequired"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz p1, :cond_2

    const-string v1, "downloadPercentageWifi"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->incrementDownloadPercentageViaThisNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_WIFI:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    const-string v1, "downloadPercentageCellular"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->incrementDownloadPercentageViaThisNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    const-string v1, "downloadPercentageAdminApn"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->incrementDownloadPercentageViaThisNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    const-string v1, "downloadPercentageProxy"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_PROXY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->incrementDownloadPercentageViaThisNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_PROXY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOTAL_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v2, "downloadTotalSize"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOTAL_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, 0x0

    invoke-virtual {p0, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v7

    add-long/2addr v2, v7

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ACTUAL_DOWNLOAD_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v2, "downloadTotalTime"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ACTUAL_DOWNLOAD_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v7

    add-long/2addr v2, v7

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    const-string v1, "errorCode"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p1

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_NETWORK:I

    if-eq p1, v1, :cond_1

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_TRANSFER_ERROR:I

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsDownload;->downloadErrorcode(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;I)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadErrorCodes(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadSuspendedCount(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :goto_1
    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setNetworkUsedByDownload(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    invoke-virtual {p0, p1, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_ACCEPTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    invoke-virtual {p0, p1, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    invoke-virtual {p0, p1, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_2
    if-eqz v0, :cond_3

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_UE_SPECIFIC:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setJsonObject(Lcom/motorola/otalib/common/settings/ISetting;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Exception in StatsHelper, setStreamingStats: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_2
    return-void
.end method

.method public static final setTimeAndIfaceStatsAtDownloadStart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 5

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_MECHANISM:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAdvancedDownloadFeature()Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADVANCE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_DL_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    return-void
.end method

.method public static final setTotalInstallTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_AB_LAST_INSTALLATION_START_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, 0x0

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    sub-long/2addr v0, v5

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_TOTAL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    add-long/2addr v2, v0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_TOTAL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static final setTotalInstallTimeForClassic(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 5

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    sub-long/2addr v3, v0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_TOTAL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static storeExtraInfoStats()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getSmartUpdateJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setJsonObject(Lcom/motorola/otalib/common/settings/ISetting;Lorg/json/JSONObject;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_EOL_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getEOLStatsJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setJsonObject(Lcom/motorola/otalib/common/settings/ISetting;Lorg/json/JSONObject;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_HISTORY_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getHistoryStatsJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setJsonObject(Lcom/motorola/otalib/common/settings/ISetting;Lorg/json/JSONObject;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_WHY_UPDATE_MATTERS_STORED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsHelper;->getWhyUpdateMattersStatsJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setJsonObject(Lcom/motorola/otalib/common/settings/ISetting;Lorg/json/JSONObject;)V

    return-void
.end method
