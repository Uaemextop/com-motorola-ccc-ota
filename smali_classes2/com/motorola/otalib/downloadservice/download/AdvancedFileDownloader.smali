.class public Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;
.super Ljava/lang/Object;
.source "AdvancedFileDownloader.java"

# interfaces
.implements Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;
    }
.end annotation


# static fields
.field private static final BotaUpgrade:Ljava/lang/String; = "upgrade"

.field public static final DOWNLOAD_BUFFER_SIZE:I = 0x4000

.field private static final HTTP_TEMP_REDIRECT:I = 0x133

.field public static final READ_BUFFER_SIZE:I = 0x2000

.field private static mETag:Ljava/lang/String; = null

.field private static proceedWithSaveCrc:Z = true


# instance fields
.field private backoffValues:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

.field private exceptionHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Ljava/lang/Exception;",
            ">;",
            "Lcom/motorola/otalib/downloadservice/download/error/ExceptionHandler;",
            ">;"
        }
    .end annotation
.end field

.field private headers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;",
            ">;"
        }
    .end annotation
.end field

.field private processors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;",
            ">;"
        }
    .end annotation
.end field

.field private shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private urlBuilder:Ljava/net/HttpURLConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/net/HttpURLConnection;Lcom/motorola/otalib/common/backoff/BackoffValueProvider;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->headers:Ljava/util/List;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->exceptionHandlers:Ljava/util/Map;

    const-class v1, Ljava/io/IOException;

    new-instance v2, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$1;

    invoke-direct {v2, p0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$1;-><init>(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    iput-object p2, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->backoffValues:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    return-void
.end method

.method private getLengthFromContentRange(Ljava/lang/String;)J
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    const-wide/16 v0, -0x1

    if-nez p0, :cond_0

    const/16 p0, 0x2f

    :try_start_0
    invoke-virtual {p1, p0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p0

    if-ltz p0, :cond_0

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v0, p0

    :catch_0
    :cond_0
    return-wide v0
.end method

.method private readResponseHeaders(Ljava/net/HttpURLConnection;JI)Z
    .locals 9

    const/16 v0, 0xce

    const/4 v1, 0x1

    if-ne p4, v0, :cond_0

    return v1

    :cond_0
    const-string p4, "Transfer-Encoding"

    invoke-virtual {p1, p4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    const-wide/16 v2, -0x1

    if-nez p4, :cond_1

    :try_start_0
    const-string v0, "Content-Length"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_1
    move-wide v4, v2

    :goto_0
    cmp-long v0, v4, v2

    const/4 v6, 0x0

    if-nez v0, :cond_3

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "AdvancedFileDownloader.readResponseHeaders, mContentLength = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p4, :cond_2

    const-string v0, "chunked"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_3

    :cond_2
    return v6

    :cond_3
    const-string p4, "Content-Range"

    invoke-virtual {p1, p4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->getLengthFromContentRange(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long p1, v4, v2

    if-eqz p1, :cond_4

    invoke-direct {p0, p2, p3, v4, v5}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->validateLength(JJ)Z

    move-result p1

    if-nez p1, :cond_4

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p4, "AdvancedFileDownloader.readResponseHeaders:Total file size in Content-Range:"

    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p4, ", does not match expectedSize:"

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v6

    :cond_4
    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    const-string p1, "ETag"

    invoke-virtual {p0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->mETag:Ljava/lang/String;

    return v1
.end method

.method private declared-synchronized shutdownClient()V
    .locals 4

    const-string v0, "AdvancedFileDownloader.shutDownClient, url disconnect exception "

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v2, "AdvancedFileDownloader.shutDownClient, disconnecting HttpUrlConnection.."

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    const-string v1, "java.net.preferIPv4Stack"

    invoke-static {v1}, Ljava/lang/System;->clearProperty(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "java.net.preferIPv6Addresses"

    invoke-static {v1}, Ljava/lang/System;->clearProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw v0
.end method

.method private validateLength(JJ)Z
    .locals 0

    cmp-long p0, p1, p3

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->headers:Ljava/util/List;

    new-instance v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;

    invoke-direct {v1, p0, p1, p2}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;-><init>(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addProcessor(Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public advancedDownloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JLandroid/os/PowerManager$WakeLock;Ljava/lang/String;J)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;
        }
    .end annotation

    move-object/from16 v12, p0

    const-string v13, "AdvancedFileDownloader.newDownloadFile, Releasing wakelock"

    const-string v14, "WakeLock under-locked "

    const-string v15, "AdvancedFileDownloader.newDownloadFile, wakelock RuntimeException "

    const/16 v16, 0x0

    move/from16 v17, v16

    :cond_0
    :try_start_0
    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->acquire()V

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "AdvancedFileDownloader.newDownloadFile, acquiring wakelock"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p5

    move-object/from16 v8, p8

    move-wide/from16 v9, p9

    invoke-virtual/range {v1 .. v10}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->innerResumeDownload(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JLjava/lang/String;J)V

    goto :goto_0

    :cond_1
    new-instance v10, Ljava/util/zip/CRC32;

    invoke-direct {v10}, Ljava/util/zip/CRC32;-><init>()V

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p9

    move-wide/from16 v8, p5

    move-object/from16 v11, p8

    invoke-virtual/range {v1 .. v11}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->innerDownloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JJLjava/util/zip/CRC32;Ljava/lang/String;)V

    :goto_0
    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "AdvancedFileDownloader.newDownloadFile, Exiting from download loop"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lcom/motorola/otalib/downloadservice/download/RetryDownloadException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    invoke-static {v0, v13}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    :goto_1
    invoke-direct/range {p0 .. p0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shutdownClient()V

    move/from16 v17, v16

    goto/16 :goto_5

    :cond_3
    throw v0

    :catchall_0
    move-exception v0

    move-object v1, v0

    goto/16 :goto_6

    :catch_1
    move-exception v0

    :try_start_2
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AdvancedFileDownloader.newDownloadFile, Caught Exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v12, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;

    invoke-interface {v2, v0}, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;->exception(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :cond_4
    :try_start_3
    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    invoke-static {v0, v13}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    :catch_2
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_5
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shutdownClient()V

    goto :goto_5

    :cond_6
    throw v0

    :catch_3
    move-exception v0

    :try_start_4
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AdvancedFileDownloader.newDownloadFile, Caught RetryException "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/RetryDownloadException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    invoke-static {v0, v13}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    :cond_7
    :goto_4
    invoke-direct/range {p0 .. p0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shutdownClient()V

    const/16 v17, 0x1

    :goto_5
    if-eqz v17, :cond_8

    iget-object v0, v12, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_8
    return-void

    :cond_9
    throw v0

    :catch_5
    move-exception v0

    :try_start_6
    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AdvancedFileDownloader.newDownloadFile, RuntimeException: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    :catch_6
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AdvancedFileDownloader.newDownloadFile, HttpFileDownloadException: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :goto_6
    :try_start_7
    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_a

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    invoke-static {v0, v13}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p7 .. p7}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v0

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_a

    throw v0

    :cond_a
    :goto_7
    invoke-direct/range {p0 .. p0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shutdownClient()V

    throw v1
.end method

.method protected computeCRCFromDownloadFile(Ljava/io/File;)Ljava/util/zip/CRC32;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance p0, Ljava/util/zip/CheckedInputStream;

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance p1, Ljava/util/zip/CRC32;

    invoke-direct {p1}, Ljava/util/zip/CRC32;-><init>()V

    invoke-direct {p0, v0, p1}, Ljava/util/zip/CheckedInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Checksum;)V

    const/16 p1, 0x400

    new-array p1, p1, [B

    :goto_0
    invoke-virtual {p0, p1}, Ljava/util/zip/CheckedInputStream;->read([B)I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/util/zip/CheckedInputStream;->close()V

    invoke-virtual {p0}, Ljava/util/zip/CheckedInputStream;->getChecksum()Ljava/util/zip/Checksum;

    move-result-object p0

    check-cast p0, Ljava/util/zip/CRC32;

    return-object p0
.end method

.method protected deleteCRC(Ljava/io/File;)V
    .locals 2

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ".crc"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    return-void
.end method

.method public downloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JLandroid/os/PowerManager$WakeLock;Ljava/lang/String;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;
        }
    .end annotation

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "Creating synchrozised call"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p10}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->advancedDownloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JLandroid/os/PowerManager$WakeLock;Ljava/lang/String;J)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "Ending synchronized call"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected executeErrorHandler(I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/otalib/downloadservice/download/error/HttpErrorCodeHandlerNotFound;
        }
    .end annotation

    const/16 p0, 0x1f4

    if-lt p1, p0, :cond_0

    const/16 p0, 0x1fb

    if-gt p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    new-instance p0, Lcom/motorola/otalib/downloadservice/download/error/HttpErrorCodeHandlerNotFound;

    invoke-direct {p0, p1}, Lcom/motorola/otalib/downloadservice/download/error/HttpErrorCodeHandlerNotFound;-><init>(I)V

    throw p0
.end method

.method protected innerDownloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JJLjava/util/zip/CRC32;Ljava/lang/String;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p3

    move-object/from16 v5, p4

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    const/16 v2, 0x4000

    new-array v2, v2, [B

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v3

    add-long v3, v3, p5

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v6

    iget-object v8, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v8

    if-eqz v8, :cond_0

    return-void

    :cond_0
    sget-object v8, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v12, "AdvancedFileDownloader.innerDownloadFile, downloadUrl : "

    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v12, " Offset value : "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "svcmot"

    invoke-virtual {v0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    const-string v8, "blurdev"

    invoke-virtual {v0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const-string v0, "java.net.preferIPv4Stack"

    const-string v8, "true"

    invoke-static {v0, v8}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "java.net.preferIPv6Addresses"

    const-string v8, "false"

    invoke-static {v0, v8}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->headers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;

    sget-object v9, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "AdvancedFileDownloader: addHeadersToHttpRequest "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->access$000(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v8}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->access$100(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v9, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    invoke-static {v8}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->access$000(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v8}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->access$100(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v12, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-wide/16 v8, 0x0

    cmp-long v0, v3, v8

    if-lez v0, :cond_5

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->mETag:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v12, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    const-string v13, "If-Match"

    invoke-virtual {v12, v13, v0}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "bytes="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Range"

    invoke-virtual {v0, v4, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    const-string v3, "Accept-Encoding"

    const-string v4, "identity"

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    const-string v3, "Connection"

    const-string v4, "close"

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_24

    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_6

    goto/16 :goto_1c

    :cond_6
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v3, 0xc8

    const/4 v12, 0x0

    if-eq v0, v3, :cond_d

    const/16 v3, 0xce

    if-eq v0, v3, :cond_d

    const/16 v2, 0x133

    if-eq v0, v2, :cond_c

    packed-switch v0, :pswitch_data_0

    :try_start_0
    invoke-virtual {v1, v0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->executeErrorHandler(I)Z

    move-result v12
    :try_end_0
    .catch Lcom/motorola/otalib/downloadservice/download/error/HttpErrorCodeHandlerNotFound; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object v2, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;

    invoke-interface {v3, v0, v12}, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;->errorCode(IZ)V

    goto :goto_1

    :cond_7
    if-nez v12, :cond_b

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v3, "AdvancedFileDownloader.innerDownloadFile, error handler returned false for canContinue, informing processors download failed"

    invoke-static {v2, v3}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;

    const/16 v5, 0x190

    if-eq v0, v5, :cond_8

    const/16 v5, 0x191

    if-eq v0, v5, :cond_8

    const/16 v5, 0x193

    if-ne v0, v5, :cond_9

    :cond_8
    iget-object v4, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v4

    :cond_9
    new-instance v5, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "AdvancedFileDownloader.innerDownloadFile,Http error code "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " received"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0, v4}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {v3, v5}, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;->failed(Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;)V

    goto :goto_2

    :cond_a
    new-instance v1, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "AdvancedFileDownloader.innerDownloadFile,ErrorHandler for errorCode "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Returned shouldRetry false"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;-><init>(Ljava/lang/String;I)V

    throw v1

    :cond_b
    new-instance v1, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "AdvancedFileDownloader.innerDownloadFile,Retry for errorCode "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". will be done by DownloadService"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;-><init>(Ljava/lang/String;I)V

    throw v1

    :cond_c
    :pswitch_0
    iget-object v2, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    const-string v3, "Location"

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    new-instance v3, Lcom/motorola/otalib/downloadservice/download/HttpUrlBuilder;

    invoke-direct {v3}, Lcom/motorola/otalib/downloadservice/download/HttpUrlBuilder;-><init>()V

    new-instance v6, Ljava/net/URL;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    move-object/from16 v7, p1

    move/from16 v8, p2

    invoke-virtual {v3, v7, v8, v6, v2}, Lcom/motorola/otalib/downloadservice/download/HttpUrlBuilder;->reopenConnection(Ljava/lang/String;ILjava/net/URL;Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;

    move-result-object v2

    iput-object v2, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "innerDownloadFile: errCode: "

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v5, p4

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    invoke-virtual/range {v1 .. v11}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->innerDownloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JJLjava/util/zip/CRC32;Ljava/lang/String;)V

    return-void

    :cond_d
    cmp-long v3, p7, v8

    if-gtz v3, :cond_e

    :try_start_1
    const-string v3, "upgrade"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_e

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v13

    iget-object v3, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v3

    int-to-long v4, v3

    add-long v3, v13, v4

    sget-object v5, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Expected size from content-length:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " UpgradeSourceType:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v11}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_5

    :catchall_0
    move-exception v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    goto/16 :goto_1b

    :catch_1
    move-exception v0

    const/4 v4, 0x0

    :goto_3
    const/4 v8, 0x0

    goto/16 :goto_16

    :catch_2
    move-exception v0

    const/4 v4, 0x0

    :goto_4
    const/4 v8, 0x0

    goto/16 :goto_19

    :cond_e
    move-wide/from16 v3, p7

    :goto_5
    :try_start_2
    iget-object v5, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    invoke-direct {v1, v5, v3, v4, v0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->readResponseHeaders(Ljava/net/HttpURLConnection;JI)Z

    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_18
    .catchall {:try_start_2 .. :try_end_2} :catchall_a

    if-eqz v0, :cond_1f

    :try_start_3
    new-instance v5, Ljava/io/BufferedInputStream;

    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->urlBuilder:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_15
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_18
    .catchall {:try_start_3 .. :try_end_3} :catchall_a

    :try_start_4
    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->backoffValues:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_14
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_13
    .catchall {:try_start_4 .. :try_end_4} :catchall_8

    if-eqz v0, :cond_f

    :try_start_5
    invoke-interface {v0}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->reset()V

    :cond_f
    cmp-long v0, v6, v8

    const/4 v8, 0x1

    if-nez v0, :cond_10

    new-instance v0, Ljava/util/zip/CheckedOutputStream;

    new-instance v9, Ljava/io/FileOutputStream;

    move-object/from16 v11, p4

    invoke-direct {v9, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v9, v10}, Ljava/util/zip/CheckedOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Checksum;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_6

    :catchall_1
    move-exception v0

    const/4 v4, 0x0

    goto/16 :goto_1b

    :catch_3
    move-exception v0

    move-object v4, v5

    goto :goto_3

    :catch_4
    move-exception v0

    move-object v4, v5

    goto :goto_4

    :cond_10
    move-object/from16 v11, p4

    :try_start_6
    new-instance v0, Ljava/util/zip/CheckedOutputStream;

    new-instance v9, Ljava/io/FileOutputStream;

    invoke-direct {v9, v11, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    invoke-direct {v0, v9, v10}, Ljava/util/zip/CheckedOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Checksum;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_14
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_13
    .catchall {:try_start_6 .. :try_end_6} :catchall_8

    :goto_6
    move-object v9, v0

    :goto_7
    :try_start_7
    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_12
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_11
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    if-nez v0, :cond_19

    move v0, v12

    :goto_8
    const/16 v10, 0x2000

    if-ge v0, v10, :cond_11

    :try_start_8
    invoke-virtual {v5, v2, v0, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v10
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    if-lez v10, :cond_11

    add-int/2addr v0, v10

    goto :goto_8

    :catchall_2
    move-exception v0

    move-object v4, v9

    goto/16 :goto_1b

    :catch_5
    move-exception v0

    move-object v4, v5

    move-object v8, v9

    goto/16 :goto_16

    :catch_6
    move-exception v0

    move-object v4, v5

    move-object v8, v9

    goto/16 :goto_19

    :cond_11
    if-gtz v0, :cond_12

    move-object v8, v9

    move/from16 v16, v12

    move v12, v0

    move/from16 v0, v16

    goto/16 :goto_e

    :cond_12
    :try_start_9
    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_18

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v13
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_12
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_11
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    cmp-long v10, v13, v6

    if-lez v10, :cond_13

    :try_start_a
    new-instance v10, Ljava/io/RandomAccessFile;

    const-string v13, "r"

    invoke-direct {v10, v11, v13}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sget-object v13, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "AdvancedFileDownloader.innerDownloadFile,downloadLocation.length() more than offset : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_a
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_9
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    move-object v15, v9

    :try_start_b
    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v8

    invoke-virtual {v14, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "totalBytesRead: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v13, v8}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v6, v7}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_7
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    goto :goto_c

    :catchall_3
    move-exception v0

    goto :goto_9

    :catch_7
    move-exception v0

    goto :goto_a

    :catch_8
    move-exception v0

    goto :goto_b

    :catchall_4
    move-exception v0

    move-object v15, v9

    :goto_9
    move-object v4, v15

    goto/16 :goto_1b

    :catch_9
    move-exception v0

    move-object v15, v9

    :goto_a
    move-object v4, v5

    move-object v8, v15

    goto/16 :goto_16

    :catch_a
    move-exception v0

    move-object v15, v9

    :goto_b
    move-object v4, v5

    move-object v8, v15

    goto/16 :goto_19

    :cond_13
    move-object v15, v9

    :goto_c
    :try_start_c
    sget-boolean v8, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->proceedWithSaveCrc:Z
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_c
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_b
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    if-eqz v8, :cond_17

    move-object v8, v15

    :try_start_d
    invoke-virtual {v8, v2, v12, v0}, Ljava/util/zip/CheckedOutputStream;->write([BII)V

    invoke-virtual {v8}, Ljava/util/zip/CheckedOutputStream;->flush()V

    int-to-long v9, v0

    add-long/2addr v6, v9

    invoke-virtual {v8}, Ljava/util/zip/CheckedOutputStream;->getChecksum()Ljava/util/zip/Checksum;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/zip/Checksum;->getValue()J

    move-result-wide v9

    invoke-virtual {v1, v11, v9, v10}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->saveCRC(Ljava/io/File;J)V

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v9

    cmp-long v9, v9, v6

    if-nez v9, :cond_16

    iget-object v9, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_d
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_14

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;

    invoke-interface {v10, v2}, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;->progress([B)V

    goto :goto_d

    :cond_14
    cmp-long v9, v6, v3

    if-ltz v9, :cond_15

    move v12, v0

    const/4 v0, 0x1

    goto :goto_e

    :cond_15
    move-object v9, v8

    const/4 v8, 0x1

    goto/16 :goto_7

    :cond_16
    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AdvancedFileDownloader.innerDownloadFile, downloadLocation.length(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " totalBytesRead: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "AdvancedFileDownloader.innerDownloadFile,Not seeing any file size increase. Something wrong with filesystem"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_17
    move-object v8, v15

    new-instance v0, Ljava/io/IOException;

    const-string v2, "AdvancedFileDownloader.innerDownloadFile,failed to write into the .crc file"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_5
    move-exception v0

    move-object v8, v15

    goto/16 :goto_1a

    :catch_b
    move-exception v0

    move-object v8, v15

    goto/16 :goto_11

    :catch_c
    move-exception v0

    move-object v8, v15

    goto/16 :goto_12

    :cond_18
    move-object v8, v9

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "AdvancedFileDownloader.innerDownloadFile,download location went missing."

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_19
    move-object v8, v9

    move v0, v12

    :goto_e
    iget-object v2, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_10
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_f
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    if-eqz v2, :cond_1a

    :try_start_e
    invoke-virtual {v8}, Ljava/util/zip/CheckedOutputStream;->close()V

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_d

    :catch_d
    return-void

    :cond_1a
    if-gtz v12, :cond_1c

    if-eqz v0, :cond_1b

    goto :goto_f

    :cond_1b
    :try_start_f
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "AdvancedFileDownloader.innerDownloadFile,Got -1 for read length and but did not read expectedSize:"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, "/"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c
    :goto_f
    if-eqz v0, :cond_1e

    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;

    invoke-interface {v2}, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;->finished()V

    goto :goto_10

    :cond_1d
    const/4 v2, 0x0

    sput-object v2, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->mETag:Ljava/lang/String;

    invoke-virtual {v1, v11}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->deleteCRC(Ljava/io/File;)V

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v2, "AdvancedFileDownloader.innerDownloadFile, download file completed"

    invoke-static {v0, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_10
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    :cond_1e
    :try_start_10
    invoke-virtual {v8}, Ljava/util/zip/CheckedOutputStream;->close()V

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_e

    :catch_e
    return-void

    :catchall_6
    move-exception v0

    goto/16 :goto_1a

    :catch_f
    move-exception v0

    goto :goto_11

    :catch_10
    move-exception v0

    goto :goto_12

    :catchall_7
    move-exception v0

    move-object v8, v9

    goto/16 :goto_1a

    :catch_11
    move-exception v0

    move-object v8, v9

    goto :goto_11

    :catch_12
    move-exception v0

    move-object v8, v9

    goto :goto_12

    :catchall_8
    move-exception v0

    const/4 v2, 0x0

    move-object v4, v2

    goto/16 :goto_1b

    :catch_13
    move-exception v0

    const/4 v2, 0x0

    move-object v8, v2

    :goto_11
    move-object v4, v5

    goto :goto_16

    :catch_14
    move-exception v0

    const/4 v2, 0x0

    move-object v8, v2

    :goto_12
    move-object v4, v5

    goto/16 :goto_19

    :catch_15
    move-exception v0

    const/4 v2, 0x0

    :try_start_11
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AdvancedFileDownloader.innerDownloadFile,BufferedInputStream ioexception "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1f
    const/4 v2, 0x0

    iget-object v0, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_17
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_16
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    const-string v4, "AdvancedFileDownloader.innerDownloadFile,Response header validation failed"

    if-eqz v3, :cond_20

    :try_start_12
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;

    new-instance v5, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;

    sget-object v6, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_FATAL_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    invoke-direct {v5, v4, v6}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;-><init>(Ljava/lang/String;Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;)V

    invoke-interface {v3, v5}, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;->failed(Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;)V

    goto :goto_13

    :cond_20
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_17
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_16
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    :catchall_9
    move-exception v0

    goto :goto_14

    :catch_16
    move-exception v0

    goto :goto_15

    :catch_17
    move-exception v0

    goto :goto_18

    :catchall_a
    move-exception v0

    const/4 v2, 0x0

    :goto_14
    move-object v4, v2

    move-object v5, v4

    goto :goto_1b

    :catch_18
    move-exception v0

    const/4 v2, 0x0

    :goto_15
    move-object v4, v2

    move-object v8, v4

    :goto_16
    :try_start_13
    iget-object v1, v1, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->processors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;

    new-instance v3, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;

    const-string v5, "AdvancedFileDownloader.innerDownloadFile,RuntimeException received, invoking processor.failed()"

    sget-object v6, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_FATAL_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    invoke-direct {v3, v5, v6}, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;-><init>(Ljava/lang/String;Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;)V

    invoke-interface {v2, v3}, Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;->failed(Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;)V

    goto :goto_17

    :cond_21
    throw v0

    :catch_19
    move-exception v0

    const/4 v2, 0x0

    :goto_18
    move-object v4, v2

    move-object v8, v4

    :goto_19
    throw v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_b

    :catchall_b
    move-exception v0

    move-object v5, v4

    :goto_1a
    move-object v4, v8

    :goto_1b
    if-eqz v4, :cond_22

    :try_start_14
    invoke-virtual {v4}, Ljava/util/zip/CheckedOutputStream;->close()V

    :cond_22
    if-eqz v5, :cond_23

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_1a

    :catch_1a
    :cond_23
    throw v0

    :cond_24
    :goto_1c
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x12d
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected innerResumeDownload(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JLjava/lang/String;J)V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object v1, p0

    move-object/from16 v5, p4

    const-string v0, "AdvancedFileDownloader.innerResumeDownload,CRC Validation failed. Resetting offset to 0 ComputeCRC value :"

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->exists()Z

    move-result v2

    const-wide/16 v3, 0x0

    const/4 v6, 0x0

    if-eqz v2, :cond_0

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->length()J

    move-result-wide v7

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "AdvancedFileDownloader.innerResumeDownload, Offset value : "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p0, v5}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->computeCRCFromDownloadFile(Ljava/io/File;)Ljava/util/zip/CRC32;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v9

    invoke-virtual {p0, v5}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->readCRC(Ljava/io/File;)J

    move-result-wide v11

    cmp-long v2, v9, v11

    if-eqz v2, :cond_1

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, "ReadCRC value "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v5}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->readCRC(Ljava/io/File;)J

    move-result-wide v7

    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "AdvancedFileDownloader.innerResumeDownload,Exception while computing or reading crc "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    move-wide v7, v3

    :cond_1
    cmp-long v0, v7, v3

    if-nez v0, :cond_2

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->delete()Z

    invoke-virtual {p0, v5}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->deleteCRC(Ljava/io/File;)V

    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    move-object v10, v0

    goto :goto_1

    :cond_2
    move-object v10, v6

    :goto_1
    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "AdvancedFileDownloader.innerResumeDownload,Restarting from offset:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "AdvancedFileDownloader.innerResumeDownload,Resuming from CRC:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p8

    move-wide/from16 v8, p5

    move-object/from16 v11, p7

    invoke-virtual/range {v1 .. v11}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->innerDownloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JJLjava/util/zip/CRC32;Ljava/lang/String;)V

    return-void
.end method

.method protected readCRC(Ljava/io/File;)J
    .locals 2

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ".crc"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance p1, Ljava/io/DataInputStream;

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/io/DataInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method protected saveCRC(Ljava/io/File;J)V
    .locals 2

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ".crc"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance p1, Ljava/io/DataOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p1, p2, p3}, Ljava/io/DataOutputStream;->writeLong(J)V

    invoke-virtual {p1}, Ljava/io/DataOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p0, 0x0

    sput-boolean p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->proceedWithSaveCrc:Z

    :goto_0
    return-void
.end method

.method public shutdown()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shouldShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;->shutdownClient()V

    return-void
.end method
