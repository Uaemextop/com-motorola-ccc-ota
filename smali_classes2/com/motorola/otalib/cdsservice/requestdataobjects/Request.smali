.class public Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;
.super Ljava/lang/Object;
.source "Request.java"


# instance fields
.field private mContentTimestamp:J

.field private mDeviceInfo:Lorg/json/JSONObject;

.field private mExtraInfo:Lorg/json/JSONObject;

.field private mId:Ljava/lang/String;

.field private mIdentityInfo:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mId:Ljava/lang/String;

    iput-wide p2, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mContentTimestamp:J

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mDeviceInfo:Lorg/json/JSONObject;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mExtraInfo:Lorg/json/JSONObject;

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mIdentityInfo:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public getContentTimestamp()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mContentTimestamp:J

    return-wide v0
.end method

.method public getDeviceInfo()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mDeviceInfo:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getExtraInfo()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mExtraInfo:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mId:Ljava/lang/String;

    return-object p0
.end method

.method public getIdentityInfo()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;->mIdentityInfo:Lorg/json/JSONObject;

    return-object p0
.end method
