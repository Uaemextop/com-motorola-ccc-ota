.class public final Lcom/motorola/ccc/ota/env/PollingManagerService;
.super Ljava/lang/Object;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;,
        Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;,
        Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;,
        Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;,
        Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;,
        Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;,
        Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "OtaApp"

.field private static final MY_ACTION:Ljava/lang/String; = "com.motorola.blur.service.blur.pm.alarmintent"

.field private static final REQUEST_ID:Ljava/lang/String; = "requestId"

.field private static mMe:Lcom/motorola/ccc/ota/env/PollingManagerService;


# instance fields
.field private mAlarmManger:Landroid/app/AlarmManager;

.field private final mBinder:Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;

.field private mConnMgr:Landroid/net/ConnectivityManager;

.field private mConnectionType:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mConnectivityRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;

.field private mDataRoaming:Z

.field private mDataRoamingObserver:Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;

.field private mDeviceConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mLock:Ljava/lang/Object;

.field private final mParent:Landroid/app/Service;

.field private mPendingIntent:Landroid/app/PendingIntent;

.field private mPhoneStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mRegisteredApps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;",
            ">;"
        }
    .end annotation
.end field

.field private mRoaming:Z

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private myPollingRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;

.field private myRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;

.field private networkStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;


# direct methods
.method static bridge synthetic -$$Nest$fgetmAlarmManger(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/AlarmManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mAlarmManger:Landroid/app/AlarmManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmConnMgr(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/net/ConnectivityManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnMgr:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmConnectionType(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnectionType:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDataRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoaming:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmDeviceConnected(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDeviceConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmParent(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/Service;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/PendingIntent;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPendingIntent:Landroid/app/PendingIntent;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmRegisteredApps(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRegisteredApps:Ljava/util/HashMap;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRoaming:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmWakeLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/os/PowerManager$WakeLock;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmDataRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoaming:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/env/PollingManagerService;Landroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRoaming:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mbroadcastPollingManagerConnectivity(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->broadcastPollingManagerConnectivity()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdecideWhoNeedsPolling(Lcom/motorola/ccc/ota/env/PollingManagerService;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->decideWhoNeedsPolling(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$misDataSaverEnabled(Lcom/motorola/ccc/ota/env/PollingManagerService;)Z
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->isDataSaverEnabled()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mscheduleTask(Lcom/motorola/ccc/ota/env/PollingManagerService;JI)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/PollingManagerService;->scheduleTask(JI)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msendRoamingIntent(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->sendRoamingIntent()V

    return-void
.end method

.method private constructor <init>(Landroid/app/Service;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRegisteredApps:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mLock:Ljava/lang/Object;

    new-instance v0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPhoneStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;

    new-instance v0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->myRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->myPollingRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnectivityRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRoaming:Z

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoaming:Z

    new-instance v0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/env/PollingManagerService$1;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mBinder:Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDeviceConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, -0x1

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnectionType:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance p1, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;

    invoke-direct {p1, p0}, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->networkStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;

    const-string p0, "OtaApp"

    const-string p1, "PollingManagerService()"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private broadcastPollingManagerConnectivity()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.pm.POLLINGMGR_CONNECTIVITY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDeviceConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    const-string v2, "com.motorola.ccc.ota.pm.connectivity"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result v1

    const-string v2, "com.motorola.ccc.ota.pm.connectivityType"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private decideWhoNeedsPolling(I)V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    const-string v1, "OtaApp"

    const-string v2, "decideWhoNeedsPolling"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    const/4 v3, -0x1

    if-eq p1, v3, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRegisteredApps:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;

    if-eqz v1, :cond_2

    invoke-direct {p0, v1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->preCheck(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->alarmExpired(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRegisteredApps:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_0
    iget-object v3, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRegisteredApps:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->getNextPollTime()J

    move-result-wide v5

    cmp-long v5, v1, v5

    if-ltz v5, :cond_1

    invoke-direct {p0, v4}, Lcom/motorola/ccc/ota/env/PollingManagerService;->preCheck(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p0, v4}, Lcom/motorola/ccc/ota/env/PollingManagerService;->alarmExpired(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)V

    iget-object v4, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRegisteredApps:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static declared-synchronized getInstance(Landroid/app/Service;)Lcom/motorola/ccc/ota/env/PollingManagerService;
    .locals 2

    const-class v0, Lcom/motorola/ccc/ota/env/PollingManagerService;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/motorola/ccc/ota/env/PollingManagerService;->mMe:Lcom/motorola/ccc/ota/env/PollingManagerService;

    if-nez v1, :cond_0

    new-instance v1, Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;-><init>(Landroid/app/Service;)V

    sput-object v1, Lcom/motorola/ccc/ota/env/PollingManagerService;->mMe:Lcom/motorola/ccc/ota/env/PollingManagerService;

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mMe:Lcom/motorola/ccc/ota/env/PollingManagerService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private isDataSaverEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getRestrictBackgroundStatus()I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private preCheck(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z
    .locals 3

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->-$$Nest$fgetmAllowOnlyOnNetwork(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "OtaApp"

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->isDataSaverEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string p0, "no network return"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->-$$Nest$fgetmAllowOnRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->getConnectionType()I

    move-result p1

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRoaming:Z

    if-eqz p1, :cond_2

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoaming:Z

    if-nez p0, :cond_2

    const-string p0, "on roaming return back"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method private scheduleTask(JI)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Polling alarm set to expire at: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Current Time: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.pm.alarmintent"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "requestId"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    const/high16 v2, 0x14000000

    invoke-static {v1, p3, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p3

    iput-object p3, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPendingIntent:Landroid/app/PendingIntent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mAlarmManger:Landroid/app/AlarmManager;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void
.end method

.method private sendRoamingIntent()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.pm.POLLINGMGR_ROAMING_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.pm.roaming"

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mRoaming:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.pm.dataroaming"

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoaming:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method alarmExpired(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)V
    .locals 11

    const-string v0, "OtaApp"

    const-string v1, "PollingManagerService, wake lock acquired"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const-wide/16 v1, 0x7530

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    new-instance v4, Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->getCategories()[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    aget-object v2, v0, v1

    invoke-virtual {v4, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "com.motorola.ccc.ota.pm.appsecret"

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->getAppSecret()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object v3, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    iget-object v6, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->myPollingRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyPollingReceiver;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v5, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    const/4 v7, 0x0

    const/4 v8, -0x1

    invoke-virtual/range {v3 .. v10}, Landroid/app/Service;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public getBinder()Landroid/os/IBinder;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mBinder:Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;

    return-object p0
.end method

.method public getConnectionType()I
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnectionType:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    return p0
.end method

.method public init()V
    .locals 10

    const-string v0, "PollingManagerService init()"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    const-string v2, "phone"

    invoke-virtual {v0, v2}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPhoneStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;

    const/16 v3, 0xc1

    invoke-virtual {v0, v2, v3}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    new-instance v6, Landroid/content/IntentFilter;

    invoke-direct {v6}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.blur.service.blur.pm.alarmintent"

    invoke-virtual {v6, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    iget-object v5, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->myRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;

    const/4 v8, 0x0

    const/4 v9, 0x2

    const-string v7, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual/range {v4 .. v9}, Landroid/app/Service;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v2, "android.net.conn.RESTRICT_BACKGROUND_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    iput-object v2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnMgr:Landroid/net/ConnectivityManager;

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    iget-object v3, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnectivityRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v0, v4}, Landroid/app/Service;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->networkStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->register()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result v0

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-eq v3, v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDeviceConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnectionType:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v4, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDeviceConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v3, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result v3

    :cond_0
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    :cond_1
    new-instance v0, Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v3}, Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;-><init>(Lcom/motorola/ccc/ota/env/PollingManagerService;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoamingObserver:Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    invoke-virtual {v0}, Landroid/app/Service;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "data_roaming"

    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoamingObserver:Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;

    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    const-string v3, "alarm"

    invoke-virtual {v0, v3}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mAlarmManger:Landroid/app/AlarmManager;

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    const-string v3, "power"

    invoke-virtual {v0, v3}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v0, v2, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    return-void
.end method

.method public isConnected()Z
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDeviceConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    return p0
.end method

.method public shutdown()V
    .locals 3

    const-string v0, "OtaApp"

    const-string v1, "PollingManagerService shutdown()"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPhoneStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$MyPhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mAlarmManger:Landroid/app/AlarmManager;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mPendingIntent:Landroid/app/PendingIntent;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->myRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyIntentReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Service;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mConnectivityRecv:Lcom/motorola/ccc/ota/env/PollingManagerService$MyConnectivityReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Service;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->networkStateListener:Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService$NetworkStateChangeListener;->unRegister()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mParent:Landroid/app/Service;

    invoke-virtual {v0}, Landroid/app/Service;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService;->mDataRoamingObserver:Lcom/motorola/ccc/ota/env/PollingManagerService$MyContentObserver;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method
