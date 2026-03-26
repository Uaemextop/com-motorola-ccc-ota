.class Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;
.super Landroid/os/Handler;
.source "WebService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/cdsservice/WebService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ServiceHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/cdsservice/WebService;


# direct methods
.method public constructor <init>(Lcom/motorola/otalib/cdsservice/WebService;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10

    sget-object v0, Lcom/motorola/otalib/cdsservice/WebService$1;->$SwitchMap$com$motorola$otalib$cdsservice$WebService$WHAT:[I

    invoke-static {}, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->values()[Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-static {v0}, Lcom/motorola/otalib/cdsservice/WebService;->access$200(Lcom/motorola/otalib/cdsservice/WebService;)Landroid/util/SparseArray;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Removing request :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-virtual {v3}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " from queue "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-static {v1}, Lcom/motorola/otalib/cdsservice/WebService;->access$200(Lcom/motorola/otalib/cdsservice/WebService;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    iget-object p1, v0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->requestQueue:Lcom/android/volley/RequestQueue;

    if-eqz p1, :cond_1

    const-string v1, "OTA"

    invoke-virtual {p1, v1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    sget-object v1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string v2, "Canceling all requests from request queue"

    invoke-static {v1, v2}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/volley/RequestQueue;->stop()V

    :cond_1
    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/WebService;->access$200(Lcom/motorola/otalib/cdsservice/WebService;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    if-nez p1, :cond_3

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    iget p1, v0, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->startId:I

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/cdsservice/WebService;->stopSelf(I)V

    goto :goto_0

    :cond_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-static {v0}, Lcom/motorola/otalib/cdsservice/WebService;->access$000(Lcom/motorola/otalib/cdsservice/WebService;)Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-static {v1, p1, v1}, Lcom/motorola/otalib/cdsservice/WebService;->access$100(Lcom/motorola/otalib/cdsservice/WebService;Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v1

    iput-object v1, p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->requestQueue:Lcom/android/volley/RequestQueue;

    new-instance v9, Lcom/motorola/otalib/cdsservice/WebServiceThread;

    iget-object v2, p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    iget-object v3, p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->responeHandler:Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

    iget-object v4, p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->retryHandler:Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    iget-object v5, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    iget-object v8, p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->requestQueue:Lcom/android/volley/RequestQueue;

    move-object v1, v9

    move-object v6, v0

    move-object v7, p0

    invoke-direct/range {v1 .. v8}, Lcom/motorola/otalib/cdsservice/WebServiceThread;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;Lcom/motorola/otalib/cdsservice/WebService;Ljava/lang/Integer;Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;Lcom/android/volley/RequestQueue;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->this$0:Lcom/motorola/otalib/cdsservice/WebService;

    invoke-static {p0}, Lcom/motorola/otalib/cdsservice/WebService;->access$200(Lcom/motorola/otalib/cdsservice/WebService;)Landroid/util/SparseArray;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-virtual {v9}, Lcom/motorola/otalib/cdsservice/WebServiceThread;->start()V

    :cond_3
    :goto_0
    return-void
.end method
