.class public Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;
.super Ljava/lang/Object;
.source "ResetSMToGettingDescriptorExceptionHandler.java"


# static fields
.field private static mRetryPending:Z = false

.field private static retryTask:Ljava/util/concurrent/ScheduledFuture;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

.field private final mSm:Lcom/motorola/otalib/main/LibCussm;

.field private final maxRetryCount:I

.field private final primaryKey:Ljava/lang/String;

.field private retryCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->primaryKey:Ljava/lang/String;

    sget-object p1, Lcom/motorola/otalib/main/Settings/LibConfigs;->MAX_RETRY_COUNT_DL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 p2, 0x3

    invoke-virtual {p3, p1, p2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iput p1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->maxRetryCount:I

    iput-object p3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iput-object p4, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mSm:Lcom/motorola/otalib/main/LibCussm;

    return-void
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    sput-boolean p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    return p0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->ctx:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->primaryKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;)Lcom/motorola/otalib/main/LibCussm;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mSm:Lcom/motorola/otalib/main/LibCussm;

    return-object p0
.end method

.method public static clearRetryTask()V
    .locals 2

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "ResetSMToGettingDescriptorExceptionHandler.clearRetryTask() clearing pending retry task "

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    sput-boolean v1, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    return-void
.end method

.method public static isRetryPending()Z
    .locals 1

    sget-boolean v0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    return v0
.end method


# virtual methods
.method public handleException(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z
    .locals 7

    const-string v0, "IOException"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p1, v1, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iget v1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->maxRetryCount:I

    if-le p1, v1, :cond_0

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v1, "ResetSMToGettingDescriptorExceptionHandler.handleException,  Aborting the OTA process as exception ("

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, ") retries have maxed out,for retryCount : "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sput-boolean v0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mSm:Lcom/motorola/otalib/main/LibCussm;

    iget-object v2, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->primaryKey:Ljava/lang/String;

    sget-object v4, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    const/4 p4, 0x1

    sput-boolean p4, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mRetryPending:Z

    new-instance v1, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;

    iget-object v2, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v3, Lcom/motorola/otalib/main/Settings/LibConfigs;->BACKOFF_VALUES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v2, v3}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;-><init>(Ljava/lang/String;)V

    const-wide/16 v2, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    invoke-interface {v1}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getNextTimeoutValue()J

    move-result-wide v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v4, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;

    invoke-direct {v4, p0, p1, p2, p3}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;-><init>(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;ILjava/lang/String;Z)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getTimeUnit()Ljava/util/concurrent/TimeUnit;

    move-result-object p0

    invoke-interface {v0, v4, v2, v3, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    sput-object p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "exception retry. RetryCount = "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " RetryInterval= "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return p4

    :cond_2
    return v0
.end method
