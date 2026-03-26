.class public final Lcom/google/android/gms/internal/ck;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final lq:Lcom/google/android/gms/internal/ct;

.field private final mContext:Landroid/content/Context;

.field private final mw:Ljava/lang/Object;

.field private final pQ:Lcom/google/android/gms/internal/fi;

.field private final pR:Lcom/google/android/gms/internal/cm;

.field private pS:Z

.field private pT:Lcom/google/android/gms/internal/cp;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/ct;Lcom/google/android/gms/internal/cm;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ck;->mw:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ck;->pS:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/ck;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/ck;->pQ:Lcom/google/android/gms/internal/fi;

    iput-object p3, p0, Lcom/google/android/gms/internal/ck;->lq:Lcom/google/android/gms/internal/ct;

    iput-object p4, p0, Lcom/google/android/gms/internal/ck;->pR:Lcom/google/android/gms/internal/cm;

    return-void
.end method


# virtual methods
.method public a(JJ)Lcom/google/android/gms/internal/cq;
    .locals 15

    move-object v0, p0

    const-string v1, "Starting mediation."

    invoke-static {v1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-object v1, v0, Lcom/google/android/gms/internal/ck;->pR:Lcom/google/android/gms/internal/cm;

    iget-object v1, v1, Lcom/google/android/gms/internal/cm;->qd:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/cl;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Trying mediation network: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v2, Lcom/google/android/gms/internal/cl;->pX:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/google/android/gms/internal/cl;->pY:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Ljava/lang/String;

    iget-object v13, v0, Lcom/google/android/gms/internal/ck;->mw:Ljava/lang/Object;

    monitor-enter v13

    :try_start_0
    iget-boolean v3, v0, Lcom/google/android/gms/internal/ck;->pS:Z

    if-eqz v3, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/cq;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/cq;-><init>(I)V

    monitor-exit v13

    return-object v0

    :cond_1
    new-instance v14, Lcom/google/android/gms/internal/cp;

    iget-object v4, v0, Lcom/google/android/gms/internal/ck;->mContext:Landroid/content/Context;

    iget-object v6, v0, Lcom/google/android/gms/internal/ck;->lq:Lcom/google/android/gms/internal/ct;

    iget-object v7, v0, Lcom/google/android/gms/internal/ck;->pR:Lcom/google/android/gms/internal/cm;

    iget-object v3, v0, Lcom/google/android/gms/internal/ck;->pQ:Lcom/google/android/gms/internal/fi;

    iget-object v9, v3, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object v3, v0, Lcom/google/android/gms/internal/ck;->pQ:Lcom/google/android/gms/internal/fi;

    iget-object v10, v3, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget-object v3, v0, Lcom/google/android/gms/internal/ck;->pQ:Lcom/google/android/gms/internal/fi;

    iget-object v11, v3, Lcom/google/android/gms/internal/fi;->lD:Lcom/google/android/gms/internal/gt;

    move-object v3, v14

    move-object v8, v2

    invoke-direct/range {v3 .. v11}, Lcom/google/android/gms/internal/cp;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/ct;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/av;Lcom/google/android/gms/internal/ay;Lcom/google/android/gms/internal/gt;)V

    iput-object v14, v0, Lcom/google/android/gms/internal/ck;->pT:Lcom/google/android/gms/internal/cp;

    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-wide/from16 v3, p1

    move-wide/from16 v5, p3

    invoke-virtual {v14, v3, v4, v5, v6}, Lcom/google/android/gms/internal/cp;->b(JJ)Lcom/google/android/gms/internal/cq;

    move-result-object v7

    iget v8, v7, Lcom/google/android/gms/internal/cq;->qx:I

    if-nez v8, :cond_2

    const-string v0, "Adapter succeeded."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    return-object v7

    :cond_2
    iget-object v8, v7, Lcom/google/android/gms/internal/cq;->qz:Lcom/google/android/gms/internal/cu;

    if-eqz v8, :cond_0

    sget-object v8, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v9, Lcom/google/android/gms/internal/ck$1;

    invoke-direct {v9, p0, v7}, Lcom/google/android/gms/internal/ck$1;-><init>(Lcom/google/android/gms/internal/ck;Lcom/google/android/gms/internal/cq;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_3
    move-wide/from16 v3, p1

    move-wide/from16 v5, p3

    goto/16 :goto_0

    :cond_4
    new-instance v0, Lcom/google/android/gms/internal/cq;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/cq;-><init>(I)V

    return-object v0
.end method

.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/ck;->mw:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/gms/internal/ck;->pS:Z

    iget-object p0, p0, Lcom/google/android/gms/internal/ck;->pT:Lcom/google/android/gms/internal/cp;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/cp;->cancel()V

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
