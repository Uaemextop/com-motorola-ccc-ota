.class public Lcom/google/android/gms/internal/fe;
.super Lcom/google/android/gms/internal/gg;

# interfaces
.implements Lcom/google/android/gms/internal/gw$a;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/fe$a;
    }
.end annotation


# instance fields
.field private final lq:Lcom/google/android/gms/internal/ct;

.field private final mContext:Landroid/content/Context;

.field private final md:Lcom/google/android/gms/internal/gv;

.field private final mw:Ljava/lang/Object;

.field private pR:Lcom/google/android/gms/internal/cm;

.field private final sV:Ljava/lang/Object;

.field private sZ:Lcom/google/android/gms/internal/fk;

.field private final tm:Lcom/google/android/gms/internal/fd$a;

.field private final tn:Lcom/google/android/gms/internal/fz$a;

.field private to:Z

.field private tp:Lcom/google/android/gms/internal/ck;

.field private tq:Lcom/google/android/gms/internal/cq;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/fz$a;Lcom/google/android/gms/internal/gv;Lcom/google/android/gms/internal/ct;Lcom/google/android/gms/internal/fd$a;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/gg;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/fe;->sV:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/fe;->mw:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/fe;->to:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/fe;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/fe;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object p1, p2, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iput-object p1, p0, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iput-object p3, p0, Lcom/google/android/gms/internal/fe;->md:Lcom/google/android/gms/internal/gv;

    iput-object p4, p0, Lcom/google/android/gms/internal/fe;->lq:Lcom/google/android/gms/internal/ct;

    iput-object p5, p0, Lcom/google/android/gms/internal/fe;->tm:Lcom/google/android/gms/internal/fd$a;

    iget-object p1, p2, Lcom/google/android/gms/internal/fz$a;->vq:Lcom/google/android/gms/internal/cm;

    iput-object p1, p0, Lcom/google/android/gms/internal/fe;->pR:Lcom/google/android/gms/internal/cm;

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/fe;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->mw:Ljava/lang/Object;

    return-object p0
.end method

