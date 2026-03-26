.class public Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;
.super Lcom/motorola/ccc/ota/sources/UpgradeSource;
.source "ModemUpgradeSource.java"


# instance fields
.field final _sm:Lcom/motorola/ccc/ota/CusSM;

.field private _versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

.field private final cm:Landroid/net/ConnectivityManager;

.field private final env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field private progress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final tm:Landroid/telephony/TelephonyManager;


# direct methods
.method static bridge synthetic -$$Nest$mhandleCheckWSResponse(Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->handleCheckWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleResourceWSResponse(Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->handleResourceWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 2

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSource;-><init>(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->cm:Landroid/net/ConnectivityManager;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->tm:Landroid/telephony/TelephonyManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iput-object p4, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private buildExtraInfoForCheckRequest(I)Lorg/json/JSONObject;
    .locals 8

    const-string p1, "OtaApp"

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getNetwork()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getApkVersion()I

    move-result v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INCREMENTAL_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static/range {v0 .. v7}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "buildId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "--ModemConfig"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "otaSourceSha1"

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ModemUpgradeSource:buildExtraInfoForCheckRequest caught exception while overriding buildId for modem:exeMsg="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/CusSM;->getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "clientState"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "pollingFeature"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_MODEM_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    const-string v3, "modemPollingIntervalInMilliSeconds"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_PREVIOUS_TRACKING_ID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "prevSessionTrackingId"

    invoke-interface {v1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "buildExtraInfoForCheckRequest"

    invoke-static {v1, p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :try_start_1
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ModemUpgradeSource:buildExtraInfoForCheckRequest caught exception while getting key: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " :"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    return-object v0
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
    sget-object v11, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$3;->$SwitchMap$com$motorola$otalib$cdsservice$utils$NetworkTags:[I

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

.method private handleCheckWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 14

    const-string v0, "ModemUpgradeSource:handleCheckWSResponse"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    if-nez p1, :cond_0

    const-string p0, "ModemUpgradeSource:handleCheckWSResponse: received null response, exit from here"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendOtaServiceStopIntent(Landroid/content/Context;)V

    return-void

    :cond_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/CusSM;->isModemBusy()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string p0, "Modem update is in running isModemBusy=true"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "ModemUpgradeSource.handleCheckWSResponse:check_for_update : %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "ModemUpgradeSource.handleCheckWSResponse: Payload :%s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xc8

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v4

    if-eq v3, v4, :cond_2

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse: received http error from server"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INTERNAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_2
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "contentResponse"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "ModemUpgradeSource: success response from previous auth, parse it"

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/CheckResponseBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p1, :cond_4

    :try_start_1
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v3

    if-nez v3, :cond_4

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    move-object p1, v4

    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "ModemUpgradeSource:handleCheckWSResponse. error parsing contentResponse payload:"

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/CheckResponseBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;

    move-result-object p1

    :cond_4
    :goto_1
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v2, v3, :cond_5

    if-nez p1, :cond_5

    const-string v2, "ModemUpgradeSource:handleCheckWSResponse. error parsing payload"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_5
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v2, v3, :cond_6

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v3

    if-nez v3, :cond_6

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse: no upgrades found for this device at this time"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_6
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v2, v3, :cond_7

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_7

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse: server gone nuts , proceed = true and no content ?"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_7
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v2, v3, :cond_8

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    if-nez v4, :cond_8

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse failed: check_for_update metadata parse exception"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INTERNAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_8
    move-object v12, v4

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    const/4 v13, 0x1

    if-eq v2, v3, :cond_a

    const-string v3, "Modem update is not available, do check request for another carrier if any"

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->canISendSuccessiveModemPollRequest()Z

    move-result v3

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v13}, Lcom/motorola/ccc/ota/CusSM;->onModemPollingExpiryNotification(ZZ)V

    goto :goto_2

    :cond_9
    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendOtaServiceStopIntent(Landroid/content/Context;)V

    :cond_a
    :goto_2
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v2, v3, :cond_e

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_METADATA_FILE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContextTimeStamp()J

    move-result-wide v8

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v11

    const/4 v5, 0x0

    const-string v7, "Polling initiated"

    move-object v4, v12

    invoke-interface/range {v3 .. v11}, Lcom/motorola/ccc/ota/NewVersionHandler;->handleNewVersion(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    move-result-object v3

    sget-object v4, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v3, v4, :cond_b

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse: no upgrades found for this device as WIFI is not available, vital update, wifi only package "

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VU_WIFI_ONLY_WIFI_NOT_AVAILABLE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_3

    :cond_b
    sget-object v4, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_ROOTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v3, v4, :cond_c

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse: no upgrades found for this device as it is rooted"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_ROOTED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_3

    :cond_c
    sget-object v4, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_VERITY_DISABLED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-ne v3, v4, :cond_d

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse: no upgrades found for this device as verity is disabled"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VERITY_DISABLED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    goto :goto_3

    :cond_d
    sget-object v4, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-eq v3, v4, :cond_e

    const-string v2, "OTAUpgradeSource.handleCheckWSResponse: check_for_update handle new version returned false"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    :cond_e
    :goto_3
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    if-ne v2, v3, :cond_10

    :try_start_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_METADATA_ORIGINAL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {v12}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContextTimeStamp()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getReportingTags()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_4

    :catch_2
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "ModemUpgradeSource.handleCheckWSResponse: exception while setting original metadata"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    invoke-static {v12}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteModemMetaDataValues(Lcom/motorola/otalib/common/metaData/MetaData;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    if-eqz p1, :cond_f

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0, p1, v13}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Z)V

    goto :goto_5

    :cond_f
    const-string p1, "ModemUpgradeSource, unable to override Metadata on modem update available"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_10
    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendOtaServiceStopIntent(Landroid/content/Context;)V

    :goto_5
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->pleaseRunStateMachine()V

    return-void
.end method

.method private handleResourceWSResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v0, "ERROR_DD_RESPONSE."

    const-string v2, "OtaApp"

    if-nez p1, :cond_0

    const-string p1, "ModemUpgradeSource:got null response for dd request from cds lib"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v1, "DD response error : got null response for dd request"

    invoke-virtual {p0, p2, p1, v1, v0}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v3

    if-nez v3, :cond_1

    const-string p0, "ModemUpgradeSource:no connection response for dd request from cds lib"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const/16 v3, 0xc8

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v4

    if-eq v3, v4, :cond_2

    const-string p1, "ModemUpgradeSource:got error response for download descriptor request from cds lib"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "DD response error : giving the modem descriptor request after retry count "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

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

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->convertJsonArraytoJsonObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    :try_start_0
    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->getTrackingId()Ljava/lang/String;

    move-result-object v3

    if-eqz v0, :cond_3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string p0, "ModemUpgradeSource:resource request and response trackingId mismatch, return"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->getProceed()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_DOWNLOAD_DESCRIPTOR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendStartDownloadNotification(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    new-array p1, v1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->cancelModemUpdate([Ljava/lang/String;)V

    :goto_0
    return-void

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "ModemUpgradeSource:error parsing download descriptor response: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "error while parsing modem download descriptor response "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, v1, p1, v0}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public checkForDownloadDescriptor(Ljava/lang/String;)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ModemUpgradeSource:checkForDownloadDescriptor:version="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaApp"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "MODEM_METADATA="

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, "ModemUpgradeSource.checkForDownloadDescriptor: failed parsing metadata"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v3, "ModemUpgradeSource.checkForDownloadDescriptor: error while parsing metadata"

    const-string v4, "PARSE_ERROR."

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, "ModemUpgradeSource.checkForDownloadDescriptor: already sent request and waiting for response .. so return from here"

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance v1, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MASTER_CLOUD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_CONTEXT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v8

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_HTTP_SECURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v10

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_TEST_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v11

    move-object v4, v1

    invoke-direct/range {v4 .. v11}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, 0x0

    invoke-virtual {v3, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v14

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceInfoAsJsonObject()Lorg/json/JSONObject;

    move-result-object v16

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->getNetwork()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->getApkVersion()I

    move-result v5

    iget-object v6, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INCREMENTAL_VERSION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v8}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static/range {v3 .. v10}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Lorg/json/JSONObject;

    move-result-object v17

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getIdentityInfoAsJsonObject(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v18

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_REPORTINGTAGS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v20

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v21

    const-string v19, "serialNumber"

    move-object v12, v2

    invoke-direct/range {v12 .. v21}, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v11, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static {v1}, Lcom/motorola/otalib/cdsservice/UrlConstructor/ResourcesUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v4

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v5, 0x9

    invoke-virtual {v1, v3, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v5

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR_HTTP_METHOD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    new-instance v8, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v1, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v2}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/ResourcesRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v8, v1, v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v10

    const/4 v7, 0x0

    move-object v3, v11

    invoke-direct/range {v3 .. v10}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    new-instance v1, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$2;

    invoke-direct {v1, v0}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$2;-><init>(Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v3}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    const/4 v4, 0x0

    invoke-static {v2, v11, v1, v3, v4}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public checkForUpdate(Z)V
    .locals 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROVISION_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_0
    new-instance v1, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MASTER_CLOUD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_CONTEXT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v9

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v10

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_HTTP_SECURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v11

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_TEST_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v12

    move-object v5, v1

    invoke-direct/range {v5 .. v12}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->buildExtraInfoForCheckRequest(I)Lorg/json/JSONObject;

    move-result-object v8

    new-instance v2, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceInfoAsJsonObject()Lorg/json/JSONObject;

    move-result-object v7

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getIdentityInfoAsJsonObject(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "polling"

    const-string v11, "serialNumber"

    const-wide/16 v5, 0x0

    move-object v3, v2

    invoke-direct/range {v3 .. v11}, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static {v1}, Lcom/motorola/otalib/cdsservice/UrlConstructor/CheckUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v13

    const/4 v1, 0x1

    if-nez p1, :cond_1

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_HTTP_RETRIES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    :cond_1
    move v14, v1

    iget-object v1, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECK_FOR_UPGRADE_HTTP_METHOD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    new-instance v1, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v4, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v2}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/CheckRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v18

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v19

    const/16 v16, 0x0

    move-object v12, v3

    move-object/from16 v17, v1

    invoke-direct/range {v12 .. v19}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    new-instance v1, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$1;

    invoke-direct {v1, v0}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$1;-><init>(Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v2}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    const/4 v4, 0x0

    invoke-static {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V

    return-void
.end method

.method public getDownloadHandler()Lcom/motorola/otalib/common/Environment/DownloadHandler;
    .locals 7

    new-instance v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->_sm:Lcom/motorola/ccc/ota/CusSM;

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v4, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    const/4 v5, 0x1

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;-><init>(Landroid/content/Context;Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    return-object v6
.end method
