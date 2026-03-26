.class Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;
.super Lcom/android/volley/toolbox/JsonObjectRequest;
.source "WaitForResponseTask.java"


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

.field final synthetic val$headers:Ljava/util/Map;

.field final synthetic val$queryParams:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/util/Map;Ljava/util/Map;)V
    .locals 6

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;->this$1:Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver;

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;->val$headers:Ljava/util/Map;

    iput-object p8, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;->val$queryParams:Ljava/util/Map;

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    return-void
.end method


# virtual methods
.method public getHeaders()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;->val$headers:Ljava/util/Map;

    return-object p0
.end method

.method public getParams()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/WaitForResponseTask$InternalResponseReceiver$3;->val$queryParams:Ljava/util/Map;

    return-object p0
.end method