.method private a(Lcom/google/android/gms/internal/fi;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fe$a;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/fe;->sV:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/google/android/gms/internal/ck;

    iget-object v2, p0, Lcom/google/android/gms/internal/fe;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gms/internal/fe;->lq:Lcom/google/android/gms/internal/ct;

    iget-object v4, p0, Lcom/google/android/gms/internal/fe;->pR:Lcom/google/android/gms/internal/cm;

    invoke-direct {v1, v2, p1, v3, v4}, Lcom/google/android/gms/internal/ck;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/ct;Lcom/google/android/gms/internal/cm;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/fe;->tp:Lcom/google/android/gms/internal/ck;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/32 v2, 0xea60

    invoke-virtual {v1, p2, p3, v2, v3}, Lcom/google/android/gms/internal/ck;->a(JJ)Lcom/google/android/gms/internal/cq;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/fe;->tq:Lcom/google/android/gms/internal/cq;

    iget p1, p1, Lcom/google/android/gms/internal/cq;->qx:I

    if-eqz p1, :cond_1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_0

    new-instance p1, Lcom/google/android/gms/internal/fe$a;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Unexpected mediation result: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->tq:Lcom/google/android/gms/internal/cq;

    iget p0, p0, Lcom/google/android/gms/internal/cq;->qx:I

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/internal/fe$a;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/fe$a;

    const-string p1, "No fill from any mediation ad networks."

    const/4 p2, 0x3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe$a;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method static synthetic b(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fd$a;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->tm:Lcom/google/android/gms/internal/fd$a;

    return-object p0
.end method

.method static synthetic c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    return-object p0
.end method

.method private c(J)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fe$a;
        }
    .end annotation

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long/2addr v0, p1

    const-wide/32 p1, 0xea60

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->mw:Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    new-instance p0, Lcom/google/android/gms/internal/fe$a;

    const-string p1, "Ad request cancelled."

    const/4 p2, -0x1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe$a;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method static synthetic d(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/gv;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->md:Lcom/google/android/gms/internal/gv;

    return-object p0
.end method

.method private f(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fe$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/fe$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/fe$3;-><init>(Lcom/google/android/gms/internal/fe;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe;->h(J)V

    return-void
.end method

.method private h(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fe$a;
        }
    .end annotation

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe;->c(J)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/fe;->to:Z

    if-eqz v0, :cond_0

    return-void

    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/fe$a;

    const-string p1, "Timed out waiting for WebView to finish loading."

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe$a;-><init>(Ljava/lang/String;I)V

    throw p0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/gv;)V
    .locals 1

    iget-object p1, p0, Lcom/google/android/gms/internal/fe;->mw:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    const-string v0, "WebView finished loading."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/fe;->to:Z

    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->mw:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public co()V
    .locals 35

    move-object/from16 v1, p0

    iget-object v2, v1, Lcom/google/android/gms/internal/fe;->mw:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    const-string v0, "AdRendererBackgroundTask started."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/google/android/gms/internal/fe;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v3, v0, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v0, v1, Lcom/google/android/gms/internal/fe;->tn:Lcom/google/android/gms/internal/fz$a;

    iget v0, v0, Lcom/google/android/gms/internal/fz$a;->errorCode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-boolean v6, v6, Lcom/google/android/gms/internal/fk;->tI:Z

    if-eqz v6, :cond_0

    invoke-direct {v1, v3, v4, v5}, Lcom/google/android/gms/internal/fe;->a(Lcom/google/android/gms/internal/fi;J)V

    goto :goto_0

    :cond_0
    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-boolean v6, v6, Lcom/google/android/gms/internal/fk;->tO:Z

    if-eqz v6, :cond_1

    invoke-virtual {v1, v4, v5}, Lcom/google/android/gms/internal/fe;->g(J)V

    goto :goto_0

    :cond_1
    invoke-direct {v1, v4, v5}, Lcom/google/android/gms/internal/fe;->f(J)V
    :try_end_1
    .catch Lcom/google/android/gms/internal/fe$a; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    move v10, v0

    goto :goto_5

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/fe$a;->getErrorCode()I

    move-result v4

    const/4 v5, 0x3

    if-eq v4, v5, :cond_3

    const/4 v5, -0x1

    if-ne v4, v5, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/fe$a;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    :goto_1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/fe$a;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    :goto_2
    iget-object v0, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    if-nez v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/fk;

    invoke-direct {v0, v4}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    :goto_3
    iput-object v0, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    goto :goto_4

    :cond_4
    new-instance v0, Lcom/google/android/gms/internal/fk;

    iget-object v5, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-wide v5, v5, Lcom/google/android/gms/internal/fk;->qj:J

    invoke-direct {v0, v4, v5, v6}, Lcom/google/android/gms/internal/fk;-><init>(IJ)V

    goto :goto_3

    :goto_4
    sget-object v0, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v5, Lcom/google/android/gms/internal/fe$1;

    invoke-direct {v5, v1}, Lcom/google/android/gms/internal/fe$1;-><init>(Lcom/google/android/gms/internal/fe;)V

    invoke-virtual {v0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move v10, v4

    :goto_5
    new-instance v0, Lcom/google/android/gms/internal/fz;

    iget-object v7, v3, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object v8, v1, Lcom/google/android/gms/internal/fe;->md:Lcom/google/android/gms/internal/gv;

    iget-object v4, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v9, v4, Lcom/google/android/gms/internal/fk;->qf:Ljava/util/List;

    iget-object v4, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v11, v4, Lcom/google/android/gms/internal/fk;->qg:Ljava/util/List;

    iget-object v4, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v12, v4, Lcom/google/android/gms/internal/fk;->tK:Ljava/util/List;

    iget-object v4, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget v13, v4, Lcom/google/android/gms/internal/fk;->orientation:I

    iget-object v4, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-wide v14, v4, Lcom/google/android/gms/internal/fk;->qj:J

    iget-object v3, v3, Lcom/google/android/gms/internal/fi;->tA:Ljava/lang/String;

    iget-object v4, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-boolean v4, v4, Lcom/google/android/gms/internal/fk;->tI:Z

    iget-object v5, v1, Lcom/google/android/gms/internal/fe;->tq:Lcom/google/android/gms/internal/cq;

    if-eqz v5, :cond_5

    iget-object v5, v5, Lcom/google/android/gms/internal/cq;->qy:Lcom/google/android/gms/internal/cl;

    move-object/from16 v18, v5

    goto :goto_6

    :cond_5
    const/16 v18, 0x0

    :goto_6
    iget-object v5, v1, Lcom/google/android/gms/internal/fe;->tq:Lcom/google/android/gms/internal/cq;

    if-eqz v5, :cond_6

    iget-object v5, v5, Lcom/google/android/gms/internal/cq;->qz:Lcom/google/android/gms/internal/cu;

    move-object/from16 v19, v5

    goto :goto_7

    :cond_6
    const/16 v19, 0x0

    :goto_7
    iget-object v5, v1, Lcom/google/android/gms/internal/fe;->tq:Lcom/google/android/gms/internal/cq;

    if-eqz v5, :cond_7

    iget-object v5, v5, Lcom/google/android/gms/internal/cq;->qA:Ljava/lang/String;

    goto :goto_8

    :cond_7
    const-class v5, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    :goto_8
    move-object/from16 v20, v5

    iget-object v5, v1, Lcom/google/android/gms/internal/fe;->pR:Lcom/google/android/gms/internal/cm;

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->tq:Lcom/google/android/gms/internal/cq;

    if-eqz v6, :cond_8

    iget-object v6, v6, Lcom/google/android/gms/internal/cq;->qB:Lcom/google/android/gms/internal/co;

    move-object/from16 v22, v6

    goto :goto_9

    :cond_8
    const/16 v22, 0x0

    :goto_9
    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    move/from16 v17, v4

    move-object/from16 v21, v5

    iget-wide v4, v6, Lcom/google/android/gms/internal/fk;->tJ:J

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v6, v6, Lcom/google/android/gms/internal/fz$a;->lH:Lcom/google/android/gms/internal/ay;

    move-object/from16 v16, v6

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    move-wide/from16 v23, v4

    iget-wide v4, v6, Lcom/google/android/gms/internal/fk;->tH:J

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->tn:Lcom/google/android/gms/internal/fz$a;

    move-wide/from16 v26, v4

    iget-wide v4, v6, Lcom/google/android/gms/internal/fz$a;->vs:J

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    move-wide/from16 v28, v4

    iget-wide v4, v6, Lcom/google/android/gms/internal/fk;->tM:J

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v6, v6, Lcom/google/android/gms/internal/fk;->tN:Ljava/lang/String;

    move-object/from16 v25, v6

    iget-object v6, v1, Lcom/google/android/gms/internal/fe;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v6, v6, Lcom/google/android/gms/internal/fz$a;->vp:Lorg/json/JSONObject;

    const/16 v34, 0x0

    move-object/from16 v33, v6

    move-object/from16 v32, v25

    move-object/from16 v25, v16

    move-object v6, v0

    move-object/from16 v16, v3

    move-wide/from16 v30, v4

    invoke-direct/range {v6 .. v34}, Lcom/google/android/gms/internal/fz;-><init>(Lcom/google/android/gms/internal/av;Lcom/google/android/gms/internal/gv;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/cu;Ljava/lang/String;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/co;JLcom/google/android/gms/internal/ay;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/internal/bq$a;)V

    sget-object v3, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/fe$2;

    invoke-direct {v4, v1, v0}, Lcom/google/android/gms/internal/fe$2;-><init>(Lcom/google/android/gms/internal/fe;Lcom/google/android/gms/internal/fz;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method protected g(J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fe$a;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/fe;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->Y()Lcom/google/android/gms/internal/ay;

    move-result-object v0

    iget-boolean v1, v0, Lcom/google/android/gms/internal/ay;->og:Z

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/fe;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v1, p0, Lcom/google/android/gms/internal/fe;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_0

    :cond_0
    iget v1, v0, Lcom/google/android/gms/internal/ay;->widthPixels:I

    iget v0, v0, Lcom/google/android/gms/internal/ay;->heightPixels:I

    move v4, v1

    move v1, v0

    move v0, v4

    :goto_0
    new-instance v2, Lcom/google/android/gms/internal/fc;

    iget-object v3, p0, Lcom/google/android/gms/internal/fe;->md:Lcom/google/android/gms/internal/gv;

    invoke-direct {v2, p0, v3, v0, v1}, Lcom/google/android/gms/internal/fc;-><init>(Lcom/google/android/gms/internal/gw$a;Lcom/google/android/gms/internal/gv;II)V

    sget-object v0, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/fe$4;

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/internal/fe$4;-><init>(Lcom/google/android/gms/internal/fe;Lcom/google/android/gms/internal/fc;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe;->h(J)V

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fc;->cA()Z

    move-result p0

    if-nez p0, :cond_2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fc;->cB()Z

    move-result p0

    if-eqz p0, :cond_1

    return-void

    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/fe$a;

    const-string p1, "AdNetwork timed out"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe$a;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_2
    const-string p0, "Ad-Network indicated no fill with passback URL."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/internal/fe$a;

    const-string p1, "AdNetwork sent passback url"

    const/4 p2, 0x3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fe$a;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public onStop()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/fe;->sV:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/fe;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gv;->stopLoading()V

    iget-object v1, p0, Lcom/google/android/gms/internal/fe;->md:Lcom/google/android/gms/internal/gv;

    invoke-static {v1}, Lcom/google/android/gms/internal/gj;->a(Landroid/webkit/WebView;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/fe;->tp:Lcom/google/android/gms/internal/ck;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ck;->cancel()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
