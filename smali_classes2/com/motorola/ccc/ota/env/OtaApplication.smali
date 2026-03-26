.class public Lcom/motorola/ccc/ota/env/OtaApplication;
.super Landroid/app/Application;
.source "OtaApplication.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;
    }
.end annotation


# static fields
.field private static final MAX_THREADS:I = 0x5

.field private static final THREAD_POOL_THREAD_TIMEOUT:I = 0x3c

.field private static final THREAD_POOL_TIMEOUT_TIMEUNIT:Ljava/util/concurrent/TimeUnit;

.field private static executor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static global_context:Landroid/content/Context;

.field private static scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sput-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->THREAD_POOL_TIMEOUT_TIMEUNIT:Ljava/util/concurrent/TimeUnit;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 8

    sget-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Lcom/motorola/ccc/ota/env/OtaApplication;->THREAD_POOL_TIMEOUT_TIMEUNIT:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v2, 0x5

    const/4 v3, 0x5

    const-wide/16 v4, 0x3c

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;

    sget-object v2, Lcom/motorola/ccc/ota/env/OtaApplication;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v2}, Ljava/util/concurrent/ThreadPoolExecutor;->getThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;-><init>(Ljava/util/concurrent/ThreadFactory;Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory-IA;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->setThreadFactory(Ljava/util/concurrent/ThreadFactory;)V

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    return-object v0
.end method

.method public static getGlobalContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->global_context:Landroid/content/Context;

    return-object v0
.end method

.method public static getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private saveCDSLoggerContext(Landroid/content/Context;)V
    .locals 0

    const-string p0, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->saveContext(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private saveCommonLoggerContext(Landroid/content/Context;)V
    .locals 0

    const-string p0, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/CommonLogger;->saveContext(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private saveDownloadLoggerContext(Landroid/content/Context;)V
    .locals 0

    const-string p0, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->saveContext(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/OtaApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/env/OtaApplication;->global_context:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/OtaApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/env/OtaApplication;->saveDownloadLoggerContext(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/OtaApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/env/OtaApplication;->saveCDSLoggerContext(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/OtaApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/env/OtaApplication;->saveCommonLoggerContext(Landroid/content/Context;)V

    return-void
.end method

.method public onTerminate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/OtaApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.STOP_ACTION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
