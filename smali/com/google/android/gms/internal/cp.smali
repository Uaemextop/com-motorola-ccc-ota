.class public final Lcom/google/android/gms/internal/cp;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/cq$a;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final lq:Lcom/google/android/gms/internal/ct;

.field private final mContext:Landroid/content/Context;

.field private final ml:Lcom/google/android/gms/internal/av;

.field private final mw:Ljava/lang/Object;

.field private final qo:Ljava/lang/String;

.field private final qp:J

.field private final qq:Lcom/google/android/gms/internal/cl;

.field private final qr:Lcom/google/android/gms/internal/ay;

.field private final qs:Lcom/google/android/gms/internal/gt;

.field private qt:Lcom/google/android/gms/internal/cu;

.field private qu:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/ct;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/av;Lcom/google/android/gms/internal/ay;Lcom/google/android/gms/internal/gt;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    const/4 v0, -0x2

    iput v0, p0, Lcom/google/android/gms/internal/cp;->qu:I

    iput-object p1, p0, Lcom/google/android/gms/internal/cp;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/cp;->lq:Lcom/google/android/gms/internal/ct;

    iput-object p5, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    const-string p1, "com.google.ads.mediation.customevent.CustomEventAdapter"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/cp;->bE()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/cp;->qo:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iput-object p2, p0, Lcom/google/android/gms/internal/cp;->qo:Ljava/lang/String;

    :goto_0
    iget-wide p1, p4, Lcom/google/android/gms/internal/cm;->qe:J

    const-wide/16 v0, -0x1

    cmp-long p1, p1, v0

    if-eqz p1, :cond_1

    iget-wide p1, p4, Lcom/google/android/gms/internal/cm;->qe:J

    goto :goto_1

    :cond_1
    const-wide/16 p1, 0x2710

    :goto_1
    iput-wide p1, p0, Lcom/google/android/gms/internal/cp;->qp:J

    iput-object p6, p0, Lcom/google/android/gms/internal/cp;->ml:Lcom/google/android/gms/internal/av;

    iput-object p7, p0, Lcom/google/android/gms/internal/cp;->qr:Lcom/google/android/gms/internal/ay;

    iput-object p8, p0, Lcom/google/android/gms/internal/cp;->qs:Lcom/google/android/gms/internal/gt;

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/cp;Lcom/google/android/gms/internal/cu;)Lcom/google/android/gms/internal/cu;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/internal/cp;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    return-object p0
.end method

.method private a(JJJJ)V
    .locals 2

    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/cp;->qu:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    invoke-direct/range {p0 .. p8}, Lcom/google/android/gms/internal/cp;->b(JJJJ)V

    goto :goto_0
.end method

