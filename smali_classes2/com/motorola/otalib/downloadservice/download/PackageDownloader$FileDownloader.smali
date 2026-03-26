.class public interface abstract Lcom/motorola/otalib/downloadservice/download/PackageDownloader$FileDownloader;
.super Ljava/lang/Object;
.source "PackageDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/download/PackageDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "FileDownloader"
.end annotation


# virtual methods
.method public abstract addHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract addProcessor(Lcom/motorola/otalib/downloadservice/download/DownloadProcessor;)V
.end method

.method public abstract downloadFile(Ljava/lang/String;ILjava/lang/String;Ljava/io/File;JLandroid/os/PowerManager$WakeLock;Ljava/lang/String;J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation
.end method

.method public abstract shutdown()V
.end method
