.class Lcom/motorola/otalib/cdsservice/WebServiceThread$1;
.super Ljava/lang/Object;
.source "WebServiceThread.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/cdsservice/WebServiceThread;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;Lcom/motorola/otalib/cdsservice/WebService;Ljava/lang/Integer;Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;Lcom/android/volley/RequestQueue;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/cdsservice/WebServiceThread;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/cdsservice/WebServiceThread;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread$1;->this$0:Lcom/motorola/otalib/cdsservice/WebServiceThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 1

    new-instance p0, Ljava/lang/Thread;

    const-string v0, "CDSWebServiceThread.RequestExecutor"

    invoke-direct {p0, p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    return-object p0
.end method
