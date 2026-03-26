.class public Lcom/motorola/ccc/ota/env/CheckUpdateWorker;
.super Landroidx/work/Worker;
.source "CheckUpdateWorker.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/work/Worker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized doWork()Landroidx/work/ListenableWorker$Result;
    .locals 6

    monitor-enter p0

    :try_start_0
    const-string v0, "OtaApp"

    const-string v1, "work manager triggered"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isTOSCheckPassed(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "OtaApp"

    const-string v2, "TOS check is not passed for china device, don\'t do any network call, return from here"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroidx/work/ListenableWorker$Result;->success()Landroidx/work/ListenableWorker$Result;

    :cond_0
    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isOtaServiceRunning(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "OtaApp"

    const-string v2, "CheckUpdateWorker - doWork : OTA Service is not running, starting OTA Service..."

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/motorola/ccc/ota/env/OtaService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_1
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOtaSystemBindServiceEnabledState(Landroid/content/Context;Z)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/CheckUpdateWorker;->getTags()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v2, "MODEM_WORK_TAG"

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.ccc.ota.ModemPollingManager.pollingManagerIntent"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.blur.service.blur.cUsPollingService.pollingManagerIntent"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    new-instance v3, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;

    invoke-direct {v3, p0, v1, v0}, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;-><init>(Lcom/motorola/ccc/ota/env/CheckUpdateWorker;Landroid/content/Intent;Landroid/content/Context;)V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0xa

    invoke-interface {v2, v3, v4, v5, v0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    invoke-static {}, Landroidx/work/ListenableWorker$Result;->success()Landroidx/work/ListenableWorker$Result;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
