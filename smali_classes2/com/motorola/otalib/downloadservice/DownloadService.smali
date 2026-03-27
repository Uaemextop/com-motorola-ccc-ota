.class public Lcom/motorola/otalib/downloadservice/DownloadService;
.super Landroid/app/Service;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;,
        Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;,
        Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;,
        Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;
    }
.end annotation


# static fields
.field public static final ACTIVITY_RESULT_GET_AUTH_TOKEN_CODE:I = 0x2

.field public static final MAX_RETRY_COUNT:I = 0x2

.field private static final NO_NETWORK:Ljava/lang/String; = "no_network"

.field private static clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

.field private static context:Landroid/content/Context;

.field private static downloader:Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

.field private static mShutdownReceiver:Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

.field private static retryCount:I

.field private static wl:Landroid/os/PowerManager$WakeLock;


# instance fields
.field private _mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

.field private downloadId:Ljava/lang/String;

.field private final mBinder:Lcom/motorola/otalib/aidl/IDownloadService$Stub;

.field private mCm:Landroid/net/ConnectivityManager;

.field private mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

.field private mGoogleAccounts:[Landroid/accounts/Account;

.field private mTm:Landroid/telephony/TelephonyManager;

.field private od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

.field private randomNumber:Ljava/util/Random;

.field private requestResponseMapping:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private serviceHandler:Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

.field private serviceLooper:Landroid/os/Looper;

.field private zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->_mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    new-instance v0, Lcom/motorola/otalib/downloadservice/DownloadService$3;

    invoke-direct {v0, p0}, Lcom/motorola/otalib/downloadservice/DownloadService$3;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService;)V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mBinder:Lcom/motorola/otalib/aidl/IDownloadService$Stub;

    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    sget v0, Lcom/motorola/otalib/downloadservice/DownloadService;->retryCount:I

    return v0
.end method

.method static synthetic access$002(I)I
    .locals 0

    sput p0, Lcom/motorola/otalib/downloadservice/DownloadService;->retryCount:I

    return p0
.end method

.method static synthetic access$004()I
    .locals 1

    sget v0, Lcom/motorola/otalib/downloadservice/DownloadService;->retryCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/motorola/otalib/downloadservice/DownloadService;->retryCount:I

    return v0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->handleDownloadServiceRequest(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V

    return-void
.end method

.method static synthetic access$102(Lcom/motorola/otalib/downloadservice/DownloadService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/motorola/otalib/downloadservice/DownloadService;)Ljava/util/Random;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->randomNumber:Ljava/util/Random;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/motorola/otalib/downloadservice/DownloadService;)Landroid/util/SparseArray;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->requestResponseMapping:Landroid/util/SparseArray;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    return-object p0
.end method

.method static synthetic access$200()Lcom/motorola/otalib/aidl/IDownloadServiceCallback;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    return-object v0
.end method

