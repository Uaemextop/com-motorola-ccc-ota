.class Lcom/google/android/gms/tagmanager/o;
.super Lcom/google/android/gms/common/api/BaseImplementation$AbstractPendingResult;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/o$d;,
        Lcom/google/android/gms/tagmanager/o$c;,
        Lcom/google/android/gms/tagmanager/o$b;,
        Lcom/google/android/gms/tagmanager/o$a;,
        Lcom/google/android/gms/tagmanager/o$e;,
        Lcom/google/android/gms/tagmanager/o$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/BaseImplementation$AbstractPendingResult<",
        "Lcom/google/android/gms/tagmanager/ContainerHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final IH:Landroid/os/Looper;

.field private aoA:Lcom/google/android/gms/tagmanager/o$a;

.field private final aoc:Ljava/lang/String;

.field private aoh:J

.field private final aoo:Lcom/google/android/gms/tagmanager/TagManager;

.field private final aor:Lcom/google/android/gms/tagmanager/o$d;

.field private final aos:Lcom/google/android/gms/tagmanager/cg;

.field private final aot:I

.field private aou:Lcom/google/android/gms/tagmanager/o$f;

.field private volatile aov:Lcom/google/android/gms/tagmanager/n;

.field private volatile aow:Z

.field private aox:Lcom/google/android/gms/internal/c$j;

.field private aoy:Ljava/lang/String;

.field private aoz:Lcom/google/android/gms/tagmanager/o$e;

.field private final mContext:Landroid/content/Context;

.field private final yD:Lcom/google/android/gms/internal/ju;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/o$f;Lcom/google/android/gms/tagmanager/o$e;Lcom/google/android/gms/internal/ju;Lcom/google/android/gms/tagmanager/cg;)V
    .locals 1

    if-nez p3, :cond_0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p3

    :goto_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/BaseImplementation$AbstractPendingResult;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/o;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    if-nez p3, :cond_1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    :cond_1
    iput-object p3, p0, Lcom/google/android/gms/tagmanager/o;->IH:Landroid/os/Looper;

    iput-object p4, p0, Lcom/google/android/gms/tagmanager/o;->aoc:Ljava/lang/String;

    iput p5, p0, Lcom/google/android/gms/tagmanager/o;->aot:I

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    iput-object p7, p0, Lcom/google/android/gms/tagmanager/o;->aoz:Lcom/google/android/gms/tagmanager/o$e;

    new-instance p1, Lcom/google/android/gms/tagmanager/o$d;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/tagmanager/o$d;-><init>(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/tagmanager/o$1;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aor:Lcom/google/android/gms/tagmanager/o$d;

    new-instance p1, Lcom/google/android/gms/internal/c$j;

    invoke-direct {p1}, Lcom/google/android/gms/internal/c$j;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aox:Lcom/google/android/gms/internal/c$j;

    iput-object p8, p0, Lcom/google/android/gms/tagmanager/o;->yD:Lcom/google/android/gms/internal/ju;

    iput-object p9, p0, Lcom/google/android/gms/tagmanager/o;->aos:Lcom/google/android/gms/tagmanager/cg;

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/o;->oa()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/google/android/gms/tagmanager/ce;->oJ()Lcom/google/android/gms/tagmanager/ce;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/ce;->oL()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/o;->cr(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/r;)V
    .locals 18

    move-object/from16 v1, p1

    move-object/from16 v4, p4

    new-instance v6, Lcom/google/android/gms/tagmanager/cq;

    invoke-direct {v6, v1, v4}, Lcom/google/android/gms/tagmanager/cq;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v7, Lcom/google/android/gms/tagmanager/cp;

    move-object/from16 v0, p6

    invoke-direct {v7, v1, v4, v0}, Lcom/google/android/gms/tagmanager/cp;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/tagmanager/r;)V

    invoke-static {}, Lcom/google/android/gms/internal/jw;->hA()Lcom/google/android/gms/internal/ju;

    move-result-object v8

    new-instance v17, Lcom/google/android/gms/tagmanager/bf;

    const-string v15, "refreshing"

    invoke-static {}, Lcom/google/android/gms/internal/jw;->hA()Lcom/google/android/gms/internal/ju;

    move-result-object v16

    const/16 v10, 0x1e

    const-wide/32 v11, 0xdbba0

    const-wide/16 v13, 0x1388

    move-object/from16 v9, v17

    invoke-direct/range {v9 .. v16}, Lcom/google/android/gms/tagmanager/bf;-><init>(IJJLjava/lang/String;Lcom/google/android/gms/internal/ju;)V

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/tagmanager/o;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/o$f;Lcom/google/android/gms/tagmanager/o$e;Lcom/google/android/gms/internal/ju;Lcom/google/android/gms/tagmanager/cg;)V

    return-void
.end method

