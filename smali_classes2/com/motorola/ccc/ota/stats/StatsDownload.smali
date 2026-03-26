.class public Lcom/motorola/ccc/ota/stats/StatsDownload;
.super Ljava/lang/Object;
.source "StatsDownload.java"


# static fields
.field private static final HTTP_TOO_MANY_REQUESTS:I = 0x1ad

.field public static final OTAAPP_TAG:Ljava/lang/String; = "OtaApp"

.field private static final PROC_STAT_FILE:Ljava/lang/String; = "/proc/net/xt_qtaguid/stats"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final buildDownloadCompletedOrFailedStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Landroid/net/ConnectivityManager;J)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->all:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p1, p2, p0, v0}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceUsageStats(Landroid/content/Context;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsDownload;->storeIfaceUsageAtDLEnd(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsDownload;->storeIfaceDifferences(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {p0, p3, p4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaWifi(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    invoke-static {p0, p3, p4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaCellular(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    invoke-static {p0, p3, p4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaAdminApn(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setNetworkUsedByDownload(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadErrorCodes(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {p0, p3, p4}, Lcom/motorola/ccc/ota/stats/StatsDownload;->detectRevenueLeak(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method private static buildDownloadRestartStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Landroid/net/ConnectivityManager;J)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->all:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p1, p2, p0, v0}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceUsageStats(Landroid/content/Context;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsDownload;->storeIfaceUsageAtDLEnd(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;)V

    invoke-static {p0, p3, p4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaWifiBeforeRestart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    invoke-static {p0, p3, p4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaCellularBeforeRestart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    invoke-static {p0, p3, p4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadPercentageViaAdminApnBeforeRestart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    return-void
.end method

.method private static detectRevenueLeak(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V
    .locals 12

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isVerizon()Z

    move-result v0

    const-string v1, "NOT_APPLICABLE"

    if-nez v0, :cond_0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_REVENUE_LEAK_DETECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_REBOOT_DURING_DL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "true"

    const-string v3, "false"

    const-wide/high16 v4, 0x4014000000000000L    # 5.0

    const-wide/16 v6, 0x0

    if-gtz v0, :cond_4

    :try_start_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v8, 0x0

    invoke-virtual {p0, v0, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v8, v10, v8

    if-lez v8, :cond_2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/16 v8, 0x64

    mul-long/2addr v6, v8

    long-to-double v6, v6

    long-to-double p1, p1

    div-double/2addr v6, p1

    const-wide/high16 p1, 0x4059000000000000L    # 100.0

    invoke-static {v6, v7, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    :cond_2
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_ADMINAPN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p1

    sub-double/2addr v6, p1

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_REVENUE_LEAK_TOLERANCE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {p0, v0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getDouble(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/Double;)D

    move-result-wide v4

    cmpl-double p1, p1, v4

    if-lez p1, :cond_3

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_REVENUE_LEAK_DETECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_REVENUE_LEAK_DETECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    :goto_0
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_VIA_CELLULAR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    :cond_5
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_REVENUE_LEAK_TOLERANCE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getDouble(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/Double;)D

    move-result-wide p1

    cmpl-double p1, v6, p1

    if-lez p1, :cond_6

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_REVENUE_LEAK_DETECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_REVENUE_LEAK_DETECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "detectRevenueLeak() exception while reading settings"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_REVENUE_LEAK_DETECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method private static didDownloadRestarted(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)Z
    .locals 4

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RECEIVED_SIZE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    cmp-long p0, v0, p1

    if-lez p0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsDownload;->downloadFileSize()J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-lez p0, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "didDownloadRestarted(), size mismatch. Received: "

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ": StoredReceivedSize: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ": DownloadFileSize: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsDownload;->downloadFileSize()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final downloadErrorcode(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;I)V
    .locals 1

    const/16 v0, 0x193

    if-eq p1, v0, :cond_6

    const/16 v0, 0x194

    if-eq p1, v0, :cond_5

    const/16 v0, 0x19a

    if-eq p1, v0, :cond_4

    const/16 v0, 0x19c

    if-eq p1, v0, :cond_3

    const/16 v0, 0x1a0

    if-eq p1, v0, :cond_2

    const/16 v0, 0x1ad

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1f7

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_SU_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_TOOMANYREQUEST_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_RANGE_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_3
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_PRECONDITION_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_4
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_GONE_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_5
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_NOTFOUND_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_6
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_FORBIDDEN_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :goto_0
    return-void
.end method

.method public static final downloadException(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V
    .locals 1

    const-string v0, "java.io.IOException"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_IO_ERROR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    return-void
.end method

.method private static downloadFileSize()J
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->downloadFileSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final downloadingOrStopped(Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/net/ConnectivityManager;Landroid/content/Context;)V
    .locals 6

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->receivedBytesFromIntent(Landroid/content/Intent;)J

    move-result-wide v0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->totalBytesFromIntent(Landroid/content/Intent;)J

    move-result-wide v2

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->deferredFromIntent(Landroid/content/Intent;)I

    move-result p0

    if-nez p0, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isVerizon()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-static {p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v4

    if-nez v4, :cond_0

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMIN_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMIN_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->returnActiveAdminApnNetwork()Landroid/net/Network;

    move-result-object v5

    invoke-static {p2, v5}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceNameFromNetworkType(Landroid/net/ConnectivityManager;Landroid/net/Network;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v4, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->admin:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p3, p2, p1, v4}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceUsageStats(Landroid/content/Context;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)Ljava/util/ArrayList;

    move-result-object v4

    sget-object v5, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->admin:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p1, v4, v5}, Lcom/motorola/ccc/ota/stats/StatsDownload;->storeIfaceUsageAtDLStart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)V

    :cond_0
    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/stats/StatsDownload;->didDownloadRestarted(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {p1, p3, p2, v2, v3}, Lcom/motorola/ccc/ota/stats/StatsDownload;->buildDownloadRestartStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Landroid/net/ConnectivityManager;J)V

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->clearStatsForDownloading()V

    sget-object v4, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->all:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p3, p2, p1, v4}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceUsageStats(Landroid/content/Context;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)Ljava/util/ArrayList;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {p1, v4, v5}, Lcom/motorola/ccc/ota/stats/StatsDownload;->storeIfaceUsageAtDLStart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)V

    :cond_1
    invoke-static {p1, v2, v3}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadTotalSize(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    invoke-static {p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadedSizeViaWifi(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->returnActiveNetwork(Landroid/net/ConnectivityManager;)Landroid/net/Network;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceNameFromNetworkType(Landroid/net/ConnectivityManager;Landroid/net/Network;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->wifi:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p3, p2, p1, v2}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceUsageStats(Landroid/content/Context;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)Ljava/util/ArrayList;

    move-result-object p2

    sget-object p3, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->wifi:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/stats/StatsDownload;->storeIfaceUsageAtDLStart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)V

    goto :goto_0

    :cond_2
    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMIN_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadedSizeViaAdminApn(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    goto :goto_0

    :cond_3
    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadedSizeViaCellular(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_INTERNET_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_INTERNET_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->returnActiveNetwork(Landroid/net/ConnectivityManager;)Landroid/net/Network;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceNameFromNetworkType(Landroid/net/ConnectivityManager;Landroid/net/Network;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->internet:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p3, p2, p1, v2}, Lcom/motorola/ccc/ota/stats/StatsDownload;->getIfaceUsageStats(Landroid/content/Context;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)Ljava/util/ArrayList;

    move-result-object p2

    sget-object p3, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->internet:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/stats/StatsDownload;->storeIfaceUsageAtDLStart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)V

    :cond_4
    :goto_0
    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setReceivedSize(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    :cond_5
    if-gez p0, :cond_6

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadSuspendedCount(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_6
    return-void
.end method

.method private static getIfaceNameFromNetworkType(Landroid/net/ConnectivityManager;Landroid/net/Network;)Ljava/lang/String;
    .locals 2

    const-string v0, "OtaApp"

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "getIfaceNameFromNetworkType: iface is : "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p0, "getIfaceNameFromNetworkType: link properties is null"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p0, "getIfaceNameFromNetworkType: network is null"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-object v1
.end method

.method public static final getIfaceUsageStats(Landroid/content/Context;Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)Ljava/util/ArrayList;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/ConnectivityManager;",
            "Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;",
            "Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/motorola/ccc/ota/stats/StatsDownloadIface;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p2

    new-instance v1, Ljava/io/File;

    const-string v2, "/proc/net/xt_qtaguid/stats"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    const-string v3, "OtaApp"

    const/4 v4, 0x0

    if-nez v1, :cond_0

    const-string v0, "getIfaceUsageStats(), no kernel support"

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    :cond_0
    sget-object v1, Lcom/motorola/ccc/ota/stats/StatsDownload$1;->$SwitchMap$com$motorola$ccc$ota$stats$StatsDownloadIface$IfaceName:[I

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->ordinal()I

    move-result v5

    aget v1, v1, v5

    const/4 v5, 0x1

    if-eq v1, v5, :cond_4

    const/4 v6, 0x2

    if-eq v1, v6, :cond_3

    const/4 v6, 0x3

    if-eq v1, v6, :cond_2

    const/4 v6, 0x4

    if-eq v1, v6, :cond_1

    move-object v0, v4

    move-object v1, v0

    :goto_0
    move-object v6, v1

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMIN_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_INTERNET_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v4

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_INTERNET_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    move-object v0, v4

    move-object v1, v0

    goto :goto_1

    :cond_4
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMIN_IFACE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    move-object v0, v4

    move-object v6, v0

    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "getIfaceUsageStats() Interface names: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    new-instance v8, Lcom/motorola/ccc/ota/stats/ProcFileReader;

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v9}, Lcom/motorola/ccc/ota/stats/ProcFileReader;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->finishLine()V

    :goto_2
    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->hasMoreData()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextInt()I

    move-result v2

    add-int/lit8 v9, v5, 0x1

    if-eq v2, v9, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getIfaceUsageStats() consistent idx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " after lastIdx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v8}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v8}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v4

    :cond_5
    :try_start_2
    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/motorola/ccc/ota/stats/StatsDownload;->kernelToTag(Ljava/lang/String;)I

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextInt()I

    move-result v9

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextInt()I

    move-result v10

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextLong()J

    move-result-wide v13

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextLong()J

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextLong()J

    move-result-wide v11

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextLong()J

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v15

    if-ne v9, v15, :cond_9

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "iface="

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, " countSet="

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " rxBytes="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, " txBytes="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "getIfaceUsageStats() for uid: "

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    new-instance v5, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;

    sget-object v9, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->admin:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    move-wide v15, v11

    move-object v11, v5

    move-object v12, v9

    invoke-direct/range {v11 .. v16}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;-><init>(Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;JJ)V

    goto :goto_3

    :cond_6
    move-wide v15, v11

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    new-instance v5, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;

    sget-object v12, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->internet:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    move-object v11, v5

    invoke-direct/range {v11 .. v16}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;-><init>(Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;JJ)V

    goto :goto_3

    :cond_7
    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    new-instance v5, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;

    sget-object v12, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->wifi:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    move-object v11, v5

    invoke-direct/range {v11 .. v16}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;-><init>(Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;JJ)V

    goto :goto_3

    :cond_8
    move-object v5, v4

    :goto_3
    if-eqz v5, :cond_9

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    invoke-virtual {v8}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->finishLine()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move v5, v2

    goto/16 :goto_2

    :cond_a
    invoke-static {v8}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    move-object v4, v7

    goto :goto_5

    :catch_0
    move-exception v0

    goto :goto_4

    :catchall_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    move-object v8, v4

    :goto_4
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getIfaceUsageStats() caught exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    invoke-static {v8}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :goto_5
    return-object v4

    :catchall_1
    move-exception v0

    move-object v4, v8

    :goto_6
    invoke-static {v4}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v0
.end method

.method private static kernelToTag(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xa

    if-le v1, v2, :cond_0

    add-int/lit8 v1, v1, -0x8

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    :cond_0
    return v0
.end method

.method private static storeIfaceDifferences(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 8

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_ADMINAPN_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_ADMINAPN_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_CELLULAR_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_CELLULAR_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_WIFI_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_WIFI_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    sub-long/2addr v4, v1

    invoke-virtual {p0, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public static storeIfaceUsageAtDLEnd(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;",
            "Ljava/util/ArrayList<",
            "Lcom/motorola/ccc/ota/stats/StatsDownloadIface;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;

    const-string v1, "OtaApp"

    if-nez v0, :cond_1

    const-string v0, "entry is null , skip it"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Storing Iface At DL END, "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " stats: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/stats/StatsDownload$1;->$SwitchMap$com$motorola$ccc$ota$stats$StatsDownloadIface$IfaceName:[I

    iget-object v2, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    if-eq v1, v2, :cond_4

    const/4 v2, 0x2

    if-eq v1, v2, :cond_3

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_WIFI_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_WIFI_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    iget-wide v7, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    add-long/2addr v5, v7

    invoke-virtual {p0, v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v4, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_CELLULAR_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_CELLULAR_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    iget-wide v7, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    add-long/2addr v5, v7

    invoke-virtual {p0, v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v4, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto/16 :goto_0

    :cond_4
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_ADMINAPN_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_ADMINAPN_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    iget-wide v7, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    add-long/2addr v5, v7

    invoke-virtual {p0, v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_END_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v4, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto/16 :goto_0

    :cond_5
    return-void
.end method

.method public static storeIfaceUsageAtDLStart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/util/ArrayList;Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;",
            "Ljava/util/ArrayList<",
            "Lcom/motorola/ccc/ota/stats/StatsDownloadIface;",
            ">;",
            "Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;

    const-string v1, "OtaApp"

    if-nez v0, :cond_1

    const-string v0, "entry is null , skip it"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Storing Iface At DL Start, "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " stats: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ifaceName interested in is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_3

    iget-object v2, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v2, p2}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "storeIfaceUsageAtDLStart, not interested in ifaceName: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    :goto_1
    sget-object v2, Lcom/motorola/ccc/ota/stats/StatsDownload$1;->$SwitchMap$com$motorola$ccc$ota$stats$StatsDownloadIface$IfaceName:[I

    iget-object v3, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    const-wide/16 v4, 0x0

    if-eq v2, v3, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_5

    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "storeIfaceUsageAtDLStart, default case "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_WIFI_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_WIFI_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v6, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    add-long/2addr v2, v6

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_WIFI_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v4, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto/16 :goto_0

    :cond_5
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_CELLULAR_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_CELLULAR_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v6, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    add-long/2addr v2, v6

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_CELLULAR_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v4, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto/16 :goto_0

    :cond_6
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_ADMINAPN_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_ADMINAPN_TX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v6, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    add-long/2addr v2, v6

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_START_ADMINAPN_RX_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v4, v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto/16 :goto_0

    :cond_7
    return-void
.end method
