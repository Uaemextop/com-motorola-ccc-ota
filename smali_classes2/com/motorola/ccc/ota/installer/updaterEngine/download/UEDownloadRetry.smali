.class public Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;
.super Ljava/lang/Object;
.source "UEDownloadRetry.java"


# static fields
.field private static mRetryPending:Z = false

.field private static retryTask:Ljava/util/concurrent/ScheduledFuture;

.field private static settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# instance fields
.field private backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

.field private context:Landroid/content/Context;


# direct methods
.method static bridge synthetic -$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputmRetryPending(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->mRetryPending:Z

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->context:Landroid/content/Context;

    sput-object p2, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance p1, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BACKOFF_VALUES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    return-void
.end method

.method public static clearRetryTask()V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "UEDownloadRetry.clearRetryTask() clearing pending retry task "

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    sput-boolean v1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->mRetryPending:Z

    :cond_0
    return-void
.end method

.method public static isRetryPending()Z
    .locals 1

    sget-boolean v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->mRetryPending:Z

    return v0
.end method


# virtual methods
.method public handleRetry(ILjava/lang/String;)Z
    .locals 13

    invoke-static {p1}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->shouldWeFetchNewUrl(I)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p1}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->getErrorCodeDescription(I)Ljava/lang/String;

    move-result-object v3

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v5, "handleRetry : "

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " fetchNewUrl "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " errorCount "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v7, "OtaApp"

    invoke-static {v7, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_RETRY_COUNT_DL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v6, 0x9

    invoke-virtual {v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    if-ge v0, v1, :cond_1

    const/4 v8, 0x1

    sput-boolean v8, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->mRetryPending:Z

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getTimeOutValue(I)J

    move-result-wide v9

    const-wide/16 v5, -0x1

    cmp-long v1, v9, v5

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v11

    new-instance v12, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;

    move-object v1, v12

    move-object v2, p0

    move-object v5, p2

    move v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    invoke-interface {p1}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getTimeUnit()Ljava/util/concurrent/TimeUnit;

    move-result-object p1

    invoke-interface {v11, v12, v9, v10, p1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "a retry is scheduled after "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    invoke-interface {p0}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getTimeUnit()Ljava/util/concurrent/TimeUnit;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " retryCount is : "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v7, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v8

    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "invalid index access "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v7, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "retry count expired "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v7, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method
