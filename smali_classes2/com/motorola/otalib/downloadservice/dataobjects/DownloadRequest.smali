.class public Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;
.super Ljava/lang/Object;
.source "DownloadRequest.java"


# instance fields
.field private allowOnRoaming:Z

.field private contentResource:Ljava/lang/String;

.field private disallowedNetworks:Ljava/lang/String;

.field private fileName:Ljava/lang/String;

.field private hostName:Ljava/lang/String;

.field private mBackOffValues:Ljava/lang/String;

.field private mMaxRetryCount:I

.field private port:I

.field private size:J

.field private startingOffset:J

.field private time:J

.field private upgradeSourceType:Ljava/lang/String;

.field private wifiOnly:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;ZJJLjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IZLjava/lang/String;ZJ)V
    .locals 3

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->contentResource:Ljava/lang/String;

    move v1, p2

    iput-boolean v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->wifiOnly:Z

    move-wide v1, p3

    iput-wide v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->time:J

    move-wide v1, p5

    iput-wide v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->size:J

    move-object v1, p7

    iput-object v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->fileName:Ljava/lang/String;

    move-object v1, p8

    iput-object v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->hostName:Ljava/lang/String;

    move v1, p9

    iput v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->port:I

    move-object v1, p10

    iput-object v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->disallowedNetworks:Ljava/lang/String;

    move-object v1, p11

    iput-object v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->mBackOffValues:Ljava/lang/String;

    move v1, p12

    iput v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->mMaxRetryCount:I

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->upgradeSourceType:Ljava/lang/String;

    move/from16 v1, p15

    iput-boolean v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->allowOnRoaming:Z

    move-wide/from16 v1, p16

    iput-wide v1, v0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->startingOffset:J

    return-void
.end method


# virtual methods
.method public getAllowOnRoaming()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->allowOnRoaming:Z

    return p0
.end method

.method public getBackOffValues()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->mBackOffValues:Ljava/lang/String;

    return-object p0
.end method

.method public getContentResource()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->contentResource:Ljava/lang/String;

    return-object p0
.end method

.method public getDisallowedNetworks()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->disallowedNetworks:Ljava/lang/String;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->fileName:Ljava/lang/String;

    return-object p0
.end method

.method public getHostName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->hostName:Ljava/lang/String;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method public getMaxRetryCount()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->mMaxRetryCount:I

    return p0
.end method

.method public getPort()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->port:I

    return p0
.end method

.method public getSize()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->size:J

    return-wide v0
.end method

.method public getStartingOffset()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->startingOffset:J

    return-wide v0
.end method

.method public getTime()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->time:J

    return-wide v0
.end method

.method public getUpgradeSourceType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->upgradeSourceType:Ljava/lang/String;

    return-object p0
.end method

.method public getWifiOnly()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/downloadservice/dataobjects/DownloadRequest;->wifiOnly:Z

    return p0
.end method
