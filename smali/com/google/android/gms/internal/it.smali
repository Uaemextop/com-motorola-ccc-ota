.class public final Lcom/google/android/gms/internal/it;
.super Ljava/lang/Object;


# static fields
.field private static final Gr:Lcom/google/android/gms/internal/ip;

.field public static final Hz:Ljava/lang/Object;


# instance fields
.field private Hv:J

.field private Hw:J

.field private Hx:J

.field private Hy:Lcom/google/android/gms/internal/is;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/ip;

    const-string v1, "RequestTracker"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ip;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/it;->Gr:Lcom/google/android/gms/internal/ip;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/internal/it;->Hv:J

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/google/android/gms/internal/it;->Hx:J

    return-void
.end method

.method private fU()V
    .locals 2

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/internal/it;->Hw:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/it;->Hy:Lcom/google/android/gms/internal/is;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/it;->Hx:J

    return-void
.end method


# virtual methods
.method public a(JLcom/google/android/gms/internal/is;)V
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/it;->Hy:Lcom/google/android/gms/internal/is;

    iget-wide v2, p0, Lcom/google/android/gms/internal/it;->Hw:J

    iput-wide p1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    iput-object p3, p0, Lcom/google/android/gms/internal/it;->Hy:Lcom/google/android/gms/internal/is;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/gms/internal/it;->Hx:J

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    invoke-interface {v1, v2, v3}, Lcom/google/android/gms/internal/is;->n(J)V

    :cond_0
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public b(JILorg/json/JSONObject;)Z
    .locals 5

    sget-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    if-eqz v3, :cond_0

    cmp-long v3, v1, p1

    if-nez v3, :cond_0

    sget-object v3, Lcom/google/android/gms/internal/it;->Gr:Lcom/google/android/gms/internal/ip;

    const-string v4, "request %d completed"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v4, v1}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/it;->Hy:Lcom/google/android/gms/internal/is;

    invoke-direct {p0}, Lcom/google/android/gms/internal/it;->fU()V

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    const/4 v1, 0x0

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    invoke-interface {v1, p1, p2, p3, p4}, Lcom/google/android/gms/internal/is;->a(JILorg/json/JSONObject;)V

    :cond_1
    return p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public clear()V
    .locals 5

    sget-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/it;->fU()V

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

.method public d(JI)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/gms/internal/it;->b(JILorg/json/JSONObject;)Z

    move-result p0

    return p0
.end method

.method public e(JI)Z
    .locals 7

    sget-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    iget-wide v5, p0, Lcom/google/android/gms/internal/it;->Hx:J

    sub-long/2addr p1, v5

    iget-wide v5, p0, Lcom/google/android/gms/internal/it;->Hv:J

    cmp-long p1, p1, v5

    if-ltz p1, :cond_0

    sget-object p1, Lcom/google/android/gms/internal/it;->Gr:Lcom/google/android/gms/internal/ip;

    const-string p2, "request %d timed out"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-wide p1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    iget-object v1, p0, Lcom/google/android/gms/internal/it;->Hy:Lcom/google/android/gms/internal/is;

    invoke-direct {p0}, Lcom/google/android/gms/internal/it;->fU()V

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    const-wide/16 p1, 0x0

    move-object v1, v4

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    invoke-interface {v1, p1, p2, p3, v4}, Lcom/google/android/gms/internal/is;->a(JILorg/json/JSONObject;)V

    :cond_1
    return p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public fV()Z
    .locals 5

    sget-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    const-wide/16 v3, -0x1

    cmp-long p0, v1, v3

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public p(J)Z
    .locals 5

    sget-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/it;->Hw:J

    const-wide/16 v3, -0x1

    cmp-long p0, v1, v3

    if-eqz p0, :cond_0

    cmp-long p0, v1, p1

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
