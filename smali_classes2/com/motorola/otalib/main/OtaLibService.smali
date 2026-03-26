.class public Lcom/motorola/otalib/main/OtaLibService;
.super Landroid/app/Service;
.source "OtaLibService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;
    }
.end annotation


# static fields
.field private static mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

.field private static scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private static settings:Lcom/motorola/otalib/main/Settings/LibSettings;

.field private static sm:Lcom/motorola/otalib/main/LibCussm;


# instance fields
.field private mBinder:Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/OtaLibService;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    return-object v0
.end method

.method static synthetic access$002(Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;)Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;
    .locals 0

    sput-object p0, Lcom/motorola/otalib/main/OtaLibService;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    return-object p0
.end method

.method static synthetic access$100()Lcom/motorola/otalib/main/LibCussm;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/OtaLibService;->sm:Lcom/motorola/otalib/main/LibCussm;

    return-object v0
.end method

.method static synthetic access$102(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/main/LibCussm;
    .locals 0

    sput-object p0, Lcom/motorola/otalib/main/OtaLibService;->sm:Lcom/motorola/otalib/main/LibCussm;

    return-object p0
.end method

.method static synthetic access$200()Lcom/motorola/otalib/main/Settings/LibSettings;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/OtaLibService;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    return-object v0
.end method

.method private cleanUp()V
    .locals 1

    sget-object p0, Lcom/motorola/otalib/main/OtaLibService;->sm:Lcom/motorola/otalib/main/LibCussm;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/LibCussm;->onDestroy()V

    sput-object v0, Lcom/motorola/otalib/main/OtaLibService;->sm:Lcom/motorola/otalib/main/LibCussm;

    :cond_0
    sput-object v0, Lcom/motorola/otalib/main/OtaLibService;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    return-void
.end method

.method private getLogPreFix()Ljava/lang/String;
    .locals 2

    iget-object p0, p0, Lcom/motorola/otalib/main/OtaLibService;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OtaLib["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    aget-object p0, p0, v1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "]"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/OtaLibService;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/main/OtaLibService;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_0
    sget-object v0, Lcom/motorola/otalib/main/OtaLibService;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private saveCDSLoggerContext(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/OtaLibService;->getLogPreFix()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->saveContext(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private saveCommonLoggerContext(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/OtaLibService;->getLogPreFix()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/CommonLogger;->saveContext(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private saveDownloadLoggerContext(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/OtaLibService;->getLogPreFix()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->saveContext(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "Ota lib service Intent"

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/OtaLibService;->mBinder:Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/IBinder;

    return-object p0
.end method

.method public onCreate()V
    .locals 8

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    new-instance v0, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

    invoke-direct {v0, p0}, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;-><init>(Lcom/motorola/otalib/main/OtaLibService;)V

    iput-object v0, p0, Lcom/motorola/otalib/main/OtaLibService;->mBinder:Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

    invoke-virtual {p0}, Lcom/motorola/otalib/main/OtaLibService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/otalib/main/OtaLibService;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/motorola/otalib/main/OtaLibService;->getLogPreFix()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "Ota lib service onCreate"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v1, p0, Lcom/motorola/otalib/main/OtaLibService;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/motorola/otalib/main/OtaLibService;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual {v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getPrefs()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Lcom/motorola/otalib/main/Settings/LibConfigs;->values()[Lcom/motorola/otalib/main/Settings/LibConfigs;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    invoke-virtual {v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;->value()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/motorola/otalib/main/OtaLibService;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual {v5}, Lcom/motorola/otalib/main/Settings/LibSettings;->getPrefs()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-virtual {v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;->key()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_0

    invoke-virtual {v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;->key()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;->value()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lcom/motorola/otalib/main/OtaLibService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/otalib/main/OtaLibService;->saveDownloadLoggerContext(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/otalib/main/OtaLibService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/otalib/main/OtaLibService;->saveCDSLoggerContext(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/otalib/main/OtaLibService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/otalib/main/OtaLibService;->saveCommonLoggerContext(Landroid/content/Context;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-direct {p0}, Lcom/motorola/otalib/main/OtaLibService;->cleanUp()V

    iget-object v0, p0, Lcom/motorola/otalib/main/OtaLibService;->mBinder:Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/otalib/main/OtaLibService;->mBinder:Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

    :cond_0
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "Ota lib service onDestroy"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "Ota lib service onRebind"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "Ota lib service onStartCommand"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2

    invoke-direct {p0}, Lcom/motorola/otalib/main/OtaLibService;->cleanUp()V

    iget-object v0, p0, Lcom/motorola/otalib/main/OtaLibService;->mBinder:Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/otalib/main/OtaLibService;->mBinder:Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;

    :cond_0
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "Ota lib service onUnbind"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    const/4 p0, 0x1

    return p0
.end method
