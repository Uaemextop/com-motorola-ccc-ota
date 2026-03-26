.class public Lcom/motorola/otalib/cdsservice/WebService;
.super Landroid/app/Service;
.source "WebService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;,
        Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;,
        Lcom/motorola/otalib/cdsservice/WebService$WHAT;
    }
.end annotation


# static fields
.field private static final REQ_FIELDNAME:Ljava/lang/String; = "REQ"

.field private static final RESPONSE_HANDLER_FIELDNAME:Ljava/lang/String; = "RESP_HANDLER"

.field private static final RETRY_HANDLER_FIELDNAME:Ljava/lang/String; = "RETRY_HANDLER"


# instance fields
.field private randomNumber:Ljava/util/Random;

.field private requestResponseMapping:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;",
            ">;"
        }
    .end annotation
.end field

.field private serviceHandler:Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;

.field private serviceLooper:Landroid/os/Looper;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/motorola/otalib/cdsservice/WebService;)Ljava/util/Random;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebService;->randomNumber:Ljava/util/Random;

    return-object p0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/cdsservice/WebService;Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;Landroid/content/Context;)Lcom/android/volley/RequestQueue;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/motorola/otalib/cdsservice/WebService;->createRequestQueue(Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/motorola/otalib/cdsservice/WebService;)Landroid/util/SparseArray;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebService;->requestResponseMapping:Landroid/util/SparseArray;

    return-object p0
.end method

.method public static call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;",
            "Lcom/motorola/otalib/cdsservice/ResponseHandler;",
            "Lcom/motorola/otalib/cdsservice/RetryHandler;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    :try_start_0
    new-instance p4, Landroid/content/Intent;

    const-class v0, Lcom/motorola/otalib/cdsservice/WebService;

    invoke-direct {p4, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "REQ"

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/builders/WebRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "RESP_HANDLER"

    new-instance v0, Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

    invoke-direct {v0, p2}, Lcom/motorola/otalib/cdsservice/InternalResponseHandler;-><init>(Lcom/motorola/otalib/cdsservice/ResponseHandler;)V

    invoke-virtual {p4, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "RETRY_HANDLER"

    if-eqz p3, :cond_0

    new-instance p2, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    invoke-direct {p2, p3}, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;-><init>(Lcom/motorola/otalib/cdsservice/RetryHandler;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p4, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0, p4}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Caught json exception while sending request to WebService"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public static call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;",
            "Lcom/motorola/otalib/cdsservice/ResponseHandler;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    if-nez p3, :cond_0

    const-class p3, Lcom/motorola/otalib/cdsservice/WebService;

    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V

    return-void
.end method

.method private constructProxy(Ljava/lang/String;I)Ljava/net/Proxy;
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    if-lez p2, :cond_0

    :try_start_0
    new-instance p0, Ljava/net/Proxy;

    sget-object v0, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-static {p1, p2}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, " Exception while constructing the proxy from webrequest: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private createRequestQueue(Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;Landroid/content/Context;)Lcom/android/volley/RequestQueue;
    .locals 1

    iget-object v0, p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-virtual {v0}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getProxyPort()I

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/motorola/otalib/cdsservice/WebService;->constructProxy(Ljava/lang/String;I)Ljava/net/Proxy;

    move-result-object p0

    if-eqz p0, :cond_0

    new-instance p1, Lcom/motorola/otalib/cdsservice/utils/CDSHurlStack;

    invoke-direct {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSHurlStack;-><init>(Ljava/net/Proxy;)V

    invoke-static {p2, p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/BaseHttpStack;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    :goto_0
    return-object p0
.end method


# virtual methods
.method declared-synchronized appendWebRequest(Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string v1, "appending web service request to serviceHandler"

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceHandler:Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;

    invoke-virtual {v0}, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->CDS_WEB_SERVICE_REQUEST:Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    invoke-virtual {v1}, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->ordinal()I

    move-result v1

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceHandler:Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized appendWebResponse(Ljava/lang/Integer;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string v1, "appending web service response to serviceHandler"

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceHandler:Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;

    invoke-virtual {v0}, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->CDS_WEB_SERVICE_RESPONSE_RECEIVED:Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    invoke-virtual {v1}, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->ordinal()I

    move-result v1

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceHandler:Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()V
    .locals 2

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string v1, "Starting webservice android service"

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService;->randomNumber:Ljava/util/Random;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService;->requestResponseMapping:Landroid/util/SparseArray;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "WebService.ServiceHandlerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceLooper:Landroid/os/Looper;

    new-instance v0, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceLooper:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;-><init>(Lcom/motorola/otalib/cdsservice/WebService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceHandler:Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string v1, "Stopping webservice android service"

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebService;->serviceLooper:Landroid/os/Looper;

    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6

    const-string p2, "REQ"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/otalib/cdsservice/webdataobjects/builders/WebRequestBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    move-result-object v2

    const-string p2, "RESP_HANDLER"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

    const-string p2, "RETRY_HANDLER"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Received web service call for request :"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;

    move-object v0, p1

    move-object v1, p0

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;-><init>(Lcom/motorola/otalib/cdsservice/WebService;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;I)V

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/cdsservice/WebService;->appendWebRequest(Lcom/motorola/otalib/cdsservice/WebService$InternalRequest;)V

    const/4 p0, 0x2

    return p0
.end method
