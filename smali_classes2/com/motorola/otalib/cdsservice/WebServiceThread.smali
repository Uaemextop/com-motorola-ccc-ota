.class Lcom/motorola/otalib/cdsservice/WebServiceThread;
.super Ljava/lang/Thread;
.source "WebServiceThread.java"


# static fields
.field private static final backOffValues:Ljava/lang/String; = "2000,5000,15000,30000,60000,300000,600000,600000,600000"


# instance fields
.field private final backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mRedirectUrl:Ljava/lang/String;

.field private final mRequestQueue:Lcom/android/volley/RequestQueue;

.field private mRetryCount:I

.field private mUrl:Ljava/lang/String;

.field private mVerificationType:Ljava/lang/String;

.field private final request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

.field private final requestExecutor:Ljava/util/concurrent/ExecutorService;

.field private final responseHandler:Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

.field private final retryHandler:Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

.field private final service:Lcom/motorola/otalib/cdsservice/WebService;

.field private final threadToken:Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;Lcom/motorola/otalib/cdsservice/WebService;Ljava/lang/Integer;Lcom/motorola/otalib/cdsservice/WebService$ServiceHandler;Lcom/android/volley/RequestQueue;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    new-instance p6, Ljava/util/HashMap;

    invoke-direct {p6}, Ljava/util/HashMap;-><init>()V

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->headers:Ljava/util/Map;

    const/4 p6, 0x0

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRedirectUrl:Ljava/lang/String;

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->responseHandler:Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->retryHandler:Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->service:Lcom/motorola/otalib/cdsservice/WebService;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->threadToken:Ljava/lang/Integer;

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRequestQueue:Lcom/android/volley/RequestQueue;

    new-instance p1, Lcom/motorola/otalib/cdsservice/WebServiceThread$1;

    invoke-direct {p1, p0}, Lcom/motorola/otalib/cdsservice/WebServiceThread$1;-><init>(Lcom/motorola/otalib/cdsservice/WebServiceThread;)V

    invoke-static {p1}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->requestExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance p1, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;

    const-string p2, "2000,5000,15000,30000,60000,300000,600000,600000,600000"

    invoke-direct {p1, p2}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    return-void
.end method

.method private checkAndInvokeResponseHandler(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;)V
    .locals 0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2, p1}, Lcom/motorola/otalib/cdsservice/InternalResponseHandler;->invokeHandleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V

    :cond_0
    return-void
.end method

