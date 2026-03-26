.class public Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;
.super Ljava/lang/Object;
.source "ResetSMToGettingDescriptor.java"


# static fields
.field private static mRetryPending:Z = false

.field private static retryTask:Ljava/util/concurrent/ScheduledFuture;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final deleteFile:Z

.field private final downloadFile:Ljava/io/File;

.field private final errorTitle:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private final primaryKey:Ljava/lang/String;

.field private final settings:Lcom/motorola/otalib/main/Settings/LibSettings;

.field private final sm:Lcom/motorola/otalib/main/LibCussm;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/io/File;ZLcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/LibCussm;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->ctx:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->errorTitle:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->primaryKey:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->downloadFile:Ljava/io/File;

    iput-boolean p6, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->deleteFile:Z

    iput-object p7, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iput-object p8, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->sm:Lcom/motorola/otalib/main/LibCussm;

    return-void
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    sput-boolean p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->mRetryPending:Z

    return p0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->ctx:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->primaryKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;)Lcom/motorola/otalib/main/LibCussm;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->sm:Lcom/motorola/otalib/main/LibCussm;

    return-object p0
.end method

.method public static clearRetryTask()V
    .locals 2

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "ResetSMToGettingDescriptor.clearRetryTask() clearing pending retry task "

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    sput-boolean v1, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->mRetryPending:Z

    return-void
.end method

.method public static isRetryPending()Z
    .locals 1

    sget-boolean v0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->mRetryPending:Z

    return v0
.end method


# virtual methods
.method public shouldRetry(Ljava/lang/String;ZLjava/lang/String;)Z
    .locals 9

    iget-boolean v0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->deleteFile:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->downloadFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_0
    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v3, Lcom/motorola/otalib/main/Settings/LibConfigs;->MAX_RETRY_COUNT_DL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v4, 0x3

    invoke-virtual {v1, v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    if-le v0, v1, :cond_1

    sput-boolean v2, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->mRetryPending:Z

    iget-object v3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->sm:Lcom/motorola/otalib/main/LibCussm;

    iget-object v4, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->ctx:Landroid/content/Context;

    iget-object v5, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->primaryKey:Ljava/lang/String;

    sget-object v6, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Aborting OTA process as the retry for "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->errorTitle:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ") have maxed out , retryCount : "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object v8, p3

    invoke-virtual/range {v3 .. v8}, Lcom/motorola/otalib/main/LibCussm;->failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    const/4 p3, 0x1

    sput-boolean p3, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->mRetryPending:Z

    new-instance v1, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;

    iget-object v3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->BACKOFF_VALUES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v3, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;-><init>(Ljava/lang/String;)V

    const-wide/16 v3, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    invoke-interface {v1}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getNextTimeoutValue()J

    move-result-wide v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    new-instance v5, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;

    invoke-direct {v5, p0, p2, p1}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;-><init>(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;ZLjava/lang/String;)V

    invoke-interface {v1}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getTimeUnit()Ljava/util/concurrent/TimeUnit;

    move-result-object p0

    invoke-interface {v2, v5, v3, v4, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    sput-object p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->retryTask:Ljava/util/concurrent/ScheduledFuture;

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "4xx retry. RetryCount = "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " RetryInterval= "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return p3
.end method
