.class public Lcom/google/android/gms/internal/fo;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/fo$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/google/android/gms/internal/fz;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mw:Ljava/lang/Object;

.field private final pw:Lcom/google/android/gms/internal/u;

.field private final tX:Lcom/google/android/gms/internal/go;

.field private final tY:Lcom/google/android/gms/internal/ai;

.field private tZ:Z

.field private tc:I

.field private final tn:Lcom/google/android/gms/internal/fz$a;

.field private ua:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/u;Lcom/google/android/gms/internal/ai;Lcom/google/android/gms/internal/go;Lcom/google/android/gms/internal/fz$a;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/fo;->mw:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/fo;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/fo;->pw:Lcom/google/android/gms/internal/u;

    iput-object p4, p0, Lcom/google/android/gms/internal/fo;->tX:Lcom/google/android/gms/internal/go;

    iput-object p3, p0, Lcom/google/android/gms/internal/fo;->tY:Lcom/google/android/gms/internal/ai;

    iput-object p5, p0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/fo;->tZ:Z

    const/4 p1, -0x2

    iput p1, p0, Lcom/google/android/gms/internal/fo;->tc:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/fo;->ua:Ljava/util/List;

    return-void
.end method

.method private a(Lcom/google/android/gms/internal/ah;Lcom/google/android/gms/internal/fo$a;Lorg/json/JSONObject;)Lcom/google/android/gms/internal/bq$a;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;,
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fo;->cH()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    const-string v0, "tracking_urls_and_actions"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "impression_tracking_urls"

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/internal/fo;->b(Lorg/json/JSONObject;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/fo;->ua:Ljava/util/List;

    invoke-interface {p2, p0, p3}, Lcom/google/android/gms/internal/fo$a;->a(Lcom/google/android/gms/internal/fo;Lorg/json/JSONObject;)Lcom/google/android/gms/internal/bq$a;

    move-result-object p2

    if-nez p2, :cond_2

    const-string p0, "Failed to retrieve ad assets."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->T(Ljava/lang/String;)V

    return-object v1

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/bq;

    iget-object p0, p0, Lcom/google/android/gms/internal/fo;->pw:Lcom/google/android/gms/internal/u;

    invoke-direct {v0, p0, p1, p3}, Lcom/google/android/gms/internal/bq;-><init>(Lcom/google/android/gms/internal/u;Lcom/google/android/gms/internal/ah;Lorg/json/JSONObject;)V

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/bq$a;->a(Lcom/google/android/gms/internal/bq;)V

    return-object p2
.end method

.method private a(Lcom/google/android/gms/internal/bq$a;)Lcom/google/android/gms/internal/fz;
    .locals 33

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/gms/internal/fo;->mw:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v2, v0, Lcom/google/android/gms/internal/fo;->tc:I

    const/4 v3, -0x2

    if-nez p1, :cond_0

    if-ne v2, v3, :cond_0

    const/4 v2, 0x0

    :cond_0
    move v8, v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v8, v3, :cond_1

    const/4 v1, 0x0

    move-object/from16 v32, v1

    goto :goto_0

    :cond_1
    move-object/from16 v32, p1

    :goto_0
    new-instance v1, Lcom/google/android/gms/internal/fz;

    move-object v4, v1

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v5, v2, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object v7, v2, Lcom/google/android/gms/internal/fk;->qf:Ljava/util/List;

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object v9, v2, Lcom/google/android/gms/internal/fk;->qg:Ljava/util/List;

    iget-object v10, v0, Lcom/google/android/gms/internal/fo;->ua:Ljava/util/List;

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget v11, v2, Lcom/google/android/gms/internal/fk;->orientation:I

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-wide v12, v2, Lcom/google/android/gms/internal/fk;->qj:J

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v14, v2, Lcom/google/android/gms/internal/fi;->tA:Ljava/lang/String;

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->lH:Lcom/google/android/gms/internal/ay;

    move-object/from16 v23, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-wide v2, v2, Lcom/google/android/gms/internal/fk;->tH:J

    move-wide/from16 v24, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-wide v2, v2, Lcom/google/android/gms/internal/fz$a;->vs:J

    move-wide/from16 v26, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-wide v2, v2, Lcom/google/android/gms/internal/fz$a;->vt:J

    move-wide/from16 v28, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object v2, v2, Lcom/google/android/gms/internal/fk;->tN:Ljava/lang/String;

    move-object/from16 v30, v2

    iget-object v0, v0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v0, v0, Lcom/google/android/gms/internal/fz$a;->vp:Lorg/json/JSONObject;

    move-object/from16 v31, v0

    const/4 v6, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const-wide/16 v21, 0x0

    invoke-direct/range {v4 .. v32}, Lcom/google/android/gms/internal/fz;-><init>(Lcom/google/android/gms/internal/av;Lcom/google/android/gms/internal/gv;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/cu;Ljava/lang/String;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/co;JLcom/google/android/gms/internal/ay;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/internal/bq$a;)V

    return-object v1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private b(Lorg/json/JSONObject;Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge p2, v0, :cond_1

    invoke-virtual {p0, p2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return-object p1
.end method

.method private c(Lcom/google/android/gms/internal/ah;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;,
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fo;->cH()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/gk;

    invoke-direct {v0}, Lcom/google/android/gms/internal/gk;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/fo$1;

    invoke-direct {v1, p0, p1, v0}, Lcom/google/android/gms/internal/fo$1;-><init>(Lcom/google/android/gms/internal/fo;Lcom/google/android/gms/internal/ah;Lcom/google/android/gms/internal/gk;)V

    const-string v2, "/nativeAdPreProcess"

    invoke-interface {p1, v2, v1}, Lcom/google/android/gms/internal/ah;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    new-instance v1, Lorg/json/JSONObject;

    iget-object p0, p0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object p0, p0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object p0, p0, Lcom/google/android/gms/internal/fk;->tG:Ljava/lang/String;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "google.afma.nativeAds.preProcessJsonGmsg"

    invoke-interface {p1, p0, v1}, Lcom/google/android/gms/internal/ah;->a(Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    return-object p0
.end method

.method private cG()Lcom/google/android/gms/internal/ah;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/CancellationException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fo;->cH()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/fo;->tY:Lcom/google/android/gms/internal/ai;

    iget-object v1, p0, Lcom/google/android/gms/internal/fo;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/fo;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v2, v2, Lcom/google/android/gms/internal/fi;->lD:Lcom/google/android/gms/internal/gt;

    const-string v3, "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/native_ads.html"

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/ai;->a(Landroid/content/Context;Lcom/google/android/gms/internal/gt;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/ah;

    iget-object v7, p0, Lcom/google/android/gms/internal/fo;->pw:Lcom/google/android/gms/internal/u;

    const/4 v6, 0x0

    move-object v1, v0

    move-object v2, v7

    move-object v3, v7

    move-object v4, v7

    move-object v5, v7

    invoke-interface/range {v1 .. v7}, Lcom/google/android/gms/internal/ah;->a(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/bw;Lcom/google/android/gms/internal/dq;ZLcom/google/android/gms/internal/bz;)V

    return-object v0
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;Ljava/lang/String;Z)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/concurrent/Future<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-eqz p3, :cond_0

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_1

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :cond_1
    const-string p2, "url"

    if-eqz p3, :cond_2

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_3

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p3}, Lcom/google/android/gms/internal/fo;->a(IZ)V

    new-instance p0, Lcom/google/android/gms/internal/gl;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gl;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_3
    iget-object p2, p0, Lcom/google/android/gms/internal/fo;->tX:Lcom/google/android/gms/internal/go;

    new-instance v0, Lcom/google/android/gms/internal/fo$2;

    invoke-direct {v0, p0, p3}, Lcom/google/android/gms/internal/fo$2;-><init>(Lcom/google/android/gms/internal/fo;Z)V

    invoke-virtual {p2, p1, v0}, Lcom/google/android/gms/internal/go;->a(Ljava/lang/String;Lcom/google/android/gms/internal/go$a;)Ljava/util/concurrent/Future;

    move-result-object p0

    return-object p0
.end method

.method public a(IZ)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/fo;->s(I)V

    :cond_0
    return-void
.end method

.method protected b(Lorg/json/JSONObject;)Lcom/google/android/gms/internal/fo$a;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fo;->cH()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    const-string v0, "template_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "2"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p0, Lcom/google/android/gms/internal/fp;

    invoke-direct {p0}, Lcom/google/android/gms/internal/fp;-><init>()V

    return-object p0

    :cond_1
    const-string v0, "1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    new-instance p0, Lcom/google/android/gms/internal/fq;

    invoke-direct {p0}, Lcom/google/android/gms/internal/fq;-><init>()V

    return-object p0

    :cond_2
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/fo;->s(I)V

    return-object v1
.end method

.method public cF()Lcom/google/android/gms/internal/fz;
    .locals 3

    :try_start_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/fo;->cG()Lcom/google/android/gms/internal/ah;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/fo;->c(Lcom/google/android/gms/internal/ah;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/fo;->b(Lorg/json/JSONObject;)Lcom/google/android/gms/internal/fo$a;

    move-result-object v2

    invoke-direct {p0, v0, v2, v1}, Lcom/google/android/gms/internal/fo;->a(Lcom/google/android/gms/internal/ah;Lcom/google/android/gms/internal/fo$a;Lorg/json/JSONObject;)Lcom/google/android/gms/internal/bq$a;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/fo;->a(Lcom/google/android/gms/internal/bq$a;)Lcom/google/android/gms/internal/fz;

    move-result-object p0
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    const-string v1, "Timeout when loading native ad."

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "Malformed native JSON response."

    :goto_0
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :catch_2
    iget-boolean v0, p0, Lcom/google/android/gms/internal/fo;->tZ:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/fo;->s(I)V

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/fo;->a(Lcom/google/android/gms/internal/bq$a;)Lcom/google/android/gms/internal/fz;

    move-result-object p0

    return-object p0
.end method

.method public cH()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fo;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean p0, p0, Lcom/google/android/gms/internal/fo;->tZ:Z

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fo;->cF()Lcom/google/android/gms/internal/fz;

    move-result-object p0

    return-object p0
.end method

.method public s(I)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/fo;->mw:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/gms/internal/fo;->tZ:Z

    iput p1, p0, Lcom/google/android/gms/internal/fo;->tc:I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
