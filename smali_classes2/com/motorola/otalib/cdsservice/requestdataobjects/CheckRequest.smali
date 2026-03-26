.class public Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;
.super Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;
.source "CheckRequest.java"


# instance fields
.field private mIdType:Ljava/lang/String;

.field private mTriggeredBy:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/motorola/otalib/cdsservice/requestdataobjects/Request;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;->mTriggeredBy:Ljava/lang/String;

    iput-object p8, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;->mIdType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getIdType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;->mIdType:Ljava/lang/String;

    return-object p0
.end method

.method public getTriggerdBy()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;->mTriggeredBy:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
