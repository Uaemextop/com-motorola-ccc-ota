.class Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;
.super Ljava/lang/Object;
.source "WaitForResponseTask.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->executeRequestUsingVolley(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 4

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "failure response with status code :"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$002(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-static {v0}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$000(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "statusCode"

    iget-object v3, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget v3, v3, Lcom/android/volley/NetworkResponse;->statusCode:I

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-static {v0}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$000(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "headers"

    iget-object p1, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget-object p1, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/HashMapBuilder;->toJSONObject(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->val$ctx:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "NoConnectionError"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$000(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "statusCode"

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$000(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "statusCode"

    const/16 v2, 0x3e8

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :goto_0
    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$000(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "headers"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_1
    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$000(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "payload"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "error while constructing failure response "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    iget-object p1, p1, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->waitObject:Ljava/lang/Object;

    monitor-enter p1

    :try_start_1
    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->waitObject:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
