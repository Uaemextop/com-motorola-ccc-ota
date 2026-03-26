.class public Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;
.super Ljava/lang/Object;
.source "WebRequest.java"


# instance fields
.field private mHttpMethod:Ljava/lang/String;

.field private mPayload:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

.field private mProxyHost:Ljava/lang/String;

.field private mProxyPort:I

.field private mQueryParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mRetries:I

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mUrl:Ljava/lang/String;

    iput p2, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mRetries:I

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mHttpMethod:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mQueryParams:Ljava/util/Map;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mPayload:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mProxyHost:Ljava/lang/String;

    iput p7, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mProxyPort:I

    return-void
.end method


# virtual methods
.method public getHttpMethod()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mHttpMethod:Ljava/lang/String;

    return-object p0
.end method

.method public getPayload()Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mPayload:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    return-object p0
.end method

.method public getProxyHost()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mProxyHost:Ljava/lang/String;

    return-object p0
.end method

.method public getProxyPort()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mProxyPort:I

    return p0
.end method

.method public getQueryParams()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mQueryParams:Ljava/util/Map;

    return-object p0
.end method

.method public getRetries()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mRetries:I

    return p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->mUrl:Ljava/lang/String;

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
