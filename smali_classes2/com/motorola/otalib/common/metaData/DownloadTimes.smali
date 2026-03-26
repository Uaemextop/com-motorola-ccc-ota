.class public Lcom/motorola/otalib/common/metaData/DownloadTimes;
.super Ljava/lang/Object;
.source "DownloadTimes.java"


# instance fields
.field private downloadSlots:[[J

.field private useLocalTz:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[[J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/common/metaData/DownloadTimes;->useLocalTz:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/otalib/common/metaData/DownloadTimes;->downloadSlots:[[J

    return-void
.end method


# virtual methods
.method public getDownloadSlots()[[J
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/DownloadTimes;->downloadSlots:[[J

    return-object p0
.end method

.method public isUseLocalTz()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/DownloadTimes;->useLocalTz:Ljava/lang/String;

    return-object p0
.end method
