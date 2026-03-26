.class public Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;
.super Ljava/lang/Object;
.source "LibDownloadHandler.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/DownloadHandler;


# static fields
.field private static final HTTP_TOO_MANY_REQUESTS:I = 0x1ad

.field private static final OTA_DOWNLOAD_ID:Ljava/lang/String; = "com.motorola.ccc.otalib.OtaDownloadRequest"

.field private static accSerialNumber:Ljava/lang/String; = null

.field private static cm:Landroid/net/ConnectivityManager; = null

.field private static contextKey:Ljava/lang/String; = null

.field private static errorCodeHandlers:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private static internalName:Ljava/lang/String; = null

.field private static ioExceptionHandler:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler; = null

.field private static mConnection:Landroid/content/ServiceConnection; = null

.field private static mService:Lcom/motorola/otalib/aidl/IDownloadService; = null

.field private static primaryKey:Ljava/lang/String; = null

.field private static progress:Z = false

.field private static size:J

.field private static startingOffset:J

.field private static targetVersion:J


# instance fields
.field private final ctx:Landroid/content/Context;

.field private descriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

.field private mCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

.field private mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

.field private final settings:Lcom/motorola/otalib/main/Settings/LibSettings;

.field private final sm:Lcom/motorola/otalib/main/LibCussm;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Ljava/lang/String;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;

    invoke-direct {v0, p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$1;-><init>(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V

    iput-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    iput-object p3, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sput-object p4, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->internalName:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    sput-wide p7, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->targetVersion:J

    sput-object p10, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    sput-object p9, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->accSerialNumber:Ljava/lang/String;

    iput-object p11, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->descriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    sput-object p6, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->contextKey:Ljava/lang/String;

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    sput-object p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const-string p0, "connectivity"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    sput-object p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    return-void
.end method

.method static synthetic access$000(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/Settings/LibSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    return-object p0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sendStatusToClient(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000()Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ioExceptionHandler:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    return-object v0
.end method

.method static synthetic access$1100()Lcom/motorola/otalib/aidl/IDownloadService;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/motorola/otalib/aidl/IDownloadService;)Lcom/motorola/otalib/aidl/IDownloadService;
    .locals 0

    sput-object p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->callDownloadRequest()V

    return-void
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    sput-boolean p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z

    return p0
.end method

.method static synthetic access$300(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->unBindwithDownloadService()V

    return-void
.end method

.method static synthetic access$400()Landroid/net/ConnectivityManager;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    return-object v0
.end method

.method static synthetic access$500()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$600(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$700()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)Lcom/motorola/otalib/main/LibCussm;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    return-object p0
.end method

.method static synthetic access$900(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->finishDownload()V

    return-void
.end method

.method private callDownloadRequest()V
    .locals 23

    move-object/from16 v0, p0

    const-string v1, "com.motorola.ccc.otalib.OtaDownloadRequest"

    const-string v2, "Descriptor "

    const-string v3, "LibDownloadHandler : callDownloadRequest() "

    :try_start_0
    sget-object v4, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    iget-object v4, v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    invoke-interface {v3, v1, v4}, Lcom/motorola/otalib/aidl/IDownloadService;->registerCallback(Ljava/lang/String;Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Z

    iget-object v3, v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    sget-object v3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v6}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->getProxyHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v0, v6}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->getProxyPort(Ljava/lang/String;)I

    move-result v14

    new-instance v2, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    const/4 v3, -0x1

    int-to-long v8, v3

    sget-wide v10, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->size:J

    iget-object v3, v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v4, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->internalName:Ljava/lang/String;

    move/from16 v16, v14

    sget-wide v14, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->targetVersion:J

    invoke-static {v3, v4, v14, v15}, Lcom/motorola/otalib/main/PublicUtilityMethods;->getFileName(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v12

    iget-object v3, v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->DISALLOWED_NETS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    iget-object v3, v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->BACKOFF_VALUES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    iget-object v0, v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->MAX_RETRY_COUNT_DL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v5, 0x3

    invoke-virtual {v0, v4, v5}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v17

    const-string v19, "OtaLib"

    sget-wide v21, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->startingOffset:J

    const/4 v7, 0x0

    const/16 v18, 0x1

    const/16 v20, 0x0

    move-object v5, v2

    move/from16 v14, v16

    move-object/from16 v16, v3

    invoke-direct/range {v5 .. v22}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;-><init>(Ljava/lang/String;ZJJLjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IZLjava/lang/String;ZJ)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-static {v2}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->toJSONString(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/motorola/otalib/aidl/IDownloadService;->downloadRequest(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "LibDownloadHandler : callDownloadRequest(): Exception"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private decreaseAndClearRetryCount()V
    .locals 3

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->clearRetryTask()V

    :cond_1
    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_2

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_2
    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->clearRetryTask()V

    :cond_3
    return-void
.end method

.method private finishDownload()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->unBindwithDownloadService()V

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Lcom/motorola/otalib/main/LibCussm;->onInternalNotification(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private getProxyHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1}, Lcom/motorola/otalib/main/Settings/LibConfigs;->name()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in LibDownloadHandler, getProxyHost: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object p1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    :goto_0
    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler: Sync settings proxy host:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method private getProxyPort(Ljava/lang/String;)I
    .locals 4

    const/4 v0, -0x1

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1}, Lcom/motorola/otalib/main/Settings/LibConfigs;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1, v1, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exception in LibDownloadHandler, getProxyPort: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object p1, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, p1, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    :cond_0
    :goto_0
    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler: Sync settings proxy port:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return p1
.end method

.method private sendStatusToClient(ILjava/lang/String;)V
    .locals 13

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    iget-object v2, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v3, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    sget-object v4, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v6, "DOWNLOAD_FAILED_PACKAGE_OTHER."

    move-object v5, p2

    invoke-virtual/range {v1 .. v6}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/motorola/otalib/main/InstallStatusInfo;

    iget-object v8, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v9, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v10, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v11, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->descriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-object v7, v0

    move v12, p1

    invoke-direct/range {v7 .. v12}, Lcom/motorola/otalib/main/InstallStatusInfo;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;I)V

    invoke-virtual {v0, p2}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    :try_start_0
    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    sget-object p1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->contextKey:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    invoke-interface {p0, p1, v0, p2}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method private unBindwithDownloadService()V
    .locals 3

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "LibDownloadHandler.unBindwithDownloadService, with mService:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " and mConnection: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_0

    :try_start_0
    const-string v1, "com.motorola.ccc.otalib.OtaDownloadRequest"

    invoke-interface {v0, v1}, Lcom/motorola/otalib/aidl/IDownloadService;->unregisterCallback(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "LibDownloadHandler.unBindwithDownloadService, exception "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    sput-object p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "LibDownloadHandler.close, with current dl status : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v2, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->unBindwithDownloadService()V

    return-void
.end method

.method public isBusy()Z
    .locals 2

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler : Current download status:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-boolean p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z

    return p0
.end method

.method public onDeviceShutdown()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v1, v2, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v1, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v1, v2, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_1

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_1
    return-void
.end method

.method public declared-synchronized radioGotDown()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "LibDownloadHandler.radioGotDown(). no network, return false"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget v0, Lcom/motorola/otalib/main/PublicUtilityMethods;->NO_NETWORK:I

    const-string v1, "No network"

    invoke-direct {p0, v0, v1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sendStatusToClient(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->unBindwithDownloadService()V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

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

    const-string v0, "LibDownloadHandler.failed(). retry status "

    const-string v2, "mConnection in transferupgrade: "

    const-string v3, "LibDownloadHandler.transferUpgrade: primaryKey "

    monitor-enter p0

    :try_start_0
    iget-object v4, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->descriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v4

    sput-wide v4, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->size:J

    new-instance v4, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    iget-object v5, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v6, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v7, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v8, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    sput-object v4, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ioExceptionHandler:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    new-instance v4, Ljava/io/File;

    iget-object v5, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v6, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->internalName:Ljava/lang/String;

    sget-wide v7, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->targetVersion:J

    invoke-static {v5, v6, v7, v8}, Lcom/motorola/otalib/main/PublicUtilityMethods;->getFileName(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v6, 0x190

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iget-object v10, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-string v12, "400 Bad Request"

    sget-object v13, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v8, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v15, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/16 v11, 0x190

    const/16 v16, 0x0

    move-object v9, v7

    move-object v14, v4

    move-object/from16 v17, v15

    move/from16 v15, v16

    move-object/from16 v16, v8

    invoke-direct/range {v9 .. v17}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v6, 0x191

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iget-object v10, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-string v12, "401 Unauthorized"

    sget-object v13, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v8, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v15, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/16 v11, 0x191

    const/16 v16, 0x0

    move-object v9, v7

    move-object v14, v4

    move-object/from16 v17, v15

    move/from16 v15, v16

    move-object/from16 v16, v8

    invoke-direct/range {v9 .. v17}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v6, 0x194

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iget-object v10, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-string v12, "404 Not Found"

    sget-object v13, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v8, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v15, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/16 v11, 0x194

    const/16 v16, 0x1

    move-object v9, v7

    move-object v14, v4

    move-object/from16 v17, v15

    move/from16 v15, v16

    move-object/from16 v16, v8

    invoke-direct/range {v9 .. v17}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v6, 0x193

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iget-object v10, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-string v12, "403 Forbidden"

    sget-object v13, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v15, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v14, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/16 v11, 0x193

    const/16 v16, 0x0

    move-object v9, v8

    move-object/from16 v17, v14

    move-object v14, v4

    move-object/from16 v18, v15

    move/from16 v15, v16

    move-object/from16 v16, v18

    invoke-direct/range {v9 .. v17}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x19a

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iget-object v10, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-string v12, "410 Gone"

    sget-object v13, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v15, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v14, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/16 v11, 0x19a

    const/16 v16, 0x1

    move-object v9, v8

    move-object/from16 v17, v14

    move-object v14, v4

    move-object/from16 v18, v15

    move/from16 v15, v16

    move-object/from16 v16, v18

    invoke-direct/range {v9 .. v17}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x19c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iget-object v10, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-string v12, "412 Precondition failed"

    sget-object v13, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v15, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v14, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/16 v11, 0x19c

    const/16 v16, 0x1

    move-object v9, v8

    move-object/from16 v17, v14

    move-object v14, v4

    move-object/from16 v18, v15

    move/from16 v15, v16

    move-object/from16 v16, v18

    invoke-direct/range {v9 .. v17}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x1ad

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iget-object v10, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-string v12, "429 Too many requests"

    sget-object v13, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    iget-object v15, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v14, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/16 v11, 0x1ad

    const/16 v16, 0x1

    move-object v9, v8

    move-object/from16 v17, v14

    move-object v14, v4

    move-object v4, v15

    move/from16 v15, v16

    move-object/from16 v16, v4

    invoke-direct/range {v9 .. v17}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " a file of size "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v7, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->size:J

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v2, "LibDownloadHandler.failed(). no network, return"

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget v0, Lcom/motorola/otalib/main/PublicUtilityMethods;->NO_NETWORK:I

    const-string v2, "No network"

    invoke-direct {v1, v0, v2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sendStatusToClient(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v3, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {v3}, Lcom/motorola/otalib/main/PublicUtilityMethods;->checkForUrlExpiry(Lcom/motorola/otalib/main/Settings/LibSettings;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v3, "In LibDownloadHandler.transferupgrade,oops url expired fetching new url"

    invoke-static {v2, v3}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v2, "LibDownloadHandler.failed(). retry pending, return"

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget v0, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_RETRY:I

    const-string v2, "Error retrying"

    invoke-direct {v1, v0, v2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sendStatusToClient(ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    const-string v3, "URL timeout during package file download "

    const-string v5, "DOWNLOAD_FAILED_PACKAGE_4XX."

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->shouldRetry(Ljava/lang/String;ZLjava/lang/String;)Z

    move-result v2

    sget-object v3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_3

    sget v0, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_RETRY:I

    const-string v2, "Error retrying"

    invoke-direct {v1, v0, v2}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sendStatusToClient(ILjava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v7, "Aborting the OTA process as there is no error handler installed 403"

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    invoke-static {v0, v7}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->sm:Lcom/motorola/otalib/main/LibCussm;

    iget-object v4, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v5, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->primaryKey:Ljava/lang/String;

    sget-object v6, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v8, "DOWNLOAD_FAILED_PACKAGE_OTHER."

    invoke-virtual/range {v3 .. v8}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    :goto_0
    monitor-exit p0

    return-void

    :cond_4
    :try_start_3
    sget-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    if-nez v0, :cond_5

    new-instance v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$2;

    invoke-direct {v0, v1}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler$2;-><init>(Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;)V

    sput-object v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, v1, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->ctx:Landroid/content/Context;

    const-class v5, Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-direct {v2, v3, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v3, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_1

    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->callDownloadRequest()V

    :goto_1
    sput-boolean v4, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;->progress:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