.method private a(Lcom/google/android/gms/internal/co;)V
    .locals 7

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qs:Lcom/google/android/gms/internal/gt;

    iget v0, v0, Lcom/google/android/gms/internal/gt;->wF:I

    const v1, 0x3e8fa0

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qr:Lcom/google/android/gms/internal/ay;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/ay;->og:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/cp;->ml:Lcom/google/android/gms/internal/av;

    iget-object v3, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v3, v3, Lcom/google/android/gms/internal/cl;->qc:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v3, p1}, Lcom/google/android/gms/internal/cu;->a(Lcom/google/android/gms/dynamic/d;Lcom/google/android/gms/internal/av;Ljava/lang/String;Lcom/google/android/gms/internal/cv;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/cp;->qr:Lcom/google/android/gms/internal/ay;

    iget-object v3, p0, Lcom/google/android/gms/internal/cp;->ml:Lcom/google/android/gms/internal/av;

    iget-object v4, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v4, v4, Lcom/google/android/gms/internal/cl;->qc:Ljava/lang/String;

    move-object v5, p1

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/cu;->a(Lcom/google/android/gms/dynamic/d;Lcom/google/android/gms/internal/ay;Lcom/google/android/gms/internal/av;Ljava/lang/String;Lcom/google/android/gms/internal/cv;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qr:Lcom/google/android/gms/internal/ay;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/ay;->og:Z

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/cp;->ml:Lcom/google/android/gms/internal/av;

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v4, v0, Lcom/google/android/gms/internal/cl;->qc:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v5, v0, Lcom/google/android/gms/internal/cl;->pW:Ljava/lang/String;

    move-object v6, p1

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/internal/cu;->a(Lcom/google/android/gms/dynamic/d;Lcom/google/android/gms/internal/av;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/cv;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/cp;->qr:Lcom/google/android/gms/internal/ay;

    iget-object v3, p0, Lcom/google/android/gms/internal/cp;->ml:Lcom/google/android/gms/internal/av;

    iget-object v4, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v4, v4, Lcom/google/android/gms/internal/cl;->qc:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v5, v5, Lcom/google/android/gms/internal/cl;->pW:Ljava/lang/String;

    move-object v6, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/cu;->a(Lcom/google/android/gms/dynamic/d;Lcom/google/android/gms/internal/ay;Lcom/google/android/gms/internal/av;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/cv;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Could not request ad from mediation adapter."

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x5

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/cp;->j(I)V

    :goto_0
    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/cp;Lcom/google/android/gms/internal/co;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/cp;->a(Lcom/google/android/gms/internal/co;)V

    return-void
.end method

.method static synthetic b(Lcom/google/android/gms/internal/cp;)I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/cp;->qu:I

    return p0
.end method

.method private b(JJJJ)V
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long p1, v0, p1

    sub-long/2addr p3, p1

    sub-long/2addr v0, p5

    sub-long/2addr p7, v0

    const-wide/16 p1, 0x0

    cmp-long p5, p3, p1

    if-lez p5, :cond_1

    cmp-long p1, p7, p1

    if-gtz p1, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    invoke-static {p3, p4, p7, p8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/cp;->qu:I

    :goto_0
    return-void

    :cond_1
    :goto_1
    const-string p1, "Timed out waiting for adapter."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    const/4 p1, 0x3

    iput p1, p0, Lcom/google/android/gms/internal/cp;->qu:I

    return-void
.end method

.method private bE()Ljava/lang/String;
    .locals 2

    const-string v0, "com.google.ads.mediation.customevent.CustomEventAdapter"

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v1, v1, Lcom/google/android/gms/internal/cl;->qa:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->lq:Lcom/google/android/gms/internal/ct;

    iget-object p0, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object p0, p0, Lcom/google/android/gms/internal/cl;->qa:Ljava/lang/String;

    invoke-interface {v1, p0}, Lcom/google/android/gms/internal/ct;->y(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string v0, "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter"
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v0

    :catch_0
    const-string p0, "Fail to determine the custom event\'s version, assuming the old one."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    :cond_1
    return-object v0
.end method

.method private bF()Lcom/google/android/gms/internal/cu;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Instantiating mediation adapter: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->qo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->lq:Lcom/google/android/gms/internal/ct;

    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->qo:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/ct;->x(Ljava/lang/String;)Lcom/google/android/gms/internal/cu;

    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not instantiate mediation adapter: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/cp;->qo:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/gs;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic c(Lcom/google/android/gms/internal/cp;)Lcom/google/android/gms/internal/cu;
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/cp;->bF()Lcom/google/android/gms/internal/cu;

    move-result-object p0

    return-object p0
.end method

.method static synthetic d(Lcom/google/android/gms/internal/cp;)Lcom/google/android/gms/internal/cu;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    return-object p0
.end method


# virtual methods
.method public b(JJ)Lcom/google/android/gms/internal/cq;
    .locals 11

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    new-instance v10, Lcom/google/android/gms/internal/co;

    invoke-direct {v10}, Lcom/google/android/gms/internal/co;-><init>()V

    sget-object v1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/cp$1;

    invoke-direct {v4, p0, v10}, Lcom/google/android/gms/internal/cp$1;-><init>(Lcom/google/android/gms/internal/cp;Lcom/google/android/gms/internal/co;)V

    invoke-virtual {v1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-wide v4, p0, Lcom/google/android/gms/internal/cp;->qp:J

    move-object v1, p0

    move-wide v6, p1

    move-wide v8, p3

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/internal/cp;->a(JJJJ)V

    new-instance p1, Lcom/google/android/gms/internal/cq;

    iget-object v5, p0, Lcom/google/android/gms/internal/cp;->qq:Lcom/google/android/gms/internal/cl;

    iget-object v6, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    iget-object v7, p0, Lcom/google/android/gms/internal/cp;->qo:Ljava/lang/String;

    iget v9, p0, Lcom/google/android/gms/internal/cp;->qu:I

    move-object v4, p1

    move-object v8, v10

    invoke-direct/range {v4 .. v9}, Lcom/google/android/gms/internal/cq;-><init>(Lcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/cu;Ljava/lang/String;Lcom/google/android/gms/internal/co;I)V

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public cancel()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/cp;->qt:Lcom/google/android/gms/internal/cu;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/google/android/gms/internal/cu;->destroy()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "Could not destroy mediation adapter."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/gms/internal/cp;->qu:I

    iget-object p0, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public j(I)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/cp;->qu:I

    iget-object p0, p0, Lcom/google/android/gms/internal/cp;->mw:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
