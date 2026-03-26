.class public Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;
.super Ljava/lang/Object;
.source "DownloadRequestToUE.java"


# instance fields
.field private mDownloadUrl:Ljava/lang/String;

.field private mFileSize:J

.field private mHeaderKeyValuePair:[Ljava/lang/String;

.field private mOffSet:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JJ[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mDownloadUrl:Ljava/lang/String;

    iput-wide p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mOffSet:J

    iput-wide p4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mFileSize:J

    iput-object p6, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mHeaderKeyValuePair:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDownloadUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mDownloadUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getFileSize()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mFileSize:J

    return-wide v0
.end method

.method public getHeaderKeyValuePair()[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mHeaderKeyValuePair:[Ljava/lang/String;

    return-object p0
.end method

.method public getOffSet()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->mOffSet:J

    return-wide v0
.end method