.method static synthetic access$202(Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Lcom/motorola/otalib/aidl/IDownloadServiceCallback;
    .locals 0

    sput-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    return-object p0
.end method

.method static synthetic access$300(Lcom/motorola/otalib/downloadservice/DownloadService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->getDownloadUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    return-object p0
.end method

.method static synthetic access$500(Lcom/motorola/otalib/downloadservice/DownloadService;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->unregisterZeroRatedActionsReceiver()V

    return-void
.end method

.method static synthetic access$600(Lcom/motorola/otalib/downloadservice/DownloadService;)Landroid/net/ConnectivityManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static synthetic access$700(Lcom/motorola/otalib/downloadservice/DownloadService;)Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceHandler:Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

    return-object p0
.end method

.method static synthetic access$800()Landroid/os/PowerManager$WakeLock;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->wl:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$900()Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloader:Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    return-object v0
.end method

.method private addAuthorizationHeader(Ljava/lang/String;)Z
    .locals 3

    const/4 p0, 0x0

    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "storage.googleapis.com"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "addAuthorizationHeader,Caught exception"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return p0
.end method

.method private addProcessor(Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
    .locals 1

    new-instance v0, Lcom/motorola/otalib/downloadservice/DownloadService$1;

    invoke-direct {v0, p0, p2}, Lcom/motorola/otalib/downloadservice/DownloadService$1;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V

    invoke-interface {p1, v0}, Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;->addProcessor(Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;)V

    return-void
.end method

.method public static getDSContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    return-object v0
.end method

.method private getDownloadHeaders(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p0, "wifiHeaders"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    :goto_0
    move-object v0, p0

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWan(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p0, "cellHeaders"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isAdminApn(Landroid/net/ConnectivityManager;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "adminApnHeaders"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DownloadService:getDownloadHeaders, Exception occured "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_1
    return-object v0
.end method

.method private getDownloadUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "wifiUrl"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "cellUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "adminApnUrl"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadService:getDownloadUrl, no url to proceed"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    iget-object v3, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v0, p1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWan(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-eqz p1, :cond_2

    move-object v0, v2

    goto :goto_0

    :cond_2
    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isAdminApn(Landroid/net/ConnectivityManager;)Z

    move-result p0

    if-eqz p0, :cond_3

    move-object v0, v1

    goto :goto_0

    :cond_3
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadService:getDownloadUrl, Not connected"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "no_network"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DownloadService:getDownloadUrl, Exception occured "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-object v0
.end method

.method private getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    # Modified: Use TrustAllCerts to accept all SSL certificates
    invoke-static {}, Lcom/motorola/otalib/ssl/TrustAllCerts;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    return-object v0
.end method

.method private getTrustManagerFactory()Ljavax/net/ssl/TrustManagerFactory;
    .locals 4

    const-string v0, "Error creating connection:"

    const/4 v1, 0x0

    :try_start_0
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v1

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->keyStore()Ljava/security/KeyStore;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception p0

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-object v1
.end method

.method private handleDownloadServiceRequest(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
    .locals 14

    const-string v0, "PARSE_ERROR."

    const-string v1, "headers: "

    const-string v2, "Caught exception while building client object "

    const-string v3, "handleDownloadServiceRequest:downloadUrl "

    const-string v4, "handleDownloadServiceRequest: downloadingChoice "

    const-string v5, "proxy host:"

    :try_start_0
    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getAdminApnUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    const-string v8, "android.permission.READ_PHONE_STATE"

    invoke-static {v7, v8}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->checkIfAlreadyhavePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v7

    const/4 v13, 0x1

    if-nez v7, :cond_0

    sget-object v7, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    const-string v8, "android.permission.READ_PRIVILEGED_PHONE_STATE"

    invoke-static {v7, v8}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->checkIfAlreadyhavePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    :cond_0
    iget-object v7, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    sget-object v8, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getWifiOnly()Z

    move-result v9

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getDisallowedNetworks()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v12

    move-object v10, v6

    invoke-virtual/range {v7 .. v12}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->canIUseZeroRatedNetwork(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    iget-object v7, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    invoke-virtual {v7}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->unregisterZeroRatedActionsReceiver()V

    :cond_1
    iget-object v7, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    sget-object v8, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getWifiOnly()Z

    move-result v10

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getDisallowedNetworks()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getAllowOnRoaming()Z

    move-result v12

    move-object v9, v6

    invoke-virtual/range {v7 .. v12}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->canIDownload(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Z)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    move-result-object v6

    sget-object v7, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v4, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WIFI_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    if-eq v6, v4, :cond_3

    sget-object v4, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    if-eq v6, v4, :cond_3

    sget-object p1, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    invoke-interface {p1, v1, v13}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->suspended(Ljava/lang/String;Z)V

    return-void

    :cond_2
    iget-object v4, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    invoke-virtual {v4}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->canIDownloadUsingZeroRatedChannel()Z

    move-result v4

    if-eqz v4, :cond_a

    sget-object v4, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v6, "handleDownloadServiceRequest: can be downloaded now; reason zero rated NW is available"

    invoke-static {v4, v6}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getHostName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getHostName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getPort()I

    move-result v4

    const/4 v6, -0x1

    if-le v4, v6, :cond_4

    sget-object v4, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getHostName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", port:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getPort()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Lorg/apache/http/HttpHost;

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getHostName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getPort()I

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    :cond_4
    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getBackOffValues()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    new-instance v5, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;

    invoke-direct {v5, v4}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const/4 v5, 0x0

    :goto_0
    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/motorola/otalib/downloadservice/DownloadService;->getDownloadUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_6

    sget-object p1, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    const-string v3, "Aborting the OTA process as downloarUrl is null"

    const-string v4, "DOWNLOAD_URL_NULL."

    invoke-interface {p1, v1, v3, v4}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_6
    const-string v6, "no_network"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    sget-object p1, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    invoke-interface {p1, v1, v13}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->suspended(Ljava/lang/String;Z)V

    return-void

    :cond_7
    sget-object v6, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, " size "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getSize()J

    move-result-wide v7

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    new-instance v9, Ljava/net/URL;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v9, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v6, Lcom/motorola/otalib/downloadservice/download/HttpUrlBuilder;

    invoke-direct {v6}, Lcom/motorola/otalib/downloadservice/download/HttpUrlBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getHostName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getPort()I

    move-result v8

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v12

    const v11, 0x493e0

    move v10, v11

    invoke-virtual/range {v6 .. v12}, Lcom/motorola/otalib/downloadservice/download/HttpUrlBuilder;->openConnection(Ljava/lang/String;ILjava/net/URL;IILjavax/net/ssl/SSLSocketFactory;)Ljava/net/HttpURLConnection;

    move-result-object v3

    new-instance v6, Lcom/motorola/otalib/downloadservice/download/PackageDownloader;

    invoke-direct {v6}, Lcom/motorola/otalib/downloadservice/download/PackageDownloader;-><init>()V

    invoke-virtual {v6, v5, v3}, Lcom/motorola/otalib/downloadservice/download/PackageDownloader;->getFileDownloader(Lcom/motorola/otalib/common/backoff/BackoffValueProvider;Ljava/net/HttpURLConnection;)Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    move-result-object v3

    sput-object v3, Lcom/motorola/otalib/downloadservice/DownloadService;->downloader:Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    invoke-direct {p0, v3, p1}, Lcom/motorola/otalib/downloadservice/DownloadService;->addProcessor(Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    iget-object v3, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-nez v3, :cond_8

    sget-object p1, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    invoke-interface {p1, v1, v13}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->suspended(Ljava/lang/String;Z)V

    return-void

    :cond_8
    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/motorola/otalib/downloadservice/DownloadService;->getDownloadHeaders(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    if-eqz v3, :cond_9

    :try_start_3
    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v5

    if-lez v5, :cond_9

    sget-object v5, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " headers.length: "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v1

    const/4 v5, 0x0

    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_9

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Adding header "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v8, Lcom/motorola/otalib/downloadservice/DownloadService;->downloader:Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;

    invoke-interface {v8, v6, v7}, Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_4
    sget-object v3, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Caught exception while parsing headers"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    const-string v3, "power"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    const-string v3, "Ota:HttpFileDownloader"

    invoke-virtual {v1, v13, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    sput-object v1, Lcom/motorola/otalib/downloadservice/DownloadService;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->registerShutdownActions()V

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/Thread;

    new-instance v5, Lcom/motorola/otalib/downloadservice/DownloadService$2;

    invoke-direct {v5, p0, p1, v4, v1}, Lcom/motorola/otalib/downloadservice/DownloadService$2;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;Ljava/lang/String;Ljava/io/File;)V

    invoke-direct {v3, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string p1, "DownloadFileThread"

    invoke-virtual {v3, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_2

    :catch_1
    move-exception p1

    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iget-object v3, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, v3, p1, v0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_a
    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "handleDownloadServiceRequest: cannot be downloaded now; reason zero rated NW is not available"

    invoke-static {p1, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->registerForZeroRatedActions()V

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->startZeroRatedProcess()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    return-void

    :catch_2
    move-exception p1

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Caught exception while handling download request "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_5
    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->downloadId:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p0, p1, v0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback;->initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    :catch_3
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Caught exception while callback"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method private keyStore()Ljava/security/KeyStore;
    .locals 5

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "loading default keystore. keystorename=AndroidCAStore"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    :try_start_0
    const-string v0, "AndroidCAStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_4

    :try_start_1
    invoke-virtual {v0, p0, p0}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_4

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_1

    :catch_2
    move-exception p0

    goto :goto_2

    :catch_3
    move-exception p0

    goto :goto_3

    :catch_4
    move-exception v0

    move-object v4, v0

    move-object v0, p0

    move-object p0, v4

    :goto_0
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "KeyStoreException creating SSL socket factory. keyStoreName=AndroidCAStore"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :catch_5
    move-exception v0

    move-object v4, v0

    move-object v0, p0

    move-object p0, v4

    :goto_1
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "IOException creating SSL socket factory. keyStoreName=AndroidCAStore"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :catch_6
    move-exception v0

    move-object v4, v0

    move-object v0, p0

    move-object p0, v4

    :goto_2
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "NoSuchAlgorithmException creating SSL socket factory. keyStoreName=AndroidCAStore"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :catch_7
    move-exception v0

    move-object v4, v0

    move-object v0, p0

    move-object p0, v4

    :goto_3
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CertificateException creating SSL socket factory. keyStoreName=AndroidCAStore"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    return-object v0
.end method

.method private registerShutdownActions()V
    .locals 3

    sget-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mShutdownReceiver:Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

    if-nez p0, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "DownloadService.registerShutdownActions,registering for shut down actions"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService$1;)V

    sput-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mShutdownReceiver:Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

    new-instance p0, Landroid/content/IntentFilter;

    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.intent.action.REBOOT"

    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService;->mShutdownReceiver:Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, p0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "DownloadService.registerShutdownActions,already registered for shut down actions"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private unregisterShutdownActions()V
    .locals 1

    sget-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mShutdownReceiver:Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

    if-eqz p0, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "DownloadService.unregisterShutdownActions,unregistering from listening to shut down actions"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->mShutdownReceiver:Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mShutdownReceiver:Lcom/motorola/otalib/downloadservice/DownloadService$ShutDownActionsBroadcastReceiver;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "DownloadService.unregisterShutdownActions,not registered to shut down actions"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private unregisterZeroRatedActionsReceiver()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->_mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "DownloadService, unregistering from listening to zerorated actions"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->_mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->_mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "DownloadService, not registered for any zero rated actions"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_0
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Bound to download service "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mBinder:Lcom/motorola/otalib/aidl/IDownloadService$Stub;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mBinder:Lcom/motorola/otalib/aidl/IDownloadService$Stub;

    return-object p0
.end method

.method public onCreate()V
    .locals 4

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "Creating download service"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->randomNumber:Ljava/util/Random;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->requestResponseMapping:Landroid/util/SparseArray;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "DownloadService.ServiceHandlerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceLooper:Landroid/os/Looper;

    new-instance v0, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceLooper:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceHandler:Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mTm:Landroid/telephony/TelephonyManager;

    const-string v0, "dl_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/otalib/downloadservice/DownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    invoke-direct {v1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;-><init>(Landroid/content/SharedPreferences;)V

    iput-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->getZeroRatedServices(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mCm:Landroid/net/ConnectivityManager;

    iget-object v2, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mTm:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-direct {v0, v1, v2, v3}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;-><init>(Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;)V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    return-void
.end method

.method public onDestroy()V
    .locals 3

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "DownloadService.onDestroy(), Stopping download service"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    sput v0, Lcom/motorola/otalib/downloadservice/DownloadService;->retryCount:I

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    const-string v1, "doNotBindOtaProcess"

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->clearConfigValue(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->unregisterShutdownActions()V

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "DownloadService.onDestroy(), Stopping admin apn"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    const-string v1, "downloadRequest"

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfigValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequestBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->getContentResource()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->getAdminApnUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->unregisterZeroRatedActionsReceiver()V

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/DownloadService;->stopDownloadService()V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceLooper:Landroid/os/Looper;

    invoke-virtual {p0}, Landroid/os/Looper;->quitSafely()V

    :try_start_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->wl:Landroid/os/PowerManager$WakeLock;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "Releasing wake lock"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->release()V

    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->wl:Landroid/os/PowerManager$WakeLock;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DownloadService.onDestroy(),Exception Releasing wake lock"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "Starting download service"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x2

    return p0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "Unbound from download service"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/otalib/downloadservice/DownloadService;->clientCallBack:Lcom/motorola/otalib/aidl/IDownloadServiceCallback;

    const/4 p0, 0x1

    return p0
.end method

.method declared-synchronized postDownloadRequest(Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "appending download service request to serviceHandler"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceHandler:Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->DOWNLOAD_SERVICE_REQUEST:Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->ordinal()I

    move-result v1

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceHandler:Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public registerForZeroRatedActions()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->_mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    if-nez v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "DownloadService, registering for zero rated actions"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;-><init>(Lcom/motorola/otalib/downloadservice/DownloadService;Lcom/motorola/otalib/downloadservice/DownloadService$1;)V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->_mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_ACTIVE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_INACTIVE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CLEANUP"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->_mZeroRatedActionsListener:Lcom/motorola/otalib/downloadservice/DownloadService$ZeroRatedActionsBroadcastReceiver;

    invoke-static {v1, p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "DownloadService, already registered for zero rated actions"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method stopDownloadService()V
    .locals 2

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "stopDownloadService()"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/DownloadService;->serviceHandler:Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;

    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->STOP_DOWNLOAD_SERVICE:Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/downloadservice/DownloadService$ServiceHandler;->sendEmptyMessage(I)Z

    return-void
.end method