.method private T(Z)V
    .locals 11

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    new-instance v1, Lcom/google/android/gms/tagmanager/o$b;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/tagmanager/o$b;-><init>(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/tagmanager/o$1;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/o$f;->a(Lcom/google/android/gms/tagmanager/bg;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aoz:Lcom/google/android/gms/tagmanager/o$e;

    new-instance v1, Lcom/google/android/gms/tagmanager/o$c;

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/tagmanager/o$c;-><init>(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/tagmanager/o$1;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/o$e;->a(Lcom/google/android/gms/tagmanager/bg;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    iget v1, p0, Lcom/google/android/gms/tagmanager/o;->aot:I

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/o$f;->ff(I)Lcom/google/android/gms/tagmanager/cr$c;

    move-result-object v8

    if-eqz v8, :cond_0

    new-instance v0, Lcom/google/android/gms/tagmanager/n;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/o;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    iget-object v9, p0, Lcom/google/android/gms/tagmanager/o;->IH:Landroid/os/Looper;

    new-instance v10, Lcom/google/android/gms/tagmanager/Container;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/o;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/o;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/TagManager;->getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/tagmanager/o;->aoc:Ljava/lang/String;

    const-wide/16 v6, 0x0

    move-object v2, v10

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/tagmanager/Container;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Ljava/lang/String;JLcom/google/android/gms/tagmanager/cr$c;)V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/o;->aor:Lcom/google/android/gms/tagmanager/o$d;

    invoke-direct {v0, v1, v9, v10, v2}, Lcom/google/android/gms/tagmanager/n;-><init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/n$a;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    :cond_0
    new-instance v0, Lcom/google/android/gms/tagmanager/o$2;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/tagmanager/o$2;-><init>(Lcom/google/android/gms/tagmanager/o;Z)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aoA:Lcom/google/android/gms/tagmanager/o$a;

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/o;->oa()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->aoz:Lcom/google/android/gms/tagmanager/o$e;

    const-wide/16 v0, 0x0

    const-string p1, ""

    invoke-interface {p0, v0, v1, p1}, Lcom/google/android/gms/tagmanager/o$e;->e(JLjava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    invoke-interface {p0}, Lcom/google/android/gms/tagmanager/o$f;->oc()V

    :goto_0
    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/internal/ju;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->yD:Lcom/google/android/gms/internal/ju;

    return-object p0
.end method

.method private declared-synchronized a(Lcom/google/android/gms/internal/c$j;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/ol$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ol$a;-><init>()V

    iget-wide v1, p0, Lcom/google/android/gms/tagmanager/o;->aoh:J

    iput-wide v1, v0, Lcom/google/android/gms/internal/ol$a;->asr:J

    new-instance v1, Lcom/google/android/gms/internal/c$f;

    invoke-direct {v1}, Lcom/google/android/gms/internal/c$f;-><init>()V

    iput-object v1, v0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    iput-object p1, v0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    invoke-interface {p1, v0}, Lcom/google/android/gms/tagmanager/o$f;->b(Lcom/google/android/gms/internal/ol$a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized a(Lcom/google/android/gms/internal/c$j;JZ)V
    .locals 9

    monitor-enter p0

    if-eqz p4, :cond_0

    :try_start_0
    iget-boolean p4, p0, Lcom/google/android/gms/tagmanager/o;->aow:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p4, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/o;->isReady()Z

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aox:Lcom/google/android/gms/internal/c$j;

    iput-wide p2, p0, Lcom/google/android/gms/tagmanager/o;->aoh:J

    const-wide/32 v0, 0x2932e00

    add-long v2, p2, v0

    iget-object p4, p0, Lcom/google/android/gms/tagmanager/o;->yD:Lcom/google/android/gms/internal/ju;

    invoke-interface {p4}, Lcom/google/android/gms/internal/ju;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/o;->w(J)V

    new-instance p4, Lcom/google/android/gms/tagmanager/Container;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/o;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/TagManager;->getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/tagmanager/o;->aoc:Ljava/lang/String;

    move-object v2, p4

    move-wide v6, p2

    move-object v8, p1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/tagmanager/Container;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Ljava/lang/String;JLcom/google/android/gms/internal/c$j;)V

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    if-nez p1, :cond_1

    new-instance p1, Lcom/google/android/gms/tagmanager/n;

    iget-object p2, p0, Lcom/google/android/gms/tagmanager/o;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    iget-object p3, p0, Lcom/google/android/gms/tagmanager/o;->IH:Landroid/os/Looper;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aor:Lcom/google/android/gms/tagmanager/o$d;

    invoke-direct {p1, p2, p3, p4, v0}, Lcom/google/android/gms/tagmanager/n;-><init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/n$a;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    invoke-virtual {p1, p4}, Lcom/google/android/gms/tagmanager/n;->a(Lcom/google/android/gms/tagmanager/Container;)V

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/o;->isReady()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aoA:Lcom/google/android/gms/tagmanager/o$a;

    invoke-interface {p1, p4}, Lcom/google/android/gms/tagmanager/o$a;->b(Lcom/google/android/gms/tagmanager/Container;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/o;->b(Lcom/google/android/gms/common/api/Result;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method static synthetic a(Lcom/google/android/gms/tagmanager/o;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/o;->w(J)V

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/internal/c$j;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/internal/c$j;)V

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/internal/c$j;JZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/internal/c$j;JZ)V

    return-void
.end method

.method static synthetic b(Lcom/google/android/gms/tagmanager/o;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/tagmanager/o;->aow:Z

    return p0
.end method

.method static synthetic c(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/internal/c$j;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->aox:Lcom/google/android/gms/internal/c$j;

    return-object p0
.end method

.method static synthetic d(Lcom/google/android/gms/tagmanager/o;)J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/o;->aoh:J

    return-wide v0
.end method

.method static synthetic e(Lcom/google/android/gms/tagmanager/o;)Z
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/o;->oa()Z

    move-result p0

    return p0
.end method

.method static synthetic f(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/tagmanager/n;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    return-object p0
.end method

.method static synthetic g(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/tagmanager/cg;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->aos:Lcom/google/android/gms/tagmanager/cg;

    return-object p0
.end method

.method private oa()Z
    .locals 3

    invoke-static {}, Lcom/google/android/gms/tagmanager/ce;->oJ()Lcom/google/android/gms/tagmanager/ce;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ce;->oK()Lcom/google/android/gms/tagmanager/ce$a;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/tagmanager/ce$a;->aqi:Lcom/google/android/gms/tagmanager/ce$a;

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ce;->oK()Lcom/google/android/gms/tagmanager/ce$a;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/tagmanager/ce$a;->aqj:Lcom/google/android/gms/tagmanager/ce$a;

    if-ne v1, v2, :cond_1

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->aoc:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ce;->getContainerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private declared-synchronized w(J)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aoz:Lcom/google/android/gms/tagmanager/o$e;

    if-nez v0, :cond_0

    const-string p1, "Refresh requested, but no network load scheduler."

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/o;->aox:Lcom/google/android/gms/internal/c$j;

    iget-object v1, v1, Lcom/google/android/gms/internal/c$j;->gt:Ljava/lang/String;

    invoke-interface {v0, p1, p2, v1}, Lcom/google/android/gms/tagmanager/o$e;->e(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method protected aE(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o;->aov:Lcom/google/android/gms/tagmanager/n;

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/android/gms/common/api/Status;->Jy:Lcom/google/android/gms/common/api/Status;

    if-ne p1, p0, :cond_1

    const-string p0, "timer expired: setting result to failure"

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    :cond_1
    new-instance p0, Lcom/google/android/gms/tagmanager/n;

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/n;-><init>(Lcom/google/android/gms/common/api/Status;)V

    return-object p0
.end method

.method protected synthetic c(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/o;->aE(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object p0

    return-object p0
.end method

.method declared-synchronized cr(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o;->aoy:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aoz:Lcom/google/android/gms/tagmanager/o$e;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/o$e;->cu(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized nU()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aoy:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public nX()V
    .locals 9

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    iget v1, p0, Lcom/google/android/gms/tagmanager/o;->aot:I

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/o$f;->ff(I)Lcom/google/android/gms/tagmanager/cr$c;

    move-result-object v8

    const/4 v0, 0x0

    if-eqz v8, :cond_0

    new-instance v1, Lcom/google/android/gms/tagmanager/Container;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/o;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/o;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/TagManager;->getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/tagmanager/o;->aoc:Ljava/lang/String;

    const-wide/16 v6, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/tagmanager/Container;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Ljava/lang/String;JLcom/google/android/gms/tagmanager/cr$c;)V

    new-instance v2, Lcom/google/android/gms/tagmanager/n;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/o;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    iget-object v4, p0, Lcom/google/android/gms/tagmanager/o;->IH:Landroid/os/Looper;

    new-instance v5, Lcom/google/android/gms/tagmanager/o$1;

    invoke-direct {v5, p0}, Lcom/google/android/gms/tagmanager/o$1;-><init>(Lcom/google/android/gms/tagmanager/o;)V

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/google/android/gms/tagmanager/n;-><init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/n$a;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/o;->b(Lcom/google/android/gms/common/api/Result;)V

    goto :goto_0

    :cond_0
    const-string v1, "Default was requested, but no default container was found"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/common/api/Status;

    const/16 v3, 0xa

    invoke-direct {v2, v3, v1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/o;->aE(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/tagmanager/o;->b(Lcom/google/android/gms/common/api/Result;)V

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aoz:Lcom/google/android/gms/tagmanager/o$e;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/o;->aou:Lcom/google/android/gms/tagmanager/o$f;

    return-void
.end method

.method public nY()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/o;->T(Z)V

    return-void
.end method

.method public nZ()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/o;->T(Z)V

    return-void
.end method
