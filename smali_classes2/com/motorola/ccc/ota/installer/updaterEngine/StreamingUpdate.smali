.class public Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;
.super Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;
.source "StreamingUpdate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;,
        Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;
    }
.end annotation


# static fields
.field private static mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

.field private static mPendingIntent:Landroid/app/PendingIntent;

.field private static networkDetails:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

.field private static streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;


# instance fields
.field private callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

.field private context:Landroid/content/Context;

.field private d:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

.field private dlBuilder:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;

.field private downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mCm:Landroid/net/ConnectivityManager;

.field private mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

.field private mTm:Landroid/telephony/TelephonyManager;

.field private od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

.field private request:Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

.field private ueDownloadRetry:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

.field private zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;


# direct methods
.method static bridge synthetic -$$Nest$fgetcallbackHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetd(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->d:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdlBuilder(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->dlBuilder:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdownloadingChoices(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCm(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/net/ConnectivityManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mCm:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmTm(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/telephony/TelephonyManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mTm:Landroid/telephony/TelephonyManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetod(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetrequest(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->request:Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetueDownloadRetry(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->ueDownloadRetry:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputdlBuilder(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->dlBuilder:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputdownloadingChoices(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputrequest(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->request:Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckAndStopWifiDiscoveryManager(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->checkAndStopWifiDiscoveryManager()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->sendUpgradeStatus(FII)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstartWifiDiscoveryManager(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->startWifiDiscoveryManager()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetmInstallerStatus()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetnetworkDetails()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->networkDetails:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputmInstallerStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V
    .locals 0

    sput-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputnetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;)V
    .locals 0

    sput-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->networkDetails:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    return-void
.end method

.method public constructor <init>(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;)V
    .locals 1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;-><init>()V

    iput-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->d:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->getUpdaterEngineStateHandlerInstance()Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    move-result-object p1

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    new-instance p1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

    iget-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    iget-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1, p2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;-><init>(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->ueDownloadRetry:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    const-string p2, "connectivity"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mCm:Landroid/net/ConnectivityManager;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    const-string p2, "phone"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/TelephonyManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mTm:Landroid/telephony/TelephonyManager;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    const-string p2, "dl_prefs"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    new-instance p2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    invoke-direct {p2, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;-><init>(Landroid/content/SharedPreferences;)V

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    invoke-static {p1, p2}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->getZeroRatedServices(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    new-instance p1, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    iget-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mCm:Landroid/net/ConnectivityManager;

    iget-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mTm:Landroid/telephony/TelephonyManager;

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-direct {p1, p2, p3, v0}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;-><init>(Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "alarm"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/AlarmManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mAlarmManager:Landroid/app/AlarmManager;

    return-void
.end method

.method private checkAndStopWifiDiscoveryManager()V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cleanBotaWifiDiscoveryTimer()V

    :cond_0
    return-void
.end method

.method private sendUpgradeStatus(FII)V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-eqz v0, :cond_3

    if-eqz p3, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    sget-object v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-static {p0, p1, p2, p3, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendUpgradeStatus(Landroid/content/Context;FIILcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    cmpl-float v1, p1, v0

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/high16 v3, -0x40800000    # -1.0f

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setFloat(Lcom/motorola/otalib/common/settings/ISetting;F)V

    :cond_1
    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-static {v0, p1, p2, p3, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendUpgradeStatus(Landroid/content/Context;FIILcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;)V

    :cond_2
    iget-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, v0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setFloat(Lcom/motorola/otalib/common/settings/ISetting;F)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    :cond_3
    return-void
.end method

.method private startWifiDiscoveryManager()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->sendUpgradeStatus(FII)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->startBotaWifiDiscoveryTimer()V

    return-void
.end method

.method private declared-synchronized transferUpgradeToUE()V
    .locals 3

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->registerForStreamingIntent()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    const-string v1, "doNotBindOtaProcess"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    invoke-virtual {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->initializeUpdaterEngineStateHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;)V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeToUE()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized allocateSpaceBeforeApplyPatch(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->getAllocateSpaceStarted()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "SteamingUpdate.allocateSpaceBeforeApplyPatch inside allocateSpace thread."

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->setAllocateSpaceStarted(Z)V

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getStreamingData()Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getHeaderValues(Lorg/json/JSONObject;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getPayloadMetaDataFileName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->allocateSpace(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "OtaApp"

    const-string v0, "SteamingUpdate.allocateSpaceBeforeApplyPatch allocateSpace thread locked."

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public cancelPendingExpiryAlarmSetForUE()V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mPendingIntent:Landroid/app/PendingIntent;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-virtual {p0, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    :cond_0
    return-void
.end method

.method public checkAndResetInstallerFromCusSM(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V
    .locals 1

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, p2, :cond_1

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, p2, :cond_1

    sget-object p2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p1, p2, :cond_7

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelRestartNotification()V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->resetUpdateEngine()V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cancelBGInstallNotification()V

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->setAllocateSpaceStarted(Z)V

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, v0, :cond_3

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p1, v0, :cond_3

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p1, v0, :cond_4

    :cond_3
    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_USER_CANCEL:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne p2, v0, :cond_4

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendCancelBackgroundInstallationResponse(Landroid/content/Context;)V

    goto :goto_1

    :cond_4
    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p1, v0, :cond_7

    sput-object p2, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_USER_CANCEL:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    if-ne p2, p1, :cond_6

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendCancelBackgroundInstallationResponse(Landroid/content/Context;)V

    :cond_6
    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V

    :cond_7
    :goto_1
    return-void
.end method

.method public clearRetryTasks()V
    .locals 1

    invoke-super {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->clearRetryTasks()V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->clearRetryTask()V

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->cancelPendingExpiryAlarmSetForUE()V

    return-void
.end method

.method public clearUEInstallerBeforeExit()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "clearUEInstallerBeforeExit"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->resetBinded()V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    const-string v1, "doNotBindOtaProcess"

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->clearConfigValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getAdminApnUrl(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->od:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    :cond_1
    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mInstallerStatus:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->cancelPendingExpiryAlarmSetForUE()V

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->setApplyPayloadStarted(Z)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->clearUEStateHandler()V

    return-void
.end method

.method public displayScreenForGettingDescriptor(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendStartBackgroundInstallationFragment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Exception in StreamingUpdate, displayScreenForGettingDescriptor: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public getCurrentInstallerType()Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
    .locals 0

    sget-object p0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    return-object p0
.end method

.method public declared-synchronized initializeUpdaterEngineHandlerMergeState()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_BUSY:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    invoke-virtual {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->initializeUpdaterEngineStateHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;)V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeToUE()V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isDataSpaceLowForUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/otalib/common/Environment/ApplicationEnv;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onAllocateSpaceResult()V
    .locals 0

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->setAllocateSpaceStarted(Z)V

    return-void
.end method

.method public onInternalNotification(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 0

    return-void
.end method

.method public onStartDownloadNotification(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreInstallScreen()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getRebootRequired()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, p0, v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VERIFY_PAYLOAD_STATUS_CHECK:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, p0, v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    return-void

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, p0, v1, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    return-void
.end method

.method public registerForStreamingIntent()V
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver-IA;)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_ACTIVE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_INACTIVE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.ACTION_AB_APPLY_PAYLOAD_SUSPEND"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.ACTION_BATTERY_LOW"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.ACTION_DATA_SAVER_DURING_AB_STREAMING"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    sget-object v2, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    invoke-static {v1, v2, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.ccc.ota.INTENT_MAX_ALARM_FOR_UE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->streamingUpdateBroadcastReceiver:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    return-void
.end method

.method public restartOnProgress()V
    .locals 2

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->setApplyPayloadStarted(Z)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->cancelPendingExpiryAlarmSetForUE()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->callbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onProgress(IF)V

    return-void
.end method

.method public setExpiryAlarmForUE(IF)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.INTENT_MAX_ALARM_FOR_UE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "key_percentage"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    const-string p2, "key_status"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->context:Landroid/content/Context;

    const/high16 p2, 0x14000000

    const/4 v1, 0x0

    invoke-static {p1, v1, v0, p2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mPendingIntent:Landroid/app/PendingIntent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const-wide/32 v2, 0xdbba0

    add-long/2addr p1, v2

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {p0, v1, p1, p2, v0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void
.end method

.method public declared-synchronized updaterEngineHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;)Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "Starting streaming update"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledByPolicyMngr()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SYSTEM_UPDATE_CANCEL_POLICY_SET:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {p2, p1, v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->shouldIBlockUpdateForSystemPolicy(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SYSTEM_UPDATE_POLICY_SET:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_1
    :try_start_2
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_BUSY:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_2
    :try_start_3
    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->transferUpgradeToUE()V

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
