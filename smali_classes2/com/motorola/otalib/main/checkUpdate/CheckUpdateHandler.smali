.class public Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;
.super Ljava/lang/Object;
.source "CheckUpdateHandler.java"


# static fields
.field private static resourceProgress:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->resourceProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct/range {p0 .. p8}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->handleCheckWSResponse(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct/range {p0 .. p8}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->handleResouresWSResponse(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;)V

    return-void
.end method

.method private buildExtraInfoForCheckRequest(Landroid/content/Context;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;)Lorg/json/JSONObject;
    .locals 6

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getApkVersion(Landroid/content/Context;)I

    move-result v2

    sget-object p0, Lcom/motorola/otalib/main/Settings/LibConfigs;->PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p4, p0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v1, ""

    move-object v0, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;

    move-result-object p0

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/motorola/otalib/main/LibCussm;->getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p2

    const-string p3, "clientState"

    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "buildExtraInfoForCheckRequest"

    invoke-static {p1, p2}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    :try_start_0
    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    invoke-virtual {p0, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p4

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "buildExtraInfoForCheckRequest caught exception while getting key: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v1, " :"

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static convertJsonArraytoJsonObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 10

    const-string v0, "contentResources"

    const-string v1, "trackingId"

    const-string v2, "proceed"

    const/4 v3, 0x0

    if-nez p0, :cond_0

    return-object v3

    :cond_0
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-nez v1, :cond_1

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "convertJsonArraytoJsonObject, contentResources is null"

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    :cond_1
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_8

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v5, "tags"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    move v5, v0

    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_7

    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6

    invoke-static {v6}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetworkTagValid(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "url"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "headers"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$3;->$SwitchMap$com$motorola$otalib$cdsservice$utils$NetworkTags:[I

    invoke-static {v6}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->ordinal()I

    move-result v6

    aget v6, v9, v6

    const/4 v9, 0x1

    if-eq v6, v9, :cond_5

    const/4 v9, 0x2

    if-eq v6, v9, :cond_4

    const/4 v9, 0x3

    if-eq v6, v9, :cond_3

    goto :goto_2

    :cond_3
    const-string v6, "adminApnUrl"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "adminApnHeaders"

    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_4
    const-string v6, "wifiUrl"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "wifiHeaders"

    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_5
    const-string v6, "cellUrl"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "cellHeaders"

    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_6
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_8
    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "downloadContent: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    :catch_0
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error in parsing contentResources response "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3
.end method

.method public static getDeviceInfoAsJsonObject(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;
    .locals 3

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v1, "manufacturer"

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getManufacturer()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "model"

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getModelId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "product"

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getProduct()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getIsPRCDevice()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "isPRC"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "carrier"

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getCarrier()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "userLanguage"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "getDeviceInfoAsJsonObject"

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;
    .locals 3

    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v0, "clientIdentity"

    const-string v1, "motorola-ota-client-app"

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "brand"

    invoke-virtual {p5}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getColorId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "buildDevice"

    invoke-virtual {p5}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getInternalName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "otaSourceSha1"

    invoke-virtual {p5}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p5}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "buildId"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p5}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p5}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getProduct()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "buildDisplayId"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "network"

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    :goto_0
    const-string p1, "provisionedTime"

    invoke-interface {p0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "colorId"

    invoke-virtual {p5}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getColorId()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "apkPackageName"

    invoke-interface {p0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "apkVersion"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const p1, 0x30d44

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string p2, "OtaLibVersion"

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "mobileModel"

    sget-object p2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "BuildPropReader:ExtraInfo "

    invoke-static {p0, p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getIdentityInfoAsJsonObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "serialNumber"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to create JSON object for identityInfo"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static getMasterCloud(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getIsPRCDevice()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getIsProductionDevice()Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "ota-cn-sdc.blurdev.com"

    return-object p0

    :cond_0
    const-string p0, "moto-cds.svcmot.cn"

    return-object p0

    :cond_1
    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getIsProductionDevice()Z

    move-result p0

    if-nez p0, :cond_2

    const-string p0, "moto-cds-staging.appspot.com"

    return-object p0

    :cond_2
    const-string p0, "moto-cds.appspot.com"

    return-object p0
.end method

.method public static getUpgradeSource(Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->user:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    invoke-virtual {v0}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "UPGRADED_VIA_PULL"

    return-object p0

    :cond_0
    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->pairing:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    invoke-virtual {v0}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "UPGRADED_VIA_PAIR"

    return-object p0

    :cond_1
    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->setup:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    invoke-virtual {v0}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "UPGRADED_VIA_INTIAL_SETUP"

    return-object p0

    :cond_2
    const-string p0, "UPGRADED_VIA_UNKNOWN_METHOD"

    return-object p0
.end method

.method private declared-synchronized handleCheckWSResponse(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;)Z
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    move-object v0, p1

    move-object/from16 v9, p3

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    move-object/from16 v8, p8

    const-string v1, "handleCheckWSResponse. error parsing contentResponse payload:"

    const-string v2, "success response from previous auth, parse it"

    const-string v3, "OTAlibUpgradeSource.handleCheckWSResponse: Payload :"

    const-string v4, "OTAlibUpgradeSource.handleCheckWSResponse:"

    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11, v5}, Lcom/motorola/otalib/main/LibCussm;->isBusy(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v11, p1}, Lcom/motorola/otalib/main/LibCussm;->pleaseRunStateMachine(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v5, 0x0

    if-nez p2, :cond_1

    :try_start_1
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "handleCheckWSResponse: received null response, exit from here"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Received null response, exit from here"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v0, v5, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v5

    :cond_1
    :try_start_2
    sget-object v6, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v4

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v4

    const/16 v6, 0xc8

    if-eq v6, v4, :cond_2

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "handleCheckWSResponse: received response with error code"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Received response with error code"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v0, v5, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v5

    :cond_2
    :try_start_3
    sget-object v4, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "contentResponse"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    sget-object v3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "contentResponse"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/CheckResponseBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v3

    if-nez v3, :cond_4

    const-string v0, "Server sent proceed false"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v0, v5, v2}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return v5

    :catch_0
    move-exception v0

    :try_start_5
    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Error parsing contentResponse payload"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v0, v5, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return v5

    :cond_3
    :try_start_6
    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/CheckResponseBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;

    move-result-object v2

    :cond_4
    move-object v13, v2

    if-nez v13, :cond_5

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "handleCheckWSResponse. error parsing payload"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Error parsing payload"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v0, v5, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p0

    return v5

    :cond_5
    :try_start_7
    invoke-virtual {v13}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v1

    if-nez v1, :cond_6

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "OTAUpgradeSource.handleCheckWSResponse: no upgrades found for this device at this time"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "No upgrades found for this device at this time"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v0, v5, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit p0

    return v5

    :cond_6
    :try_start_8
    invoke-virtual {v13}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->proceed()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-virtual {v13}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_7

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "OTAUpgradeSource.handleCheckWSResponse: something wrong at server side, proceed = true and no content"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "something wrong at server side, proceed = true and no content"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v0, v5, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    monitor-exit p0

    return v5

    :cond_7
    :try_start_9
    invoke-virtual {v13}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContent()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    if-nez v6, :cond_8

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "OTAUpgradeSource.handleCheckWSResponse failed: check_for_update metadata parse exception"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "check_for_update metadata parse exception"

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p8 .. p8}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v0, v5, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    monitor-exit p0

    return v5

    :cond_8
    :try_start_a
    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getTriggeredBy()Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->whoInitiated(Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;)Ljava/lang/String;

    move-result-object v5

    move-object v1, p0

    move-object v2, v6

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p3

    move-object/from16 v10, p6

    invoke-virtual/range {v1 .. v10}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->handleNewVersion(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/LibCussm;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v2

    invoke-virtual {v13}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getContextTimeStamp()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setContentTimeSTamp(J)V

    invoke-virtual {v13}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setTrackingId(Ljava/lang/String;)V

    invoke-virtual {v13}, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->getReportingTags()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setReportingTag(Ljava/lang/String;)V

    sget v3, Lcom/motorola/otalib/main/PublicUtilityMethods;->SUCCESS:I

    invoke-virtual {v2, v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setStatusCode(I)V

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v12, v3, v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;)Ljava/util/Map;

    :cond_9
    invoke-virtual {v11, p1}, Lcom/motorola/otalib/main/LibCussm;->pleaseRunStateMachine(Landroid/content/Context;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private handleResouresWSResponse(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    if-nez p2, :cond_0

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "got null response for dd request from cds lib"

    invoke-static {p0, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "ERROR_DD_RESPONSE."

    const-string v4, "DD response error : got null response for dd request"

    move-object v0, p5

    move-object v1, p1

    move-object v2, p4

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result p0

    if-nez p0, :cond_1

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "ERROR_DD_RESPONSE."

    const-string v4, "no connection response for dd request from cds lib"

    move-object v0, p5

    move-object v1, p1

    move-object v2, p4

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const/16 p0, 0xc8

    invoke-virtual {p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result p7

    if-eq p0, p7, :cond_2

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "got error response for download descriptor request from cds lib"

    invoke-static {p0, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "DD response error : giving the descriptor request after retry count "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p2, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 p3, 0x3

    invoke-virtual {p8, p2, p3}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "ERROR_DD_RESPONSE."

    move-object v0, p5

    move-object v1, p1

    move-object v2, p4

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->convertJsonArraytoJsonObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_3

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "ERROR_DD_RESPONSE."

    const-string v4, "Error while parsing contentResources"

    move-object v0, p5

    move-object v1, p1

    move-object v2, p4

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    :try_start_0
    invoke-static {p0}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->getTrackingId()Ljava/lang/String;

    move-result-object p2

    if-eqz p3, :cond_4

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "BotaUpgradeSource:resource request and response trackingId mismatch, return"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_4
    invoke-virtual {p0}, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->getProceed()Z

    move-result p2

    if-eqz p2, :cond_5

    sget-object p2, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-static {p0}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/ContentResourcesBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p8, p2, p0}, Lcom/motorola/otalib/main/Settings/LibSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {p8, p0, p2, p3}, Lcom/motorola/otalib/main/Settings/LibSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 p2, 0x0

    invoke-interface {p6, p4, p0, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto :goto_0

    :cond_5
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "CANCELED_BY_SERVER."

    const-string v4, "server cancelled the update"

    move-object v0, p5

    move-object v1, p1

    move-object v2, p4

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    sget-object p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->resourceProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-virtual {p5, p1}, Lcom/motorola/otalib/main/LibCussm;->pleaseRunStateMachine(Landroid/content/Context;)V

    return-void

    :catch_0
    move-exception p0

    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p6, "error parsing download descriptor response: "

    invoke-direct {p3, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "error while parsing download descriptor response "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v5, "ERROR_DD_RESPONSE."

    move-object v0, p5

    move-object v1, p1

    move-object v2, p4

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static whoInitiated(Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->user:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    if-ne v0, p0, :cond_0

    const-string p0, "user initiated upgrade"

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->setup:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    if-ne v0, p0, :cond_1

    const-string p0, "setup initiated upgrade"

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->pairing:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    if-ne v0, p0, :cond_2

    const-string p0, "pairing initiated upgrade"

    goto :goto_0

    :cond_2
    const-string p0, "An Upgrade"

    :goto_0
    return-object p0
.end method


# virtual methods
.method public checkForDownloadDescriptor(Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Ljava/lang/String;)V
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    move-object/from16 v8, p5

    invoke-virtual/range {p6 .. p6}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v3

    sget-object v0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->resourceProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "OTAUpgradeSource.checkForDownloadDescriptor: already sent request and waiting for response .. so return from here"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    invoke-static/range {p6 .. p6}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getMasterCloud(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Ljava/lang/String;

    move-result-object v10

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v11

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_CONTEXT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p6 .. p6}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getTrackingId()Ljava/lang/String;

    move-result-object v14

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v16

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;

    invoke-virtual/range {p6 .. p6}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getContentTimeSTamp()J

    move-result-wide v19

    invoke-static/range {p6 .. p6}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getDeviceInfoAsJsonObject(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;

    move-result-object v21

    invoke-static/range {p3 .. p3}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getApkVersion(Landroid/content/Context;)I

    move-result v11

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p3 .. p3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const-string v10, ""

    move-object/from16 v9, p3

    move-object/from16 v14, p6

    invoke-static/range {v9 .. v14}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;

    move-result-object v22

    invoke-virtual/range {p6 .. p6}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getIdentityInfoAsJsonObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v23

    const-string v24, "serialNumber"

    invoke-virtual {v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getReportingTag()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v17, v1

    move-object/from16 v26, p7

    invoke-direct/range {v17 .. v26}, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v7, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static {v0}, Lcom/motorola/otalib/cdsservice/UrlConstructor/ResourcesUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v10

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v2, 0x3

    invoke-virtual {v8, v0, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v11

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v12

    new-instance v14, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v1}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/ResourcesRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v14, v0, v1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v1, -0x1

    invoke-virtual {v8, v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v16

    const/4 v13, 0x0

    move-object v9, v7

    invoke-direct/range {v9 .. v16}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Resource request "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v9, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;

    move-object v0, v9

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object/from16 v4, p6

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object v10, v7

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    invoke-direct/range {v0 .. v8}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;-><init>(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;)V

    new-instance v0, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v0}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    const/4 v1, 0x0

    invoke-static {v2, v10, v9, v0, v1}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V

    sget-object v0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->resourceProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public declared-synchronized checkForUpdate(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Landroid/content/Context;ZLcom/motorola/otalib/main/Settings/LibSettings;)V
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    move-object/from16 v10, p0

    move-object/from16 v0, p3

    move-object/from16 v11, p5

    move-object/from16 v8, p7

    const-string v7, "Check for update webRequest"

    const-string v9, "Check for update checkRequest"

    const-string v12, "Check for update extraInfoObject"

    const-string v13, "Check for update urlRequest"

    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v2, "Check for update"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/LibCussm;->isBusy(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v11}, Lcom/motorola/otalib/main/LibCussm;->pleaseRunStateMachine(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v14, Lcom/motorola/otalib/main/InstallStatusInfo;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    sget v6, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_INVALID_RESPONSE:I

    const/4 v5, 0x0

    move-object v1, v14

    move-object/from16 v2, p5

    move-object/from16 v4, p7

    invoke-direct/range {v1 .. v6}, Lcom/motorola/otalib/main/InstallStatusInfo;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;I)V

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v8, v1, v2, v3}, Lcom/motorola/otalib/main/Settings/LibSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_1
    const-string v1, "connectivity"

    invoke-virtual {v11, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result v1

    if-nez v1, :cond_2

    sget v0, Lcom/motorola/otalib/main/PublicUtilityMethods;->NO_NETWORK:I

    invoke-virtual {v14, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusCode(I)V

    const-string v0, "No network"

    invoke-virtual {v14, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->deleteSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move-object/from16 v4, p4

    invoke-interface {v4, v0, v2, v1}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    move-object/from16 v4, p4

    :try_start_2
    new-instance v1, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    invoke-static/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getMasterCloud(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Ljava/lang/String;

    move-result-object v16

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v17

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_CONTEXT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v19

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v20

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v21

    move-object v15, v1

    invoke-direct/range {v15 .. v21}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v13, p1

    invoke-direct {v10, v11, v13, v0, v8}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->buildExtraInfoForCheckRequest(Landroid/content/Context;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;)Lorg/json/JSONObject;

    move-result-object v20

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getDeviceInfoAsJsonObject(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getIdentityInfoAsJsonObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v21

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getTriggeredBy()Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->toString()Ljava/lang/String;

    move-result-object v22

    const-string v23, "serialNumber"

    const-wide/16 v17, 0x0

    move-object v15, v2

    invoke-direct/range {v15 .. v23}, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v12, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static {v1}, Lcom/motorola/otalib/cdsservice/UrlConstructor/CheckUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v16

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v18

    new-instance v1, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v3, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v2}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/CheckRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v8, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v21

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v3, -0x1

    invoke-virtual {v8, v2, v3}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v22

    const/16 v17, 0x0

    const/16 v19, 0x0

    move-object v15, v12

    move-object/from16 v20, v1

    invoke-direct/range {v15 .. v22}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v15, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;

    move-object v1, v15

    move-object/from16 v2, p0

    move-object/from16 v3, p5

    move-object/from16 v4, p4

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p7

    move-object v9, v14

    invoke-direct/range {v1 .. v9}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;-><init>(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;)V

    sget-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getTriggeredBy()Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-static {v11, v12, v15, v1}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Ljava/lang/Class;)V

    goto :goto_0

    :cond_3
    new-instance v0, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v0}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    invoke-static {v11, v12, v15, v0, v1}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized handleNewVersion(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/LibCussm;)Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    move-object/from16 v7, p4

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    const-string v0, "could not store data in db for "

    const-string v10, "CusSM.handleNewVersion failed: could not store data for "

    const-string v11, "CusSM.handleNewVersion new check request "

    const-string v1, "CusSM.handleNewVersion failed: target version exception "

    const-string v2, "CusSM.handleNewVersion: was notified of a new version :"

    monitor-enter p0

    :try_start_0
    sget-object v3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " source Version "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " source Sha1 "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    const/4 v12, 0x0

    if-gtz v2, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "CusSM.handleNewVersion failed: size of package not proper"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " : size of package not proper"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p7 .. p7}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v1, v12, v2}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaLib"

    const-string v3, "size of package not proper"

    const/4 v4, 0x0

    move-object/from16 p2, p3

    move-object/from16 p3, v1

    move-object/from16 p4, p1

    move-object/from16 p5, v2

    move-object/from16 p6, v4

    move-object/from16 p7, v3

    move-object/from16 p8, v0

    invoke-interface/range {p2 .. p8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setStatus(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v12

    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_1

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v2, "CusSM.handleNewVersion failed: target version is less than source"

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " : target version is less than source"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v8, v2}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p7 .. p7}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v9, v0, v12, v3}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v12

    :catch_0
    move-exception v0

    move-object v7, v2

    goto/16 :goto_0

    :cond_1
    :try_start_3
    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaLib"

    const/4 v5, 0x0

    move-object/from16 v1, p3

    move-object v4, p1

    move-object/from16 v6, p4

    invoke-interface/range {v1 .. v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->insert(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "in db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, p9

    invoke-virtual {v2, v1}, Lcom/motorola/otalib/main/LibCussm;->isBusy(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : could not store data in db for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p7 .. p7}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v9, v2, v12, v3}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaLib"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x0

    move-object/from16 p2, p3

    move-object/from16 p3, v2

    move-object/from16 p4, p1

    move-object/from16 p5, v3

    move-object/from16 p6, v4

    move-object/from16 p7, v0

    move-object/from16 p8, v1

    invoke-interface/range {p2 .. p8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setStatus(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v12

    :cond_2
    :try_start_4
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_3
    monitor-exit p0

    const/4 v0, 0x1

    return v0

    :catch_1
    move-exception v0

    :goto_0
    :try_start_5
    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : target version exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p7 .. p7}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v1, v12, v2}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaLib"

    const-string v3, "target version exception"

    const/4 v4, 0x0

    move-object/from16 p2, p3

    move-object/from16 p3, v1

    move-object/from16 p4, p1

    move-object/from16 p5, v2

    move-object/from16 p6, v4

    move-object/from16 p7, v3

    move-object/from16 p8, v0

    invoke-interface/range {p2 .. p8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setStatus(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return v12

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
