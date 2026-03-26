.class public Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;
.super Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;
.source "ResourcesRequest.java"


# instance fields
.field private mIdType:Ljava/lang/String;

.field private mReason:Ljava/lang/String;

.field private mReportingTags:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;->mIdType:Ljava/lang/String;

    iput-object p8, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;->mReportingTags:Ljava/lang/String;

    iput-object p9, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;->mReason:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getIdType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;->mIdType:Ljava/lang/String;

    return-object p0
.end method

.method public getReason()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;->mReason:Ljava/lang/String;

    return-object p0
.end method

.method public getReportingTags()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/ResourcesRequest;->mReportingTags:Ljava/lang/String;

    return-object p0
.end method
