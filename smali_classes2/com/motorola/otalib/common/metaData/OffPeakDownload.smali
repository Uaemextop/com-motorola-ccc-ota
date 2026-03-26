.class public Lcom/motorola/otalib/common/metaData/OffPeakDownload;
.super Ljava/lang/Object;
.source "OffPeakDownload.java"


# instance fields
.field private duration:I

.field private promotionTime:I

.field private startTime:I

.field private useLocalTz:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->useLocalTz:Ljava/lang/String;

    iput p2, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->promotionTime:I

    iput p3, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->startTime:I

    iput p4, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->duration:I

    return-void
.end method


# virtual methods
.method public getDuration()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->duration:I

    return p0
.end method

.method public getPromotionTime()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->promotionTime:I

    return p0
.end method

.method public getStartTime()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->startTime:I

    return p0
.end method

.method public isUseLocalTz()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->useLocalTz:Ljava/lang/String;

    return-object p0
.end method
