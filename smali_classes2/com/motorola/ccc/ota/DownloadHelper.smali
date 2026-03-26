.class public final Lcom/motorola/ccc/ota/DownloadHelper;
.super Ljava/lang/Object;
.source "DownloadHelper.java"


# instance fields
.field private final _expected:J

.field private final _file:Ljava/io/File;

.field private final _fileName:Ljava/lang/String;

.field private _percentDownloaded:I

.field private final _version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_version:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_fileName:Ljava/lang/String;

    iput-wide p3, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_expected:J

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_file:Ljava/io/File;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x64

    mul-long/2addr v0, v2

    div-long/2addr v0, p3

    long-to-int p2, v0

    iput p2, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "DownloadHelper(): file size: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " expected size: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " percentage: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public expected()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_expected:J

    return-wide v0
.end method

.method public fileName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_fileName:Ljava/lang/String;

    return-object p0
.end method

.method public get_percentDownloaded()I
    .locals 0

    iget p0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    return p0
.end method

.method public incrementPercentDownloaded()V
    .locals 2

    iget v0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    :cond_0
    return-void
.end method

.method public isDone()Z
    .locals 4

    iget-wide v0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_expected:J

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public left()J
    .locals 4

    iget-wide v0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_expected:J

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_expected:J

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v2

    sub-long/2addr v0, v2

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public notifyProgress()Z
    .locals 10

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v0

    iget v2, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    const/4 v3, 0x1

    if-nez v2, :cond_0

    return v3

    :cond_0
    iget-wide v4, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_expected:J

    sub-int/2addr v2, v3

    int-to-long v6, v2

    mul-long/2addr v6, v4

    const-wide/16 v8, 0x64

    div-long/2addr v6, v8

    cmp-long v2, v0, v6

    if-gez v2, :cond_1

    mul-long v6, v0, v8

    div-long/2addr v6, v4

    long-to-int v2, v6

    iput v2, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    :cond_1
    iget p0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_percentDownloaded:I

    int-to-long v6, p0

    mul-long/2addr v4, v6

    div-long/2addr v4, v8

    cmp-long p0, v0, v4

    if-ltz p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    return v3
.end method

.method public size()J
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_file:Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public version()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/DownloadHelper;->_version:Ljava/lang/String;

    return-object p0
.end method
