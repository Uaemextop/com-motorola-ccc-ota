.class public Lcom/motorola/otalib/downloadservice/download/PackageDownloader;
.super Ljava/lang/Object;
.source "PackageDownloader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFileDownloader(Lcom/motorola/otalib/common/backoff/BackoffValueProvider;Ljava/net/HttpURLConnection;)Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;
    .locals 1

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "FileDownloaderFactory.getFileDownloader downloaderType ADVANCE download"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;

    invoke-direct {p0, p2, p1}, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;-><init>(Ljava/net/HttpURLConnection;Lcom/motorola/otalib/common/backoff/BackoffValueProvider;)V

    return-object p0
.end method
