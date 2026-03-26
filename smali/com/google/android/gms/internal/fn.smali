.class public Lcom/google/android/gms/internal/fn;
.super Lcom/google/android/gms/internal/gg;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final mw:Ljava/lang/Object;

.field private final sZ:Lcom/google/android/gms/internal/fk;

.field private final tU:Lcom/google/android/gms/internal/fo;

.field private tV:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Lcom/google/android/gms/internal/fz;",
            ">;"
        }
    .end annotation
.end field

.field private final tm:Lcom/google/android/gms/internal/fd$a;

.field private final tn:Lcom/google/android/gms/internal/fz$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/u;Lcom/google/android/gms/internal/ai;Lcom/google/android/gms/internal/fz$a;Lcom/google/android/gms/internal/fd$a;)V
    .locals 7

    new-instance v6, Lcom/google/android/gms/internal/fo;

    new-instance v4, Lcom/google/android/gms/internal/go;

    invoke-direct {v4}, Lcom/google/android/gms/internal/go;-><init>()V

    move-object v0, v6

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/fo;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/u;Lcom/google/android/gms/internal/ai;Lcom/google/android/gms/internal/go;Lcom/google/android/gms/internal/fz$a;)V

    invoke-direct {p0, p4, p5, v6}, Lcom/google/android/gms/internal/fn;-><init>(Lcom/google/android/gms/internal/fz$a;Lcom/google/android/gms/internal/fd$a;Lcom/google/android/gms/internal/fo;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/fz$a;Lcom/google/android/gms/internal/fd$a;Lcom/google/android/gms/internal/fo;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/gg;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/fn;->mw:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/fn;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object p1, p1, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iput-object p1, p0, Lcom/google/android/gms/internal/fn;->sZ:Lcom/google/android/gms/internal/fk;

    iput-object p2, p0, Lcom/google/android/gms/internal/fn;->tm:Lcom/google/android/gms/internal/fd$a;

    iput-object p3, p0, Lcom/google/android/gms/internal/fn;->tU:Lcom/google/android/gms/internal/fo;

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/fn;)Lcom/google/android/gms/internal/fd$a;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/fn;->tm:Lcom/google/android/gms/internal/fd$a;

    return-object p0
.end method

.method private r(I)Lcom/google/android/gms/internal/fz;
    .locals 31

    move-object/from16 v0, p0

    move/from16 v5, p1

    new-instance v30, Lcom/google/android/gms/internal/fz;

    move-object/from16 v1, v30

    iget-object v2, v0, Lcom/google/android/gms/internal/fn;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v2, v2, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v2, v2, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->sZ:Lcom/google/android/gms/internal/fk;

    iget v8, v3, Lcom/google/android/gms/internal/fk;->orientation:I

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->sZ:Lcom/google/android/gms/internal/fk;

    iget-wide v9, v3, Lcom/google/android/gms/internal/fk;->qj:J

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v3, v3, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v11, v3, Lcom/google/android/gms/internal/fi;->tA:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->sZ:Lcom/google/android/gms/internal/fk;

    iget-wide v3, v3, Lcom/google/android/gms/internal/fk;->tJ:J

    move-wide/from16 v18, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v3, v3, Lcom/google/android/gms/internal/fz$a;->lH:Lcom/google/android/gms/internal/ay;

    move-object/from16 v20, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->sZ:Lcom/google/android/gms/internal/fk;

    iget-wide v3, v3, Lcom/google/android/gms/internal/fk;->tH:J

    move-wide/from16 v21, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-wide v3, v3, Lcom/google/android/gms/internal/fz$a;->vs:J

    move-wide/from16 v23, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->sZ:Lcom/google/android/gms/internal/fk;

    iget-wide v3, v3, Lcom/google/android/gms/internal/fk;->tM:J

    move-wide/from16 v25, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/fn;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v3, v3, Lcom/google/android/gms/internal/fk;->tN:Ljava/lang/String;

    move-object/from16 v27, v3

    iget-object v0, v0, Lcom/google/android/gms/internal/fn;->tn:Lcom/google/android/gms/internal/fz$a;

    iget-object v0, v0, Lcom/google/android/gms/internal/fz$a;->vp:Lorg/json/JSONObject;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-direct/range {v1 .. v29}, Lcom/google/android/gms/internal/fz;-><init>(Lcom/google/android/gms/internal/av;Lcom/google/android/gms/internal/gv;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/cu;Ljava/lang/String;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/co;JLcom/google/android/gms/internal/ay;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/internal/bq$a;)V

    return-object v30
.end method


# virtual methods
.method public co()V
    .locals 6

    const/4 v0, -0x1

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/fn;->mw:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    iget-object v3, p0, Lcom/google/android/gms/internal/fn;->tU:Lcom/google/android/gms/internal/fo;

    invoke-static {v3}, Lcom/google/android/gms/internal/gi;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/gms/internal/fn;->tV:Ljava/util/concurrent/Future;

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/32 v4, 0xea60

    invoke-interface {v3, v4, v5, v2}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/fz;
    :try_end_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_2

    const/4 v0, -0x2

    move-object v1, v2

    goto :goto_0

    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_4 .. :try_end_4} :catch_2

    :catch_0
    const/4 v0, 0x0

    goto :goto_0

    :catch_1
    const-string v0, "Timed out waiting for native ad."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    const/4 v0, 0x2

    :catch_2
    :goto_0
    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/fn;->r(I)Lcom/google/android/gms/internal/fz;

    move-result-object v1

    :goto_1
    sget-object v0, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/fn$1;

    invoke-direct {v2, p0, v1}, Lcom/google/android/gms/internal/fn$1;-><init>(Lcom/google/android/gms/internal/fn;Lcom/google/android/gms/internal/fz;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onStop()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/fn;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/fn;->tV:Ljava/util/concurrent/Future;

    if-eqz p0, :cond_0

    const/4 v1, 0x1

    invoke-interface {p0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

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
