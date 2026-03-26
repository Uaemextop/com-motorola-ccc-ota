.class Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;
.super Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;
.source "ConfigDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/main/Downloader/ConfigDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-direct {p0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public dlResponse(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public errorCode(Ljava/lang/String;IZ)V
    .locals 2

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler.errorCode(). Download received errorCode :"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    if-nez p3, :cond_0

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$202(Z)Z

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$400(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;Z)V

    :goto_0
    return-void
.end method

.method public exception(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LibDownloadHandler.exception(). Download received exception :"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$202(Z)Z

    iget-object p2, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p2}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$300(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$400(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;Z)V

    return-void
.end method

.method public failed(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "LibDownloadHandler.failed(). Download failed : "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$202(Z)Z

    iget-object p2, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p2}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$300(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$400(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;Z)V

    return-void
.end method

.method public finished(Ljava/lang/String;)V
    .locals 1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "LibDownloadHandler.finished: I appear to have read the entire file "

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$300(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$400(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;Z)V

    return-void
.end method

.method public initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " meta data file download"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "LibDownloadHandler.initFailed() "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$300(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$400(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;Z)V

    return-void
.end method

.method public progress(Ljava/lang/String;)V
    .locals 4

    new-instance p0, Ljava/io/File;

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$000()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide p0

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$100()J

    move-result-wide v0

    const-wide/16 v2, 0x64

    mul-long/2addr p0, v2

    div-long/2addr p0, v0

    long-to-int p0, p0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Download progress for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$000()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public suspended(Ljava/lang/String;Z)V
    .locals 0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "LibDownloadHandler.suspended()"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$202(Z)Z

    iget-object p2, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p2}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$300(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader$1;->this$0:Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;->access$400(Lcom/motorola/otalib/main/Downloader/ConfigDownloader;Z)V

    return-void
.end method