.method private checkAndInvokeRetryHandler(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;)Z
    .locals 0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2, p1}, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;->invokeRetryHandler(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private makeWebServiceCallWithVolley(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;)Ljava/util/concurrent/Future;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getPayload()Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;->getData()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->requestExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->service:Lcom/motorola/otalib/cdsservice/WebService;

    iget-object v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getHttpMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getQueryParams()Ljava/util/Map;

    move-result-object v5

    iget-object v6, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->headers:Ljava/util/Map;

    iget-object v7, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRequestQueue:Lcom/android/volley/RequestQueue;

    move-object v0, v9

    invoke-direct/range {v0 .. v7}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/android/volley/RequestQueue;)V

    invoke-interface {v8, v9}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "WebService.call() Request:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " caught json exception"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private shouldRetry(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;)Z
    .locals 5

    const/4 v0, 0x1

    if-nez p1, :cond_0

    sget-object p0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string p1, "strange, response received as null will be retried based on retry count set for the request"

    invoke-static {p0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1

    return v3

    :cond_1
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0x3e8

    if-eq v1, v2, :cond_d

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v1

    if-nez v1, :cond_2

    goto/16 :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0x1f4

    if-lt v1, v2, :cond_3

    const/16 v2, 0x257

    if-gt v1, v2, :cond_3

    sget-object p0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string p1, "5XX series error , request will be backed off and will be retried"

    invoke-static {p0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_3
    const/16 v2, 0x191

    if-ne v1, v2, :cond_7

    if-eqz p2, :cond_4

    invoke-direct {p0, p1, p2}, Lcom/motorola/otalib/cdsservice/WebServiceThread;->checkAndInvokeRetryHandler(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;)Z

    move-result p2

    if-eqz p2, :cond_6

    :cond_4
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getHeaders()Ljava/util/Map;

    move-result-object p2

    if-eqz p2, :cond_6

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getHeaders()Ljava/util/Map;

    move-result-object p1

    const-string p2, "x-moto-accept-verification-methods"

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mVerificationType:Ljava/lang/String;

    if-nez p1, :cond_5

    sget-object p0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string p1, "Unauthorized response with no verification-methods, can\'t proceed further"

    invoke-static {p0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_5
    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "server sent verificationMethod as "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mVerificationType:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    return v3

    :cond_7
    const/16 v2, 0x193

    if-eq v1, v2, :cond_c

    const/16 v2, 0x194

    if-ne v1, v2, :cond_8

    goto :goto_0

    :cond_8
    const/16 v2, 0x12e

    if-eq v1, v2, :cond_9

    const/16 v2, 0x133

    if-ne v1, v2, :cond_a

    :cond_9
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getHeaders()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_a

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getHeaders()Ljava/util/Map;

    move-result-object v2

    const-string v4, "Location"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_a

    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v3, "redirect error ("

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, ")request will be backed off and will be retried with redirected url "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRedirectUrl:Ljava/lang/String;

    return v0

    :cond_a
    invoke-direct {p0, p1, p2}, Lcom/motorola/otalib/cdsservice/WebServiceThread;->checkAndInvokeRetryHandler(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;)Z

    move-result p1

    if-eqz p1, :cond_b

    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "caller wants this request "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " to be retried"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_b
    return v3

    :cond_c
    :goto_0
    sget-object p0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " error , request will be backed off and will be retried"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_d
    :goto_1
    iget-object p2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    const-string v1, "cds/upgrade/1/check"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_10

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-virtual {p0}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getPayload()Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;->getData()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/CheckRequestBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;

    move-result-object p0

    if-nez p0, :cond_e

    return v3

    :cond_e
    invoke-virtual {p0}, Lcom/motorola/otalib/cdsservice/requestdataobjects/CheckRequest;->getTriggerdBy()Ljava/lang/String;

    move-result-object p0

    sget-object p2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_f

    return v3

    :cond_f
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result p1

    if-nez p1, :cond_12

    sget-object p1, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->polling:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    sget-object p0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string p1, "No internet connection, pending polling is set"

    invoke-static {p0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_10
    iget-object p2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    const-string v1, "cds/upgrade/1/state"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_11

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    const-string p2, "cds/upgrade/1/resources"

    invoke-virtual {p0, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_12

    :cond_11
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result p0

    if-nez p0, :cond_12

    sget-object p0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string p1, "No internet connection, retry for state and resource request is not required"

    invoke-static {p0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_12
    return v0
.end method

.method private waitForVolleyResponse(Ljava/util/concurrent/Future;)Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "Lorg/json/JSONObject;",
            ">;)",
            "Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;"
        }
    .end annotation

    const-string v0, "WebService.call() Request:"

    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/builders/WebResponseBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    sget-object v2, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " caught execution exception "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :catch_1
    move-exception p1

    sget-object v2, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " caught interrupted exception "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public run()V
    .locals 7

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRedirectUrl:Ljava/lang/String;

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-virtual {v0}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getUrl()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-direct {p0, v0}, Lcom/motorola/otalib/cdsservice/WebServiceThread;->makeWebServiceCallWithVolley(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/otalib/cdsservice/WebServiceThread;->waitForVolleyResponse(Ljava/util/concurrent/Future;)Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->retryHandler:Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    invoke-direct {p0, v0, v1}, Lcom/motorola/otalib/cdsservice/WebServiceThread;->shouldRetry(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/cdsservice/InternalRetryHandler;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRetryCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRetryCount:I

    iget-object v3, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-virtual {v3}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getRetries()I

    move-result v3

    if-le v2, v3, :cond_2

    sget-object v1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Retry count for this request url "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has been set to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->request:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-virtual {v3}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->getRetries()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " so giving up after "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->mRetryCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " attempts (initial request inclusive)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_2
    if-eqz v1, :cond_5

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getHeaders()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v0}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getHeaders()Ljava/util/Map;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v3, "x-moto-backoff"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gtz v4, :cond_4

    iget-object v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    invoke-interface {v2}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getNextTimeoutValue()J

    move-result-wide v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    :try_start_2
    iget-object v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    invoke-interface {v2}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getNextTimeoutValue()J

    move-result-wide v2

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    invoke-interface {v2}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getNextTimeoutValue()J

    move-result-wide v2

    :cond_4
    :goto_1
    sget-object v4, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Retry handler returned true; Retry web request after backoff time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object v4, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->backOffProvider:Lcom/motorola/otalib/common/backoff/BackoffValueProvider;

    invoke-interface {v4}, Lcom/motorola/otalib/common/backoff/BackoffValueProvider;->getTimeUnit()Ljava/util/concurrent/TimeUnit;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/util/concurrent/TimeUnit;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catch_1
    :cond_5
    if-nez v1, :cond_0

    :try_start_4
    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->responseHandler:Lcom/motorola/otalib/cdsservice/InternalResponseHandler;

    invoke-direct {p0, v0, v1}, Lcom/motorola/otalib/cdsservice/WebServiceThread;->checkAndInvokeResponseHandler(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/cdsservice/InternalResponseHandler;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->service:Lcom/motorola/otalib/cdsservice/WebService;

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->threadToken:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/cdsservice/WebService;->appendWebResponse(Ljava/lang/Integer;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->requestExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->service:Lcom/motorola/otalib/cdsservice/WebService;

    iget-object v2, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->threadToken:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Lcom/motorola/otalib/cdsservice/WebService;->appendWebResponse(Ljava/lang/Integer;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WebServiceThread;->requestExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    throw v0
.end method
