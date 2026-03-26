.class Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;
.super Ljava/lang/Object;
.source "WaitForResponseTask.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->executeRequestUsingVolley(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 5

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "success response : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "statusCode"

    const/16 v4, 0xc8

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "payload"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "headers"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$002(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-static {v1, v0}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->access$002(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "error while constructing success response "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    iget-object p1, p1, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->waitObject:Ljava/lang/Object;

    monitor-enter p1

    :try_start_1
    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

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
