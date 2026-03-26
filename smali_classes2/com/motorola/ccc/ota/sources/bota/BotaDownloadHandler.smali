.class public Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;
.super Ljava/lang/Object;
.source "BotaDownloadHandler.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/DownloadHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$defaultAction;
    }
.end annotation


# static fields
.field private static final HTTP_TOO_MANY_REQUESTS:I = 0x1ad

.field private static final OTA_DOWNLOAD_ID:Ljava/lang/String; = "com.motorola.ccc.ota.sources.bota.OtaDownloadRequest"

.field private static cm:Landroid/net/ConnectivityManager;

.field private static errorCodeHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private static fileName:Ljava/lang/String;

.field private static ioExceptionHandler:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

.field private static mConnection:Landroid/content/ServiceConnection;

.field private static mService:Lcom/motorola/otalib/aidl/IDownloadService;

.field private static mTimer:Ljava/util/Timer;

.field private static repo:Ljava/lang/String;

.field private static size:J

.field private static time:J

.field private static version:Ljava/lang/String;

.field private static wifiOnly:Z


# instance fields
.field private _dlHelper:Lcom/motorola/ccc/ota/DownloadHelper;

.field private final ctx:Landroid/content/Context;

.field private final env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

.field private isModemUpdate:Z

.field private mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

.field private progress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final sm:Lcom/motorola/ccc/ota/CusSM;


