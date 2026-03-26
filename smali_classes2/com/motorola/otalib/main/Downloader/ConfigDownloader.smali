.class public Lcom/motorola/otalib/main/Downloader/ConfigDownloader;
.super Ljava/lang/Object;
.source "ConfigDownloader.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/DownloadHandler;


# static fields
.field private static final OTA_DOWNLOAD_ID:Ljava/lang/String; = "com.motorola.ccc.otalib.OtaDownloadRequest"

.field private static mConnection:Landroid/content/ServiceConnection; = null

.field private static mFilePath:Ljava/lang/String; = null

.field private static mFileUrl:Ljava/lang/String; = null

.field private static mService:Lcom/motorola/otalib/aidl/IDownloadService; = null

.field private static progress:Z = false

.field private static size:J

.field private static startingOffset:J


# instance fields
.field private final ctx:Landroid/content/Context;

.field private mCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

.field private mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

.field private final settings:Lcom/motorola/otalib/main/Settings/LibSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;

    invoke-direct {v0, p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;-><init>(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    iput-object v0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iput-object p3, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    sput-object p4, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFileUrl:Ljava/lang/String;

    invoke-static {p1, p4}, Lcom/motorola/otalib/main/PublicUtilityMethods;->getConfigFilePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFilePath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFilePath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100()J
    .locals 2

    sget-wide v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->size:J

    return-wide v0
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    sput-boolean p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z

    return p0
.end method

.method static synthetic access$300(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->unBindwithDownloadService()V

    return-void
.end method

.method static synthetic access$400(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->sendStatusToClient(Z)V

    return-void
.end method

.method static synthetic access$500()Lcom/motorola/otalib/aidl/IDownloadService;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-object v0
.end method

.method static synthetic access$502(Lcom/motorola/otalib/aidl/IDownloadService;)Lcom/motorola/otalib/aidl/IDownloadService;
    .locals 0

    sput-object p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-object p0
.end method

.method static synthetic access$600(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->callDownloadRequest()V

    return-void
.end method

.method private callDownloadRequest()V
    .locals 24

    move-object/from16 v0, p0

    const-string v1, ""

    const-string v2, "com.motorola.ccc.otalib.OtaDownloadRequest"

    const-string v3, "Descriptor "

    const-string v4, "LibDownloadHandler : callDownloadRequest() "

    :try_start_0
    sget-object v5, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v4, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    iget-object v5, v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    invoke-interface {v4, v2, v5}, Lcom/motorola/otalib/aidl/IDownloadService;->registerCallback(Ljava/lang/String;Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Z

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "proceed"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v5, "wifiUrl"

    sget-object v6, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFileUrl:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "cellUrl"

    sget-object v6, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFileUrl:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "adminApnUrl"

    invoke-virtual {v4, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "trackingId"

    invoke-virtual {v4, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v1, v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v1, v4, v7}, Lcom/motorola/otalib/main/Settings/LibSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v7}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->getProxyHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v0, v7}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->getProxyPort(Ljava/lang/String;)I

    move-result v15

    new-instance v1, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    const/4 v3, -0x1

    int-to-long v9, v3

    sget-wide v11, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->size:J

    sget-object v13, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFilePath:Ljava/lang/String;

    iget-object v3, v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->DISALLOWED_NETS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v16

    iget-object v3, v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->BACKOFF_VALUES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v17

    iget-object v0, v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v3, Lcom/motorola/otalib/main/Settings/LibConfigs;->MAX_RETRY_COUNT_DL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v4, 0x3

    invoke-virtual {v0, v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v18

    const-string v20, "OtaLib"

    sget-wide v22, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->startingOffset:J

    const/4 v8, 0x0

    const/16 v19, 0x1

    const/16 v21, 0x0

    move-object v6, v1

    invoke-direct/range {v6 .. v23}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;-><init>(Ljava/lang/String;ZJJLjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IZLjava/lang/String;ZJ)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-static {v1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->toJSONString(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lcom/motorola/otalib/aidl/IDownloadService;->downloadRequest(Ljava/lang/String;Ljava/lang/String;)Z
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

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

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

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

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

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

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

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

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

.method private sendStatusToClient(Z)V
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFilePath:Ljava/lang/String;

    invoke-interface {p0, p1, v0}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onConfigUpdateStatus(ZLjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

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

    sget-object v2, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " and mConnection: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_0

    :try_start_0
    const-string v1, "com.motorola.ccc.otalib.OtaDownloadRequest"

    invoke-interface {v0, v1}, Lcom/motorola/otalib/aidl/IDownloadService;->unregisterCallback(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->ctx:Landroid/content/Context;

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

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

    sput-object p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    sput-object p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

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

    sget-boolean v2, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z

    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->unBindwithDownloadService()V

    return-void
.end method

.method public isBusy()Z
    .locals 2

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler : Current download status:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-boolean p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z

    return p0
.end method

.method public onDeviceShutdown()V
    .locals 0

    const/4 p0, 0x0

    sput-boolean p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z

    return-void
.end method

.method public declared-synchronized radioGotDown()V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->unBindwithDownloadService()V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z
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
    .locals 4

    const-string p1, "mConnection in transferupgrade: "

    const-string v0, "LibDownloadHandler.transferUpgrade: filefi "

    monitor-enter p0

    const-wide/16 v1, -0x1

    :try_start_0
    sput-wide v1, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->size:J

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mFilePath:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " a file of size "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-wide v2, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->size:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$2;

    invoke-direct {v0, p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$2;-><init>(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    sput-object v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->ctx:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->ctx:Landroid/content/Context;

    const-class v3, Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v2, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p1, v0, v2, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->callDownloadRequest()V

    :goto_0
    sput-boolean v1, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->progress:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
