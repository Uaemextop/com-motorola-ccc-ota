.class public Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;
.super Ljava/lang/Object;
.source "ResetSMToGettingDescriptorExceptionHandler.java"


# static fields
.field private static mRetryPending:Z = false

.field private static retryTask:Ljava/util/concurrent/ScheduledFuture;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final mSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final mSm:Lcom/motorola/ccc/ota/CusSM;

.field private final maxRetryCount:I

.field private retryCount:I

.field private final version:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->ctx:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmSettings(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetversion(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->version:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfputmRetryPending(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->version:Ljava/lang/String;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_RETRY_COUNT_DL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 p2, 0x9

    invoke-virtual {p3, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->maxRetryCount:I

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p4, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mSm:Lcom/motorola/ccc/ota/CusSM;

    return-void
.end method

.method public static clearRetryTask()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "ResetSMToGettingDescriptorExceptionHandler.clearRetryTask() clearing pending retry task "

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    sput-boolean v1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    return-void
.end method

.method public static isRetryPending()Z
    .locals 1

    sget-boolean v0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    return v0
.end method


# virtual methods
.method public handleException(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z
    .locals 14

    move-object v1, p0

    const-string v0, "IOException"

    move-object v4, p1

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v6

    iget v0, v1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->maxRetryCount:I

    const-string v7, "OtaApp"

    if-le v6, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "ResetSMToGettingDescriptorExceptionHandler.handleException,  Aborting the OTA process as exception ("

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v3, p2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ") retries have maxed out,for retryCount : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sput-boolean v2, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mSm:Lcom/motorola/ccc/ota/CusSM;

    iget-object v1, v1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->version:Ljava/lang/String;

    sget-object v4, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-object/from16 v5, p4

    invoke-virtual {v3, v1, v4, v0, v5}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    move-object/from16 v3, p2

    const/4 v8, 0x1

    sput-boolean v8, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    new-instance v9, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BACKOFF_VALUES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;-><init>(Ljava/lang/String;)V

    const-wide/16 v10, 0x0

    :goto_0
    if-ge v2, v6, :cond_1

    invoke-interface {v9}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getNextTimeoutValue()J

    move-result-wide v10

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v12

    new-instance v13, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler$1;

    move-object v0, v13

    move-object v1, p0

    move v2, v6

    move-object/from16 v3, p2

    move-object v4, p1

    move/from16 v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler$1;-><init>(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;ILjava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v9}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getTimeUnit()Ljava/util/concurrent/TimeUnit;

    move-result-object v0

    invoke-interface {v12, v13, v10, v11, v0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "exception retry. RetryCount = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " RetryInterval= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v8

    :cond_2
    return v2
.end method
