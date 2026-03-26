.class public Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;
.super Ljava/lang/Object;
.source "WebResponse.java"


# instance fields
.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPayload:Lorg/json/JSONObject;

.field private mStatusCode:I


# direct methods
.method public constructor <init>(ILorg/json/JSONObject;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/json/JSONObject;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->mStatusCode:I

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->mPayload:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->mHeaders:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getHeaders()Ljava/util/Map;
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

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->mHeaders:Ljava/util/Map;

    return-object p0
.end method

.method public getPayload()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->mPayload:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getStatusCode()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->mStatusCode:I

    return p0
.end method
