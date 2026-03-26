.class public Lcom/motorola/otalib/cdsservice/WaitForResponseTask;
.super Ljava/lang/Object;
.source "WaitForResponseTask.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mHttpMethod:Ljava/lang/String;

.field private final mQueryParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mRequestBody:Lorg/json/JSONObject;

.field private final mRequestQueue:Lcom/android/volley/RequestQueue;

.field private final mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/android/volley/RequestQueue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/RequestQueue;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mRequestBody:Lorg/json/JSONObject;

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mHttpMethod:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mQueryParams:Ljava/util/Map;

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mHeaders:Ljava/util/Map;

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mRequestQueue:Lcom/android/volley/RequestQueue;

    return-void
.end method

.method static synthetic access$100(Lcom/motorola/otalib/cdsservice/WaitForResponseTask;)Lcom/android/volley/RequestQueue;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mRequestQueue:Lcom/android/volley/RequestQueue;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->call()Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public call()Lorg/json/JSONObject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v8, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    invoke-direct {v8, p0, v0}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;-><init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask;Ljava/lang/Object;)V

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mUrl:Ljava/lang/String;

    iget-object v4, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mRequestBody:Lorg/json/JSONObject;

    iget-object v5, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mHttpMethod:Ljava/lang/String;

    iget-object v6, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mQueryParams:Ljava/util/Map;

    iget-object v7, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->mHeaders:Ljava/util/Map;

    move-object v1, v8

    invoke-virtual/range {v1 .. v7}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->executeRequestUsingVolley(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v8}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->getResponse()Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    move-exception p0

    :try_start_2
    new-instance v1, Ljava/lang/Exception;

    invoke-virtual {p0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method
