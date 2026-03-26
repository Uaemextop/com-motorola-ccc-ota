.class Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$1;
.super Ljava/lang/Object;
.source "AdvancedFileDownloader.java"

# interfaces
.implements Lcom/motorola/otalib/downloadservice/download/error/ExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;-><init>(Ljava/net/HttpURLConnection;Lcom/motorola/otalib/common/backoff/BackoffValueProvider;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$1;->this$0:Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleException(Ljava/lang/Exception;)Z
    .locals 2

    instance-of p0, p1, Ljava/io/IOException;

    if-eqz p0, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "handleException false "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method
