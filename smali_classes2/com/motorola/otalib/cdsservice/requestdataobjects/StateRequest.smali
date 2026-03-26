.class public Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;
.super Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;
.source "StateRequest.java"


# instance fields
.field private mIdType:Ljava/lang/String;

.field private mInfo:Ljava/lang/String;

.field private mLogs:Ljava/lang/String;

.field private mReportingTags:Ljava/lang/String;

.field private mStats:Lorg/json/JSONObject;

.field private mStatus:Ljava/lang/String;

.field private mUpgradeSource:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mInfo:Ljava/lang/String;

    iput-object p8, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mLogs:Ljava/lang/String;

    iput-object p9, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mIdType:Ljava/lang/String;

    iput-object p10, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mStatus:Ljava/lang/String;

    iput-object p11, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mReportingTags:Ljava/lang/String;

    iput-object p12, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mUpgradeSource:Ljava/lang/String;

    iput-object p13, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mStats:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public getIdType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mIdType:Ljava/lang/String;

    return-object p0
.end method

.method public getInfo()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mInfo:Ljava/lang/String;

    return-object p0
.end method

.method public getLogs()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mLogs:Ljava/lang/String;

    return-object p0
.end method

.method public getReportingTags()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mReportingTags:Ljava/lang/String;

    return-object p0
.end method

.method public getStats()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mStats:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mStatus:Ljava/lang/String;

    return-object p0
.end method

.method public getUpgradeSource()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;->mUpgradeSource:Ljava/lang/String;

    return-object p0
.end method
