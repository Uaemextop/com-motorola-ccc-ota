.class Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;
.super Ljava/lang/Object;
.source "WebService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/cdsservice/WebService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalRequest"
.end annotation


# instance fields
.field public request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

.field public requestQueue:Lcom/android/volley/RequestQueue;

.field public responeHandler:Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

.field public retryHandler:Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

.field public startId:I

.field final synthetic this$0:Lcom/motorola/otalib/cdsservice/WebService;


# direct methods
.method public constructor <init>(Lcom/motorola/otalib/cdsservice/WebService;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;I)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->responeHandler:Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

    iput p4, p0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->startId:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->requestQueue:Lcom/android/volley/RequestQueue;

    return-void
.end method

.method public constructor <init>(Lcom/motorola/otalib/cdsservice/WebService;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p5}, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;-><init>(Lcom/motorola/otalib/cdsservice/WebService;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;I)V

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->retryHandler:Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    return-void
.end method
