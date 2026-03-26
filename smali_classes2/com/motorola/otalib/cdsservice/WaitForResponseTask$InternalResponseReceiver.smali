.class public Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;
.super Ljava/lang/Object;
.source "WaitForResponseTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/cdsservice/WaitForResponseTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InternalResponseReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/cdsservice/WaitForResponseTask;

.field private volleyResponse:Lorg/json/JSONObject;

.field waitObject:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->this$0:Lcom/motorola/otalib/cdsservice/WaitForResponseTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->waitObject:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->volleyResponse:Lorg/json/JSONObject;

    return-void
.end method

.method static synthetic access$000(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->volleyResponse:Lorg/json/JSONObject;

    return-object p0
.end method

.method static synthetic access$002(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->volleyResponse:Lorg/json/JSONObject;

    return-object p1
.end method


# virtual methods
.method public executeRequestUsingVolley(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .locals 9
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
            ">;)V"
        }
    .end annotation

    new-instance p4, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;

    new-instance v5, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;

    invoke-direct {v5, p0}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$1;-><init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;)V

    new-instance v6, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;

    invoke-direct {v6, p0, p1}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$2;-><init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;Landroid/content/Context;)V

    const/4 v2, 0x1

    move-object v0, p4

    move-object v1, p0

    move-object v3, p2

    move-object v4, p3

    move-object v7, p6

    move-object v8, p5

    invoke-direct/range {v0 .. v8}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;-><init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/util/Map;Ljava/util/Map;)V

    new-instance p1, Lcom/android/volley/DefaultRetryPolicy;

    const/high16 p2, 0x3f800000    # 1.0f

    const p3, 0xea60

    const/4 p5, 0x0

    invoke-direct {p1, p3, p5, p2}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {p4, p1}, Lcom/android/volley/toolbox/JsonObjectRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    invoke-virtual {p4, p5}, Lcom/android/volley/toolbox/JsonObjectRequest;->setShouldCache(Z)Lcom/android/volley/Request;

    const-string p1, "OTA"

    invoke-virtual {p4, p1}, Lcom/android/volley/toolbox/JsonObjectRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->this$0:Lcom/motorola/otalib/cdsservice/WaitForResponseTask;

    invoke-static {p0}, Lcom/motorola/otalib/cdsservice/WaitForResponseTask;->access$100(Lcom/motorola/otalib/cdsservice/WaitForResponseTask;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    invoke-virtual {p0, p4}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    return-void
.end method

.method public getResponse()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;->volleyResponse:Lorg/json/JSONObject;

    return-object p0
.end method
