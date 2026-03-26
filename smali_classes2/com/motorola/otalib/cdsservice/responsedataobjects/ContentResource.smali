.class public Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;
.super Ljava/lang/Object;
.source "ContentResource.java"


# instance fields
.field private headers:Lorg/json/JSONObject;

.field private tags:[Ljava/lang/String;

.field private url:Ljava/lang/String;

.field private urlTtlSeconds:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDownloadURL()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->url:Ljava/lang/String;

    return-object p0
.end method

.method public getHeaders()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->headers:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getTags()[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->tags:[Ljava/lang/String;

    return-object p0
.end method

.method public getURLTtlSeconds()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResource;->urlTtlSeconds:Ljava/lang/String;

    return-object p0
.end method