# direct methods
.method static bridge synthetic -$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->_dlHelper:Lcom/motorola/ccc/ota/DownloadHelper;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcallDownloadRequest(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->callDownloadRequest()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstopTimer(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->stopTimer()V

    return-void
.end method

.method static bridge synthetic -$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->unBindwithDownloadService()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mverifyFile(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->verifyFile(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$sfgetcm()Landroid/net/ConnectivityManager;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgeterrorCodeHandlers()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetfileName()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetioExceptionHandler()Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ioExceptionHandler:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetmService()Lcom/motorola/otalib/aidl/IDownloadService;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetrepo()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->repo:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsize()J
    .locals 2

    sget-wide v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->size:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgetversion()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetwifiOnly()Z
    .locals 1

    sget-boolean v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    return v0
.end method

.method static bridge synthetic -$$Nest$sfputmService(Lcom/motorola/otalib/aidl/IDownloadService;)V
    .locals 0

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;-><init>(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iput-object p4, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-boolean p5, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->isModemUpdate:Z

    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const-string p0, "connectivity"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    return-void
.end method

.method private callDownloadRequest()V
    .locals 24

    move-object/from16 v0, p0

    const-string v1, "com.motorola.ccc.ota.sources.bota.OtaDownloadRequest"

    const-string v2, "OtaApp"

    const-string v3, "callDownloadRequest() "

    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mCallback:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    invoke-interface {v3, v1, v4}, Lcom/motorola/otalib/aidl/IDownloadService;->registerCallback(Ljava/lang/String;Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Z

    iget-boolean v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->isModemUpdate:Z

    if-eqz v3, :cond_0

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_DOWNLOAD_DESCRIPTOR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    :goto_0
    move-object v5, v3

    invoke-direct {v0, v5}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->getProxyHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v0, v5}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->getProxyPort(Ljava/lang/String;)I

    move-result v13

    new-instance v3, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    sget-boolean v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    sget-wide v7, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->time:J

    sget-wide v9, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->size:J

    sget-object v11, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->fileName:Ljava/lang/String;

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DISALLOWED_NETS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v14

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BACKOFF_VALUES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v15}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v22, v2

    :try_start_1
    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_RETRY_COUNT_DL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    move-object/from16 v23, v1

    const/16 v1, 0x9

    invoke-virtual {v4, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v16

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAdvancedDownloadFeature()Z

    move-result v17

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v18

    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ALLOW_ON_ROAMING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v19

    const-wide/16 v20, 0x0

    move-object v4, v3

    invoke-direct/range {v4 .. v21}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;-><init>(Ljava/lang/String;ZJJLjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IZLjava/lang/String;ZJ)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-static {v3}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->toJSONString(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, v23

    invoke-interface {v0, v2, v1}, Lcom/motorola/otalib/aidl/IDownloadService;->downloadRequest(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    move-object/from16 v22, v2

    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "callDownloadRequest(): Exception"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v1, v22

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method private decreaseRetryCount()V
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    if-lez v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->decrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_1
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

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "exception while getting host name from descriptor "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "HttpProxyFromDownloadDescriptor: Sync settings proxy host:"

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

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "exception while getting port from descriptor"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    :cond_0
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "HttpProxyFromDownloadDescriptor: Sync settings proxy port:"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return p1
.end method

.method private startTimer()I
    .locals 6

    const-string v0, "BotaDownloadHandler.startTimer, IllegalStateException, Maybe canceled. Ignore it"

    const-string v1, "BotaDownloadHandler.startTimer, IllegalArgumentException, ignore it."

    monitor-enter p0

    :try_start_0
    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mTimer:Ljava/util/Timer;

    if-nez v2, :cond_0

    new-instance v2, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$defaultAction;

    invoke-direct {v2, p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$defaultAction;-><init>(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    new-instance v3, Ljava/util/Timer;

    invoke-direct {v3}, Ljava/util/Timer;-><init>()V

    sput-object v3, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mTimer:Ljava/util/Timer;

    const-wide/16 v4, 0xbb8

    invoke-virtual {v3, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    :cond_0
    const-string v2, "OtaApp"

    const-string v3, "BotaDownloadHandler.defaultAction have been scheduled, do nothing"

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit p0

    const/4 p0, 0x0

    return p0

    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private stopTimer()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "BotaDownloadHandler.stopTimer, cancel()"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mTimer:Ljava/util/Timer;

    goto :goto_0

    :cond_0
    const-string v0, "OtaApp"

    const-string v1, "BotaDownloadHandler.stopTimer, have stopped, do nothing"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private unBindwithDownloadService()V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BotaDownloadHandler.unBindwithDownloadService, with mService:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and mConnection: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    if-eqz v0, :cond_0

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v2, :cond_0

    :try_start_0
    const-string v2, "com.motorola.ccc.ota.sources.bota.OtaDownloadRequest"

    invoke-interface {v0, v2}, Lcom/motorola/otalib/aidl/IDownloadService;->unregisterCallback(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "BotaDownloadHandler.unBindwithDownloadService, exception "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    sput-object p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    :cond_0
    return-void
.end method

.method private verifyFile(Ljava/lang/String;)Z
    .locals 3

    const-string v0, "OtaApp"

    :try_start_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->verifyPackage(Ljava/io/File;)V

    const-string p1, "BotaDownloadHandler.verifyFile, verification of update package successful"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATUS_VERIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getStatusVerifyResult(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "BotaDownloadHandler.verifyFile failed: "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getStatusVerifyResult(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public close()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BotaDownloadHandler.close, with current dl status : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->unBindwithDownloadService()V

    return-void
.end method

.method public isBusy()Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Current download status:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    return p0
.end method

.method public onDeviceShutdown()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->decreaseRetryCount()V

    return-void
.end method

.method public declared-synchronized radioGotDown()V
    .locals 10

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->unBindwithDownloadService()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->startTimer()I

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->isModemUpdate:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/CusSM;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-gez v1, :cond_2

    const-string v1, "OtaApp"

    const-string v2, "In BotaDownloadHandler.radioGotDown, sending suspended intent to UI"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    new-instance v1, Ljava/io/File;

    iget-object v4, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v6

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v9

    invoke-interface/range {v2 .. v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setProgressAndActualDownloadTime(Z)V
    .locals 7

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_LAST_DOWNLOAD_START_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_LAST_DOWNLOAD_START_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, 0x0

    invoke-virtual {p1, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    sub-long/2addr v0, v5

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ACTUAL_DOWNLOAD_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    add-long/2addr v2, v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DL_ACTUAL_DOWNLOAD_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 19

    move-object/from16 v1, p0

    const-string v0, "mConnection in transferupgrade: "

    const-string v2, "OTAUpgradeSource.transferUpgrade: Version "

    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->stopTimer()V

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v3

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->repo:Ljava/lang/String;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getTime()I

    move-result v4

    int-to-long v4, v4

    sput-wide v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->time:J

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v4

    sput-wide v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->size:J

    iget-boolean v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->isModemUpdate:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    sput-boolean v5, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getModemDownloadFilePath()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->fileName:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v4

    sput-boolean v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->fileName:Ljava/lang/String;

    :goto_0
    new-instance v4, Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->fileName:Ljava/lang/String;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    invoke-virtual {v8}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v8

    invoke-direct {v4, v6, v7, v8, v9}, Lcom/motorola/ccc/ota/DownloadHelper;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    iput-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->_dlHelper:Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    new-instance v4, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    iget-object v6, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-direct {v4, v6, v7, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    sput-object v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ioExceptionHandler:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    new-instance v4, Ljava/io/File;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->fileName:Ljava/lang/String;

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x190

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v13, "400 Bad Request"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x190

    const/16 v16, 0x0

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v4

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x191

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v13, "401 Unauthorized"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x191

    const/16 v16, 0x0

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v4

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x194

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v13, "404 Not Found"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x194

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v4

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x193

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v13, "403 Forbidden"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x193

    const/16 v16, 0x0

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v4

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x19a

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v13, "410 Gone"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x19a

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v4

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x19c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v13, "412 Precondition failed"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x19c

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v4

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->errorCodeHandlers:Ljava/util/Map;

    const/16 v7, 0x1ad

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v13, "429 Too many requests"

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v15, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    const/16 v12, 0x1ad

    const/16 v16, 0x1

    move-object v10, v8

    move-object/from16 v18, v15

    move-object v15, v4

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v18}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "OtaApp"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, " a file of size "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v3}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    iget-boolean v3, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->isModemUpdate:Z

    if-nez v3, :cond_1

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v0, "OtaApp"

    const-string v2, "In BotaDownloadHandler.transferupgrade,Low Battery : sending suspended intent to UI"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/io/File;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v6

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    sget-boolean v9, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    invoke-interface/range {v2 .. v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    sget-boolean v3, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    if-eqz v3, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->startFotaWifiDiscoveryTimer()V

    :cond_2
    invoke-static {v2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v3

    invoke-interface {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cleanBotaWifiDiscoveryTimer()V

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->startBotaWifiDiscoveryTimer()V

    :cond_4
    const-string v0, "OtaApp"

    const-string v2, "In BotaDownloadHandler.transferupgrade,sending suspended intent to UI"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/io/File;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v6

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    sget-boolean v9, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    invoke-interface/range {v2 .. v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_5
    :goto_1
    :try_start_2
    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->isDeviceInDatasaverMode()Z

    move-result v3

    if-eqz v3, :cond_6

    const-string v0, "OtaApp"

    const-string v2, "In BotaDownloadHandler.transferupgrade,Datasaver is ON : sending suspended intent to UI"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/io/File;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v6

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    sget-boolean v9, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    invoke-interface/range {v2 .. v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_6
    :try_start_3
    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getAdminApnUrl(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpl-double v6, v6, v8

    if-gez v6, :cond_7

    iget-object v6, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v6

    if-eqz v6, :cond_8

    :cond_7
    if-nez v3, :cond_8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v3

    if-nez v3, :cond_8

    invoke-static {v2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v0, "OtaApp"

    const-string v2, "In BotaDownloadHandler.transferupgrade,forced update, but not on wifi : sending suspended intent to UI"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/io/File;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v6

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    sget-boolean v9, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->wifiOnly:Z

    invoke-interface/range {v2 .. v9}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :cond_8
    :try_start_4
    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-boolean v3, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->isModemUpdate:Z

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->checkForUrlExpiry(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)Z

    move-result v2

    if-eqz v2, :cond_c

    const-string v0, "OtaApp"

    const-string v2, "In BotaDownloadHandler.transferupgrade,oops url expired fetching new url"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->isModemUpdate:Z

    if-eqz v0, :cond_9

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, "URL timeout"

    invoke-virtual {v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_2

    :cond_9
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, "URL timeout"

    invoke-virtual {v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :goto_2
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    const-string v3, "encountered url timeout go and fetch new download url"

    invoke-static {v0, v2, v3, v5}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendGetDescriptor(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->version:Ljava/lang/String;

    new-instance v0, Ljava/io/File;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->fileName:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    sget-wide v6, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->size:J

    invoke-interface/range {v2 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V

    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->decreaseRetryCount()V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->clearRetryTask()V

    :cond_a
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->clearRetryTask()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_b
    monitor-exit p0

    return-void

    :cond_c
    :try_start_5
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setSoftBankProxyData(Landroid/content/Context;)V

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mService:Lcom/motorola/otalib/aidl/IDownloadService;

    if-nez v2, :cond_d

    new-instance v2, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$2;

    invoke-direct {v2, v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$2;-><init>(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    sput-object v2, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->ctx:Landroid/content/Context;

    const-class v5, Lcom/motorola/otalib/downloadservice/DownloadService;

    invoke-direct {v2, v3, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_3

    :cond_d
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->callDownloadRequest()V

    :goto_3
    invoke-virtual {v1, v4}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->_dlHelper:Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->version()Ljava/lang/String;

    move-result-object v3

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->_dlHelper:Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v4

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->_dlHelper:Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->expected()J

    move-result-wide v6

    invoke-interface/range {p1 .. p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    invoke-interface/range {v2 .. v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusProgress(Ljava/lang/String;JJLjava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
