.class public Lcom/motorola/ccc/ota/env/OtaService;
.super Landroid/app/Service;
.source "OtaService.java"


# instance fields
.field private context:Landroid/content/Context;

.field private isServiceStartedOnChkUpdate:Z

.field private mConnMgr:Landroid/net/ConnectivityManager;

.field private mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

.field private mOobReceiver:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

.field private mPollingManager:Lcom/motorola/ccc/ota/env/PollingManagerService;

.field private mSetupObserver:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

.field private mUpdateReceiver:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

.field private mUpgraderReceiver:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

.field private modemPollingManager:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;

.field private networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

.field private pollingManager:Lcom/motorola/ccc/ota/env/AndroidPollingManager;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetcontext(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetisServiceStartedOnChkUpdate(Lcom/motorola/ccc/ota/env/OtaService;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->isServiceStartedOnChkUpdate:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmConnMgr(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/net/ConnectivityManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mConnMgr:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmMainReceiver(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmOobReceiver(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mOobReceiver:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUpgraderReceiver(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/ui/UpgraderReceiver;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mUpgraderReceiver:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetnetworkCallback(Lcom/motorola/ccc/ota/env/OtaService;)Landroid/net/ConnectivityManager$NetworkCallback;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OtaService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputisServiceStartedOnChkUpdate(Lcom/motorola/ccc/ota/env/OtaService;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/OtaService;->isServiceStartedOnChkUpdate:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mregisterOtaMainBroadcastReceiver(Lcom/motorola/ccc/ota/env/OtaService;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OtaService;->registerOtaMainBroadcastReceiver()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mregisterUpdateReceiver(Lcom/motorola/ccc/ota/env/OtaService;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OtaService;->registerUpdateReceiver()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mregisterUpgraderReceiver(Lcom/motorola/ccc/ota/env/OtaService;Lcom/motorola/ccc/ota/ui/UpgraderReceiver;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/OtaService;->registerUpgraderReceiver(Lcom/motorola/ccc/ota/ui/UpgraderReceiver;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method private cleanUpDefault()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCED_DOWNLOAD_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method private registerOtaMainBroadcastReceiver()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerFotaIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerMiscIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerStateMachineIntent(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerCheckUpdateActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerRadioActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerWifiDiscoverActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerForceUpgradeActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerPollingManagerExpiryIntent(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerInternalIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerCaptivePortalLoginDone(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerReserveSpaceRequest(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerSuCancelRequest(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerShutdownActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerConfigChangeIntentActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerAscIntentActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerModemIntentActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CceSyncSettingsHandler;->registerCceIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerSimStateChangeReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    :cond_0
    return-void
.end method

.method private registerOutofBoxUpdateDetectReceiver(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;)V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "registering for OutofBoxUpdateDetectReceiver"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerOutofBoxUpdateDetectReceiverIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method private registerUpdateReceiver()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mUpdateReceiver:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerUpdateReceiverIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method private registerUpgraderReceiver(Lcom/motorola/ccc/ota/ui/UpgraderReceiver;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerUpgraderReceiverIntents(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method private unRegisterUpdateReceiver()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mUpdateReceiver:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mUpdateReceiver:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/env/OtaService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method private unregisterOtaMainBroadcastReceiver()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/env/OtaService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method private unregisterOutofBoxUpdateDetectReceiver()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mOobReceiver:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method private unregisterUpgraderReceiver()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mUpgraderReceiver:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/env/OtaService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "onBind() called"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mPollingManager:Lcom/motorola/ccc/ota/env/PollingManagerService;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->getBinder()Landroid/os/IBinder;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public onCreate()V
    .locals 9

    const-string v0, "Launching ota service"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/OtaService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->context:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OtaService;->cleanUpDefault()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/OtaService;->context:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setupDefaults(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->getInstance(Landroid/app/Service;)Lcom/motorola/ccc/ota/env/PollingManagerService;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mPollingManager:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->init()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mUpdateReceiver:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mOobReceiver:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mMainReceiver:Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/ui/UpgraderReceiver;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mUpgraderReceiver:Lcom/motorola/ccc/ota/ui/UpgraderReceiver;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->scheduleWorkManager(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->scheduleModemWorkManager(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BOOT_START_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {v0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    cmp-long v0, v5, v3

    if-lez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v2, v7

    sub-long/2addr v2, v5

    long-to-int v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Time taken for install="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_TIME_TAKEN_FOR_INSTALL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    int-to-long v3, v0

    invoke-virtual {v1, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/env/OtaService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mConnMgr:Landroid/net/ConnectivityManager;

    new-instance v0, Lcom/motorola/ccc/ota/env/OtaService$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/env/OtaService$1;-><init>(Lcom/motorola/ccc/ota/env/OtaService;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mConnMgr:Landroid/net/ConnectivityManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OtaService;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mOobReceiver:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/env/OtaService;->registerOutofBoxUpdateDetectReceiver(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->getInstance()Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mSetupObserver:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-virtual {v0, p0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->init(Landroid/content/Context;)V

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/env/OtaService$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/env/OtaService$2;-><init>(Lcom/motorola/ccc/ota/env/OtaService;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mPollingManager:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->shutdown()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mSetupObserver:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->shutdown()V

    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OtaService;->unregisterOutofBoxUpdateDetectReceiver()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OtaService;->unregisterOtaMainBroadcastReceiver()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OtaService;->unRegisterUpdateReceiver()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OtaService;->unregisterUpgraderReceiver()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OtaService:onDestroy:Exception while unregistering receivers:msg="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    if-eqz p1, :cond_0

    const-string p2, "com.motorola.ccc.ota.SERVICE_STARTED_ON_CHK_UPDATE"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/motorola/ccc/ota/env/OtaService;->isServiceStartedOnChkUpdate:Z

    :cond_0
    iget-object p2, p0, Lcom/motorola/ccc/ota/env/OtaService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OtaService;->mSetupObserver:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->checkSetupCompleted()V

    :cond_1
    if-nez p1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/TestUtils;->collectCrashDump()V

    :cond_2
    const/4 p0, 0x1

    return p0
.end method
