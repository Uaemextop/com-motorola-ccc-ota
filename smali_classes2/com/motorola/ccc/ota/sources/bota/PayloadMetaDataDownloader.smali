.class public Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;
.super Ljava/lang/Object;
.source "PayloadMetaDataDownloader.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/DownloadHandler;


# static fields
.field private static final HTTP_TOO_MANY_REQUESTS:I = 0x1ad

.field private static final OTA_DOWNLOAD_ID:Ljava/lang/String; = "com.motorola.ccc.ota.sources.bota.OtaDownloadRequest"

.field private static cm:Landroid/net/ConnectivityManager; = null

.field private static errorCodeHandlers:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private static ioExceptionHandler:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler; = null

.field private static mConnection:Landroid/content/ServiceConnection; = null

.field private static mService:Lcom/motorola/otalib/aidl/IDownloadService; = null

.field private static progress:Z = false

.field private static size:J

.field private static startingOffset:J

.field private static version:Ljava/lang/String;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field private mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final sm:Lcom/motorola/ccc/ota/CusSM;


# direct methods
.method static bridge synthetic -$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)Lcom/motorola/ccc/ota/CusSM;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcallDownloadRequest(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->callDownloadRequest()V

    return-void
.end method

.method static bridge synthetic -$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->unBindwithDownloadService()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetcm()Landroid/net/ConnectivityManager;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->cm:Landroid/net/ConnectivityManager;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgeterrorCodeHandlers()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetioExceptionHandler()Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ioExceptionHandler:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetmService()Lcom/motorola/otalib/aidl/IDownloadService;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputmService(Lcom/motorola/otalib/aidl/IDownloadService;)V
    .locals 0

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputprogress(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$1;-><init>(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p4, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const-string p0, "connectivity"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->cm:Landroid/net/ConnectivityManager;

    return-void
.end method

.method private callDownloadRequest()V
    .locals 23

    move-object/from16 v0, p0

    const-string v1, "com.motorola.ccc.ota.sources.bota.OtaDownloadRequest"

    const-string v2, "OtaApp"

    const-string v3, "PayloadMetaDataDownloader : callDownloadRequest() "

    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    invoke-interface {v3, v1, v4}, Lcom/motorola/otalib/aidl/IDownloadService;->registerCallback(Ljava/lang/String;Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Z

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->getProxyHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v0, v6}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->getProxyPort(Ljava/lang/String;)I

    move-result v14

    new-instance v3, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    const/4 v4, -0x1

    int-to-long v8, v4

    sget-wide v10, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->size:J

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPayloadMetaDataFileName()Ljava/lang/String;

    move-result-object v12

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DISALLOWED_NETS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BACKOFF_VALUES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v16

    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_RETRY_COUNT_DL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v5, 0x9

    invoke-virtual {v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v17

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v19

    sget-wide v21, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->startingOffset:J

    const/4 v7, 0x0

    const/16 v18, 0x1

    const/16 v20, 0x0

    move-object v5, v3

    invoke-direct/range {v5 .. v22}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;-><init>(Ljava/lang/String;ZJJLjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IZLjava/lang/String;ZJ)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-static {v3}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->toJSONString(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Lcom/motorola/otalib/aidl/IDownloadService;->downloadRequest(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "PayloadMetaDataDownloader : callDownloadRequest(): Exception"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private decreaseAndClearRetryCount()V
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->clearRetryTask()V

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->clearRetryTask()V

    :cond_3
    return-void
.end method

.method public static displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V
    .locals 1

    const-string v0, ""

    invoke-static {p0, p1, p2, p3, v0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Ljava/lang/String;)V

    return-void
.end method

.method public static displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "notification"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DEFERRED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq p0, p1, :cond_1

    const/16 p0, 0x6c1

    invoke-virtual {v0, p0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void

    :cond_1
    invoke-static {p2, p0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showVerifyNotification(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1, p0, p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendVerifyPayloadMetadataFileDownloadStatus(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    return-void
.end method

.method private getProxyHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, "OtaApp"

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->name()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in PayloadMetaDataDownloader, getProxyHost: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "PayloadMetaDataDownloader: Sync settings proxy host:"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method private getProxyPort(Ljava/lang/String;)I
    .locals 4

    const-string v0, "OtaApp"

    const/4 v1, -0x1

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exception in PayloadMetaDataDownloader, getProxyPort: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    :cond_0
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "PayloadMetaDataDownloader: Sync settings proxy port:"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return p1
.end method

.method private unBindwithDownloadService()V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PayloadMetaDataDownloader.unBindwithDownloadService, with mService:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and mConnection: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    if-eqz v0, :cond_0

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v2, :cond_0

    :try_start_0
    const-string v2, "com.motorola.ccc.ota.sources.bota.OtaDownloadRequest"

    invoke-interface {v0, v2}, Lcom/motorola/otalib/aidl/IDownloadService;->unregisterCallback(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "PayloadMetaDataDownloader.unBindwithDownloadService, exception "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PayloadMetaDataDownloader.close, with current dl status : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->unBindwithDownloadService()V

    return-void
.end method

.method public getPayloadMetaDataOffsetAndSize(Lorg/json/JSONObject;)[J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-eqz p1, :cond_0

    const-string p0, "additionalInfo"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string p1, "payload_metadata"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string p1, "offset"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    const-string p1, "size"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide p0

    const/4 v2, 0x2

    new-array v2, v2, [J

    const/4 v3, 0x0

    aput-wide v0, v2, v3

    const/4 v0, 0x1

    aput-wide p0, v2, v0

    return-object v2

    :cond_0
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "getPayloadMetaDataOffsetAndSize: server did not sendpayloadMetaData properties"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public isBusy()Z
    .locals 1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "PayloadMetaDataDownloader : Current download status:"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-boolean p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    return p0
.end method

.method public onDeviceShutdown()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_1
    return-void
.end method

.method public declared-synchronized radioGotDown()V
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->unBindwithDownloadService()V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DEFERRED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 19

    move-object/from16 v1, p0

    const-string v0, "mConnection in transferupgrade: "

    const-string v2, "PayloadMetaDataDownloader.transferUpgrade: Version "

    const-string v3, "PayloadMetaDataDownloader.transferUpgrade : "

    const-string v4, "Failed to receive value from the server "

    monitor-enter p0

    :try_start_0
    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/motorola/otalib/common/metaData/MetaData;->getStreamingData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->getPayloadMetaDataOffsetAndSize(Lorg/json/JSONObject;)[J

    move-result-object v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x0

    :try_start_1
    aget-wide v5, v3, v4

    sput-wide v5, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->startingOffset:J

    const/4 v5, 0x1

    aget-wide v6, v3, v5

    sput-wide v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->size:J

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    new-instance v3, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    iget-object v6, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-direct {v3, v6, v7, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    sput-object v3, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ioExceptionHandler:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    new-instance v3, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPayloadMetaDataFileName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x190

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-string v13, "400 Bad Request"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x190

    const/16 v16, 0x0

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v3

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x191

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-string v13, "401 Unauthorized"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x191

    const/16 v16, 0x0

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v3

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x194

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-string v13, "404 Not Found"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x194

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v3

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x193

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-string v13, "403 Forbidden"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x193

    const/16 v16, 0x0

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v3

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x19a

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-string v13, "410 Gone"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x19a

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v3

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x19c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-string v13, "412 Precondition failed"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x19c

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v3

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x1ad

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-string v13, "429 Too many requests"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x1ad

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v3

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "OtaApp"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, " a file of size "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-wide v6, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->size:J

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2, v4}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->checkForUrlExpiry(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v0, "OtaApp"

    const-string v2, "In BotaDownloadHandler.transferupgrade,oops url expired fetching new url"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, "URL timeout"

    invoke-virtual {v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->version:Ljava/lang/String;

    const-string v3, "encountered url timeout go and fetch new download url"

    invoke-static {v0, v2, v3, v4}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendGetDescriptor(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RETRIED:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->decreaseAndClearRetryCount()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_2
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setSoftBankProxyData(Landroid/content/Context;)V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    if-nez v2, :cond_1

    new-instance v2, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$2;

    invoke-direct {v2, v1}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader$2;-><init>(Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;)V

    sput-object v2, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    const-class v4, Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v2, v3, v5}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_0

    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->callDownloadRequest()V

    :goto_0
    sput-boolean v5, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->progress:Z

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-static {v0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->displayVerifyNotification(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/bota/PayloadMetaDataDownloader;->ctx:Landroid/content/Context;

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v4, "PAYLOAD_METADATA_VERIFICATION_FAILED."

    invoke-static {v2, v0, v3, v4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw v0
.end method
