.class public Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;
.super Ljava/lang/Object;
.source "WebRequestPayload.java"


# instance fields
.field private data:Ljava/lang/String;

.field private type:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;


# direct methods
.method public constructor <init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;->type:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;->data:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;->data:Ljava/lang/String;

    return-object p0
.end method

.method public getType()Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;->type:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    return-object p0
.end method
