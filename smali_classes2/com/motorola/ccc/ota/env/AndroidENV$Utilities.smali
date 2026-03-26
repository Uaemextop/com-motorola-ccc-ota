.class Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;
.super Ljava/lang/Object;
.source "AndroidENV.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/AndroidENV;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Utilities"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/AndroidENV;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/AndroidENV;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private cleanWifiDiscoveryTimer()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->unRegisterWithWiFiDiscoveryManager()V

    :cond_0
    return-void
.end method

.method private getExtraPhoneInfoJson()Lorg/json/JSONObject;
    .locals 5

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->getTotalSize(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "totalDataSizeInBytes"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->getAvailableSize(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "availableDataSizeInBytes"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->getTotalSize(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "totalSystemSizeInBytes"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->getAvailableSize(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    const-string v1, "availableSystemSizeInBytes"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getAvailableReserveSpace()J

    move-result-wide v1

    const-wide/32 v3, 0x100000

    div-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    const-string v1, "reservedSpaceInMb"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "AndroidENV.getMemoryJson"

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public cancelBGInstallNotification()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->cancelBGInstallNotification(Landroid/content/Context;)V

    return-void
.end method

.method public cancelDownloadNotification()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->cancelDownloadNotification(Landroid/content/Context;)V

    return-void
.end method

.method public cancelRestartNotification()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->cancelRestartNotification(Landroid/content/Context;)V

    return-void
.end method

.method public cancelUpdateNotification()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->cancelUpdateNotification(Landroid/content/Context;)V

    return-void
.end method

.method public cleanBotaWifiDiscoveryTimer()V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "OtaApp"

    const-string v1, "cleanBotaWifiDiscoveryTimer"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->cleanWifiDiscoveryTimer()V

    return-void
.end method

.method public cleanFotaWifiDiscoveryTimer()V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "OtaApp"

    const-string v1, "cleanFotaWifiDiscoveryTimer"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->cleanWifiDiscoveryTimer()V

    return-void
.end method

.method public getAvailableDataPartitionSize()J
    .locals 4

    new-instance p0, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v0

    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v2

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public getAvailableSize(Ljava/lang/String;)J
    .locals 2

    new-instance p0, Landroid/os/StatFs;

    invoke-direct {p0, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v0

    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide p0

    mul-long/2addr v0, p0

    return-wide v0
.end method

.method public getDeviceAdditionalInfo()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    new-instance v2, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->getExtraPhoneInfoJson()Lorg/json/JSONObject;

    move-result-object v3

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    iget-object v4, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v4}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v0, v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getCurrentNetworkType(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v4, "networkInfo"

    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getBatteryLevel(Landroid/content/Context;)I

    move-result v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "%"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "batteryLevel"

    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "memoryInfo"

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "systemUpdatePolicy"

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getSystemUpdateInfo()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_DD_OBTAINED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v0, "downloadRetryCount"

    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "AndroidENV.getDeviceAdditionalInfo"

    invoke-static {v1, p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getNetwork()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetwork(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSpaceAvailable(Ljava/lang/String;)J
    .locals 2

    new-instance p0, Landroid/os/StatFs;

    invoke-direct {p0, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v0

    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide p0

    mul-long/2addr v0, p0

    return-wide v0
.end method

.method public getTotalSize(Ljava/lang/String;)J
    .locals 2

    new-instance p0, Landroid/os/StatFs;

    invoke-direct {p0, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockCountLong()J

    move-result-wide v0

    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide p0

    mul-long/2addr v0, p0

    return-wide v0
.end method

.method public isDeviceInIdleMode()Z
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/PowerManager;

    invoke-virtual {p0}, Landroid/os/PowerManager;->isDeviceIdleMode()Z

    move-result p0

    return p0
.end method

.method public isDownloadAllowed(Landroid/content/Context;)Z
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DISALLOWED_NETS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x1

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1, v0, v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p1, "OTHER"

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CusNet.isDownloadAllowed: currently on: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; disallowed nets are: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/StringTokenizer;

    const-string v3, ","

    invoke-direct {v0, p0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_2

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "CusNet.isDownloadAllowed: network not allowed "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_3
    :goto_0
    return v2
.end method

.method public isSpaceAvailable(Ljava/lang/String;J)Z
    .locals 2

    new-instance p0, Landroid/os/StatFs;

    invoke-direct {p0, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v0

    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide p0

    mul-long/2addr v0, p0

    cmp-long p0, v0, p2

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public moveFotaToGettingDescriptorState()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->moveFotaToGettingDescriptorState(Landroid/content/Context;)V

    return-void
.end method

.method public postAvailableReserveSpace()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->postAvailableReserveSpace(Landroid/content/Context;)V

    return-void
.end method

.method public readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/env/CusFrameworkDeps;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public registerWithForceUpgradeManager(J)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->registerWithForceUpgradeManager(Landroid/content/Context;J)V

    return-void
.end method

.method public registerWithWiFiDiscoveryManager(JZZ)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->registerWithWiFiDiscoveryManager(Landroid/content/Context;JZZ)V

    return-void
.end method

.method public sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sendActionUpdateResponse:request id is "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p2, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionUpdateResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public sendCheckForUpdate(ZI)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendCheckForUpdate(Landroid/content/Context;ZI)V

    return-void
.end method

.method public sendCheckForUpdate(ZIZ)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendCheckForUpdate(Landroid/content/Context;ZIZ)V

    return-void
.end method

.method public sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendCheckForUpdateResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V

    return-void
.end method

.method public sendDiscoverTimerExpiryIntent()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendDiscoverTimerExpiryIntent(Landroid/content/Context;)V

    return-void
.end method

.method public sendErrorCode(I)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendErrorcode(Landroid/content/Context;I)V

    return-void
.end method

.method public sendException(Ljava/lang/Exception;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendException(Landroid/content/Context;Ljava/lang/Exception;)V

    return-void
.end method

.method public sendException(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendException(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public sendForceUpgradeTimerExpiryIntent()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendForceUpgradeTimerExpiryIntent(Landroid/content/Context;)V

    return-void
.end method

.method public sendGetDescriptor(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendGetDescriptor(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public sendInstallSystemUpdateAvailableNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendInstallSystemUpdateAvailableNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendInternalNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendPollIntent()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendPollIntent(Landroid/content/Context;)V

    return-void
.end method

.method public sendRebootDuringDownloadIntent()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendRebootDuringDownloadIntent(Landroid/content/Context;)V

    return-void
.end method

.method public sendStartBackgroundInstallationFragment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendStartBackgroundInstallationFragment(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendStartDownloadNotification(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendStartDownloadNotification(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public sendStartDownloadProgressFragment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendStartDownloadProgressFragment(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendStartRestartActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendStartRestartActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendSystemRestartNotificationForABUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendSystemRestartNotificationForABUpdate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendSystemUpdateAvailableNotification(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendSystemUpdateAvailableNotification(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatusError(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    return-void
.end method

.method public sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatusError(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    return-void
.end method

.method public sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatusError(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendUpdateDownloadStatusProgress(Ljava/lang/String;JJLjava/lang/String;)V
    .locals 7

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object v6, p6

    invoke-static/range {v0 .. v6}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatusProgress(Landroid/content/Context;Ljava/lang/String;JJLjava/lang/String;)V

    return-void
.end method

.method public sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V
    .locals 6

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatusRetried(Landroid/content/Context;Ljava/lang/String;JJ)V

    return-void
.end method

.method public sendUpdateDownloadStatusSuccess(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-static/range {v0 .. v6}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatusSuccess(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V
    .locals 8

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object v6, p6

    move v7, p7

    invoke-static/range {v0 .. v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateDownloadStatusSuspended(Landroid/content/Context;Ljava/lang/String;JJLjava/lang/String;Z)V

    return-void
.end method

.method public sendUpdateNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendUpdateStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 6

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateStatus(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    return-void
.end method

.method public sendUpdaterStateReset()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdaterStateReset(Landroid/content/Context;)V

    return-void
.end method

.method public sendUpgradeExecute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeExecute(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ZLjava/lang/String;)V
    .locals 15

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sendUpgradeStatus: sending intent  ACTION_UPGRADE_UPDATE_STATUS: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v4, p2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v5, p3

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v6, p4

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-wide/from16 v9, p7

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    move/from16 v11, p9

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v12, p10

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " silentOta: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move/from16 v13, p11

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " updateType: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v14, p12

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "OtaApp"

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, p0

    iget-object v0, v0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object v2

    move-object/from16 v3, p1

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-static/range {v2 .. v14}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeStatus(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method public sendVerifyPayloadMetadataFileDownloadStatus(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendVerifyPayloadMetadataFileDownloadStatus(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    return-void
.end method

.method public showAllocateFreeSpaceDialog(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;J)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->showAllocateFreeSpaceDialog(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;J)V

    return-void
.end method

.method public startBotaWifiDiscoveryTimer()V
    .locals 5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    const-string v0, "OtaApp"

    const-string v1, "startBotaWifiDiscoveryTimer"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v2}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const v4, 0x14370

    invoke-virtual {v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v2}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    int-to-long v0, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->registerWithWiFiDiscoveryManager(JZZ)V

    :cond_1
    return-void
.end method

.method public startFotaWifiDiscoveryTimer()V
    .locals 4

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    const-string v0, "OtaApp"

    const-string v1, "startFotaWifiDiscoveryTimer"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0xa4cb800

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {v2}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-wide/32 v2, 0x2a300

    invoke-virtual {p0, v2, v3, v0, v1}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->registerWithWiFiDiscoveryManager(JZZ)V

    :cond_1
    return-void
.end method

.method public triggerForceDeviceLogin()V
    .locals 0

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->triggerForceDeviceLogin()V

    return-void
.end method

.method public unRegisterWithForceUpgradeManager()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->unRegisterWithForceUpgradeManager(Landroid/content/Context;)V

    return-void
.end method

.method public unRegisterWithWiFiDiscoveryManager()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;->this$0:Lcom/motorola/ccc/ota/env/AndroidENV;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidENV;->-$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->unRegisterWithWiFiDiscoveryManager(Landroid/content/Context;)V

    return-void
.end method

.method public verifyPackage(Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p0, 0x0

    invoke-static {p1, p0, p0}, Landroid/os/RecoverySystem;->verifyPackage(Ljava/io/File;Landroid/os/RecoverySystem$ProgressListener;Ljava/io/File;)V

    return-void
.end method
